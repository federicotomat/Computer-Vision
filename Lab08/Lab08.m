%% Lab08

clear all
close all
clc

addpath('include');
addpath('input');

% Read the input images
img1 = imread('Rubik/Rubik1.pgm');
img2 = imread('Rubik/Rubik2.pgm');

% Load corresponding points
p1 = load('Rubik/Rubik1.points')';
p2 = load('Rubik/Rubik2.points')';

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

p1Err = [p1 , [112; 25; 1]];
p2Err = [p2 , [100; 10; 1]];

%2. In these cases we would need to resort to robust statistics methods such as RANSAC: 
%   you may have a look (and comment) at the behavior of other algorithms implemented 
%   in Matlab (see the function estimateFundamentalMatrix)

F = estimateFundamentalMatrix(p1Err(1:2,:)', p2Err(1:2,:)', 'Method','RANSAC');

for i = 1:N
    mul(i) = p2(:,i)' * F * p1(:,i);
end
fprintf("The epipolar constraint with Matlab functions is: \n");
disp(mul);
visualizeEpipolarLines(img1, img2, F, p1(1:2,:)', p2(1:2,:)')
[U, W, V] = svd(F);
rightE = U(:,end);
leftE = V(:,end); 
fprintf("The left and the right epipoles are:(matlab function)\n");
disp(leftE);
disp(rightE);
