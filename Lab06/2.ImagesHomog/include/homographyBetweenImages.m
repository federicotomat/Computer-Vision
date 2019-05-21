clc;
clear all;
close all;

I1 = imread('../imagesHomog/SET1_01.jpg'); % put the first image here
I2 = imread('../imagesHomog/SET1_02.jpg'); % put the second image here

disp('Choose 4 points...');
figure, imshow(I1), title('Select 4 points'), hold on;
X1 = zeros(4,2);
for i = 1 : 4
    X1(i,:) = ginput(1);
    plot(X1(i,1), X1(i,2), 'sr');
    text(X1(i,1)-20, X1(i,2)-20, sprintf('%d',i));
end
X1 = [X1'; ones(1,4)];

disp('Choose the corresponding 4 points on the other image ...');
figure, imshow(I2), title('Select 4 points'), hold on;
X2 = zeros(4,2);
for i = 1 : 4
    X2(i,:) = ginput(1);
    plot(X2(i,1), X2(i,2), 'sr');
    text(X2(i,1)-20, X2(i,2)-20, sprintf('%d',i));
end
X2 = [X2'; ones(1,4)];

% estimate the homography
H = my_homography(X1,X2);

% inverse mapping
I3 = inverseMapping(I1, H);
figure, imshow(uint8(I3)), title('Inverse mapping');

Im = (double(I2)+double(I3))/2.;
figure, imshow(uint8(Im)), title('Average image');



