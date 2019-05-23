%% Lab06-01

addpath('1.PerspDist\include');
addpath('1.PerspDist\input');

clear all;
close all;

%% Image load and Parameters
I1 = imread('original.jpg'); % put here the image name affected by perspective distorsion
loop  = true;
while(loop)
    prompt = 'Choose how many points do you want to consider (at least 4): ';
    n = input(prompt);
    if n < 4
        disp('You choose a number < 4');
    else
        loop = false; 
    end
end

%% Choose the points

string = strcat({'Choose '}, int2str(n),{' delimiting edges of a distorted shape...'});
disp(string);
string = strcat({'Select '}, int2str(n), {' points'});
figure(1), imshow(I1), title(string), hold on;
X1 = zeros(n,2);
for i = 1 : n
    X1(i,:) = ginput(1);
    plot(X1(i,1), X1(i,2), 'sr');
    text(X1(i,1)-20, X1(i,2)-20, sprintf('%d', i));
end
X1 = [X1'; ones(1,n)];

string=strcat({'Choose '}, int2str(n), {'points delimiting virtual edges of the new non-distorted shape...'});
disp(string);
X2 = zeros(n,2);
for i = 1 : n
    X2(i,:) = ginput(1);
    plot(X2(i,1), X2(i,2), 'sg');
    text(X2(i,1)-20, X2(i,2)-20, sprintf('%d', i));
end
X2 = [X2'; ones(1,n)];


loop  = true;
while(loop)
    prompt = 'Choose if you want to exec homography (1) or ransac (2): ';
    n = input(prompt);
    switch(n)
        case 1
            % Estimate the homography
            [H,~] = my_homography(X1, X2);
            loop = false;
        case 2
            % Use ransac method
            [H,~,~] = ransacH(X1,X2,.1);
            loop = false;
        otherwise
            disp('Input not valid');
    end         
end

% Direct mapping
I2 = directMapping(I1, H);
figure(2), imshow(uint8(I2)), title('Direct mapping');

% Inverse mapping
[I3, I4] = inverseMapping(I1, H);
figure(3), imshow(uint8(I3)), title('Inverse mapping without bilinear interpoletion');
figure(4), imshow(uint8(I4)), title('Inverse mapping with bilinear interpolation');

% Compare result
[H1,~] = my_homography(X1, X2);
[H2,~] = my_homography(X1, X2, flag);
[H3,~,~] = ransacH(X1,X2,.1);

printFigure(3, 1, {directMapping(I1, H1), directMapping(I1, H2), directMapping(I1, H3)},{3,3,3}, {'Homography not Normalized', 'Homography Normalized', 'Ransac Method'}, 1);

[I1, I2] = inverseMapping(I1, H1);
[I3, I4] = inverseMapping(I1, H2);
[I5, I6] = inverseMapping(I1, H3);

printFigure(6, 2, {I1, I3, I5, I2, I4, I6},{3,3,3,3,3,3}, {'Homography not Normalized and not Bi', 'Homography Normalized and not Bi', 'Ransac Method and not Bi', 'Homography not Normalized and Bi', 'Homography Normalized and Bi', 'Ransac Method and Bi'}, 1);




