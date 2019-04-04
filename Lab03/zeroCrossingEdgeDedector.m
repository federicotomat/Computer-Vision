%% Zero Crossing Edge Dedector
% Detect zerocrossings and apply a threshold on the slope of the
% zerocrossing

function edgeMatrix = zeroCrossingEdgeDedector(threshold, convMatrix)
[row, col] = size(convMatrix);

% Initialization of the matrix

edgeMatrix = zeros(row, col); 
        % Scan along each row, record an edge point at the location of the zerocrossing
        for i = 1:row
            for j= 1:col-1
                % Transition {+,-}
                if (convMatrix(i,j) > threshold && convMatrix(i,j+1) < - threshold)
                    edgeMatrix(i,j) = 1;
                    % Transition {-,+}
                elseif (convMatrix(i,j) < - threshold && convMatrix(i,j+1) > threshold)
                    edgeMatrix(i,j) = 1;
                end
            end
        end
        
        % Scan along each column, record an edge point at the location of the zerocrossing
        for i = 1:row-1
            for j= 1:col
                % Transition {+,-}
                if (convMatrix(i,j) > threshold && convMatrix(i+1,j) < - threshold)
                    edgeMatrix(i,j) = 1;
                    % Transition {-,+}
                elseif (convMatrix(i,j) < - threshold && convMatrix(i+1,j) > threshold)
                    edgeMatrix(i,j) = 1;
                end
            end
        end
        
        %Remove element if has a nord neighbour
for i = 2:row-1
    for j= 2:col-1
        if edgeMatrix(i,j)==2
            if edgeMatrix(i+1,j)==1
                edgeMatrix(i,j)=0;
            end 
        end
    end
end


end