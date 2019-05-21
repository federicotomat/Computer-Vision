clc;
clear all;
close all;

%% Image load and Parameters
I1 = imread('../ImagesPerspDist/original.jpg'); % put here the image name affected by perspective distorsion
n=4;

%% 
string=strcat('Choose ',int2str(n), ' delimiting edges of a distorted shape...');
disp(string);
string=strcat('Select ', int2str(n), ' points');
figure(1), imshow(I1), title(string), hold on;
X1 = zeros(n,2);
for i = 1 : n
    X1(i,:) = ginput(1);
    plot(X1(i,1), X1(i,2), 'sr');
    text(X1(i,1)-20, X1(i,2)-20, sprintf('%d', i));
end
X1 = [X1'; ones(1,n)];

string=strcat('Choose ' ,int2str(n),'points delimiting virtual edges of the new non-distorted shape...');
disp(string);
X2 = zeros(n,2);
for i = 1 : n
    X2(i,:) = ginput(1);
    plot(X2(i,1), X2(i,2), 'sg');
    text(X2(i,1)-20, X2(i,2)-20, sprintf('%d', i));
end
X2 = [X2'; ones(1,n)];

% estimate the homography
[H,~] = my_homography(X1,X2);

% direct mapping
I2 = directMapping(I1, H);
figure(2), imshow(uint8(I2)), title('Direct mapping');

% inverse mapping
[I3, I4] = inverseMapping(I1, H);
figure(3), imshow(uint8(I3)), title('Inverse mapping without bilinear interpoletion');
figure(4), imshow(uint8(I4)), title('Inverse mapping with bilinear interpolation');



