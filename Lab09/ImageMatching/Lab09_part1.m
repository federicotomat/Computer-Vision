clc, clear all, close all;

% load the images pair
img1 = rgb2gray(imread('images/Monster.jpg'));
img2 = rgb2gray(imread('images/Ex01_01.jpg'));

% if the images are too large you might want to resize them to a smaller
% size
%img1 = imresize(img1, 0.5);
%img2 = imresize(img2, 0.5);

list_ncc = findMatches(img1, img2, 'NCC');
list_sift = findMatches(img1, img2, 'SIFT');

figure(1), show_matches(img1, img2, list_ncc, 0, 1);
figure(2), show_matches(img1, img2, list_sift, 1, 2);


