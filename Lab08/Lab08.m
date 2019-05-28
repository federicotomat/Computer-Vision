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

N = length(p1(1,:));  % N is the number of corresponding points
p1 = [p1; ones(1,N)]; % Adding a row of ones at the points matrix
p2 = [p2; ones(1,N)]; % Adding a row of ones at the points matrix

% 8 point algorithm function without normalization
F1 = EightPointsAlgorithm(p1, p2);

% 8 point algorithm function with normalization
F2 = EightPointsAlgorithmN(p1, p2);
