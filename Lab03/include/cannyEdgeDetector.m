%% Canny edge detector farlocca di giò ihihihi

function edgeMatrix = cannyEdgeDetector(img,k1,k2)
[img, ~] = filterGauss(img, 3);

%define edge matrix
[row, col] = size(img);
edgeMatrix = zeros(row, col);

% %%Define Robert Cross operator
% P1=[1 0; 0 -1];
% P2=[0 1; -1 0]';

% Define sobel Operator
P1=[1 0 -1;
    2 0 -2;
    1 0 -1];

P2=P1';


% Evaluantion of the gradiendt
G_x = conv2(img,P1, 'same');
G_y = conv2(img,P2, 'same');
theta = rad2deg(atan2(G_y,G_x));
G = sqrt(G_x.^2+G_y.^2);

% Non-maximum suppression 
% the crf is divided in 8 different sectors corresponding to 4 directios N-S,E,
for i = 2:row-1
    for j= 2:col-1
        %WEST<->OVEST
        if -22.5<theta(i,j) && theta(i,j)<22.5 || 157.5<theta(i,j) && theta(i,j)<180 || -180<theta(i,j) && theta(i,j)<-157.5
            if (G(i,j)<G(i,j+1) || G(i,j)<G(i,j-1))
                G(i,j)=0;
            end
            %NORD-EST<->SUD-OVEST
        elseif 22.5<theta(i,j) && theta(i,j)<67.5 || -157.5<theta(i,j) && theta(i,j)<-112.5
            if (G(i,j)<G(i+1,j+1) || G(i,j)<G(i-1,j-1))
                G(i,j)=0;
            end
            %NORD<->SUD
        elseif 67.5<theta(i,j) && theta(i,j)<112.5 || -112.5<theta(i,j) && theta(i,j)<-67.5
            if (G(i,j)<G(i+1,j) || G(i,j)<G(i-1,j))
                G(i,j)=0;
            end
            %NORD-OVEST<->SUD-EST
        elseif 112.5<theta(i,j) && theta(i,j)<157.5 || -67.5<theta(i,j) && theta(i,j)<-22.5
            if (G(i,j)<G(i+1,j-1) || G(i,j)<G(i-1,j+1))
                G(i,j)=0;
            end
        end
    end
end

% Set the treeshold

t1=k1*k2;
t2=k2;


% Turn Off all the pixels with gradient less than t1 and mark as weak edge
   %between t1 and t2, mark as strong edge if > t2
for i = 1:row
    for j= 1:col
        if G(i,j)<t1
            edgeMatrix(i,j)=0;
        elseif t1<G(i,j) && G(i,j)<t2
            edgeMatrix(i,j)=2;
        elseif G(i,j)>t2
            edgeMatrix(i,j)=1;
        end
    end
end


% Remove element if has a nord neighbour
for i = 2:row-1
    for j= 2:col-1
        if edgeMatrix(i,j)==2
            if edgeMatrix(i+1,j)==1
                edgeMatrix(i,j)=0;
            end 
        end
    end
end



% Look for connnection in pixels marked as weak edge 8 neighbour
for i = 2:row-1
    for j= 2:col-1
        if edgeMatrix(i,j)==2
            if (edgeMatrix(i-1,j-1)== 1 || edgeMatrix(i,j-1)== 1 ||...
               edgeMatrix(i-1,j)== 1 || edgeMatrix(i+1,j+1)== 1 ||...
               edgeMatrix(i+1,j)== 1 || edgeMatrix(i,j+1)== 1 ||...
               edgeMatrix(i-1,j+1)== 1 || edgeMatrix(i+1,j-1)== 1 )
                edgeMatrix(i,j)=1;
            else
                edgeMatrix(i,j)=0;
            end 
        end
    end
end

% Make zero the pixel in whom i cannot operate
edgeMatrix(:,1)=0;
edgeMatrix(:,end)=0;
edgeMatrix(1,:)=0;
edgeMatrix(end,:)=0;

end



