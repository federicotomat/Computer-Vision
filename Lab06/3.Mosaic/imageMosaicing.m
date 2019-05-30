%% Lab06-02

addpath('3.Mosaic\include');
addpath('3.Mosaic\input');

folder = '3.Mosaic\input';

loop  = true;
while(loop)
    prompt = 'Choose how many points do you want to consider (at least 8): ';
    Npoints = input(prompt); % Request to user the number of points he want to use
    if Npoints < 4
        disp('You have choosen a number < 8');
    else
        loop = false; 
    end
end

% Look into the folder content assuming there are only image files
S = dir(folder);
Nimg = length(S)-2;

% Loading the images
for k = 3 : length(S)
    I{k-2}=imread([folder,'/',S(k).name]);
    I{k-2}=rgb2gray(I{k-2});
    I{k-2}=I{k-2}(1:5:size(I{k-2},1), 1:5:size(I{k-2},2)); % Resize the images if too big...
end

%%
% The central image of the sequence is assumed to be the reference 
Nref = round(length(I)/2);

% FIRST SOLUTION: ESTIMATE THE HOMOGRAPHIES FROM ALL THE IMAGES FROM THE
% SEQUENCE AND THE REFERENCE ONE

loop  = true;
while(loop)
    prompt = 'Choose if you want to exec homography insert 1 or to exec ransac insert 2: ';
    n = input(prompt);
    if n < 1 && n > 2
        disp('Input non valid')
    else
        loop = false;
    end
end
        
for k = 1 : length(I) % dEcide here how many images you want to consider
    
    if(k ~= Nref)
        figure, subplot(1,2,1), imshow(I{k}), title(sprintf('Select %d corresponding points on the images', Npoints)), hold on;
        subplot(1,2,2), imshow(I{Nref}), title('Reference image'), hold on;
        
        Xk = zeros(3, Npoints);
        Xk(3,:)=1;
        
        for i = 1 : Npoints
            [xp yp] = ginput(1);
            Xk(1,i) = xp;
            Xk(2,i) = yp;
            plot([xp],[yp],'*r');
            text(xp+5,yp-5,sprintf('%d',i), 'Color', 'r');
        end
        
        Xref = zeros(3, Npoints);
        Xref(3,:)=1;
        
        for i = 1 : Npoints
            [xp yp] = ginput(1);
            Xref(1,i)=xp;
            Xref(2,i)=yp;
            plot([xp],[yp],'*r');
            text(xp+5,yp-5,sprintf('%d',i), 'Color', 'r');
        end
        
        close all;
        
        if n == 1
            H{k} = my_homography(Xk, Xref);
        else
            H{k} = ransacH(Xk, Xref, .1);
        end

        % DEBUG
        PT{k}=Xk;
        PTref{k} = Xref;
        
    else
        H{k} = eye(3);
    end
end

%% Build the mosaic

% first, we have to infer the size of the mosaic image. A strategy might be
% to compute the coordinate of the 4 boundary corners of each image. Then we 
% keep minimum and maximum of each coordinate, and the gap between them will 
% denote the size of the mosaic


xs = [];
ys = [];

for k = 1 : 3 : length(H)
    
    pt = H{k}*[1 1 1]';
    pt = pt ./ pt(3);
    xs = [xs, pt(1)];
    ys = [ys, pt(2)];
    
    pt = H{k}*[1 size(I{k},1) 1]';
    pt = pt ./ pt(3);
    xs = [xs, pt(1)];
    ys = [ys, pt(2)];
    
    pt = H{k}*[size(I{k},2) 1 1]';
    pt = pt ./ pt(3);
    xs = [xs, pt(1)];
    ys = [ys, pt(2)];
    
    pt = H{k}*[size(I{k},2) size(I{k},1) 1]';
    pt = pt ./ pt(3);
    xs = [xs, pt(1)];
    ys = [ys, pt(2)];
    
end
  
xmin = min(xs);
xmax = max(xs);
ymin = min(ys);
ymax = max(ys);

nrows = round(ymax) - round(ymin) + 1;
ncols = round(xmax) - round(xmin) + 1;

%%
M = zeros(round(nrows), round(ncols));

for k = 1 : 3 : length(H)
    
    M = inverseMappingWithDispl(I{k}, H{k}, M, -xmin, -ymin);
    
end

figure, imshow(uint8(M));
