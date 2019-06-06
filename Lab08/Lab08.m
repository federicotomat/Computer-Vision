%% Lab08

clear all
close all
clc

addpath('include');
addpath('input/Mire');

% Read the input images
img1 = imread('Mire1.pgm');
img2 = imread('Mire2.pgm');

% Load corresponding points
p1 = load('Mire1.points')';
p2 = load('Mire2.points')';

N = length(p1(1,:)); 
p1 = [p1; ones(1,N)]; 
p2 = [p2; ones(1,N)]; 

% 8 point algorithm function without normalization
F1 = EightPointsAlgorithm(p1, p2);

% 8 point algorithm function with normalization
F2 = EightPointsAlgorithmN(p1, p2);

mul = zeros(N, 1);
for i = 1:N
    mul(i) = p2(:,i)' * F1 * p1(:,i);
end
fprintf("The epipolar constraint with Eight Points Algorithm version 1 is: \n");
disp(mul);

visualizeEpipolarLines(img1, img2, F1, p1(1:2,:)', p2(1:2,:)')
uiwait(helpdlg('Visualizing Epipolar 8 point Algo, not normalized, continue to go on'));

[U, W, V] = svd(F1);
rightE = U(:,end);
leftE = V(:,end); 
fprintf("The left and the right epipoles are:(version 1)\n");
disp(leftE);
disp(rightE);
for i = 1:N
    mul(i) = p2(:,i)' * F2 * p1(:,i);
end
fprintf("The epipolar constraint with Eight Points Algorithm version 2 is: \n");
disp(mul);
visualizeEpipolarLines(img1, img2, F2, p1(1:2,:)', p2(1:2,:)')
uiwait(helpdlg('Visualizing Epipolar 8 point Algo, normalized, continue to go on'));

[U, W, V] = svd(F2);
rightE = U(:,end);
leftE = V(:,end); 
fprintf("The left and the right epipoles are:(version 1)\n");
disp(leftE);
disp(rightE);

%% Additional tests
%1. you may try and "break" your estimate by adding more and more erroneous point 
%   correspondences to your points. Since the 8 points algorithm use them all after 
%   a while the  estimate will be wrong.

np1=4;

ErrMat1 = [randi([1 max(max(round(p1/2)))],2,np1); ones(1,np1)];
ErrMat2 = [randi([1 max(max(round(p2/2)))],2,np1); ones(1,np1)];

p1Err = [p1, ErrMat1];
p2Err = [p2, ErrMat2];

%2. In these cases we would need to resort to robust statistics methods such as RANSAC: 
%   you may have a look (and comment) at the behavior of other algorithms implemented 
%   in Matlab (see the function estimateFundamentalMatrix)

F3 = estimateFundamentalMatrix(p1Err(1:2,:)', p2Err(1:2,:)');
F4 = estimateFundamentalMatrix(p1Err(1:2,:)', p2Err(1:2,:)', 'Method','RANSAC');


for i = 1:N
    mul1(i) = p2(:,i)' * F3 * p1(:,i);
    mul2(i) = p2(:,i)' * F4 * p1(:,i);
end

fprintf("The epipolar constraint with Matlab functions is and no random point: \n");

disp(mul1);

fprintf("The epipolar constraint with Matlab functions is and  random point: \n");
disp(mul2)

visualizeEpipolarLines(img1, img2, F3, p1(1:2,:)', p2(1:2,:)');
uiwait(helpdlg('Visualizing MAtlab 8 point Algo,with error not RANSAC, continue to go on'));


visualizeEpipolarLines(img1, img2, F4, p1(1:2,:)', p2(1:2,:)');
uiwait(helpdlg('Visualizing MAtlab 8 point Algo,with error with RANSAC, continue to close'));


[U, W, V] = svd(F3);
rightE = U(:,end);
leftE = V(:,end); 
fprintf("The left and the right epipoles are:(matlab function no random point)\n");
disp(leftE);
disp(rightE);

[U, W, V] = svd(F4);
rightE = U(:,end);
leftE = V(:,end); 
fprintf("The left and the right epipoles are:(matlab function and random point)\n");
disp(leftE);
disp(rightE);
close all
