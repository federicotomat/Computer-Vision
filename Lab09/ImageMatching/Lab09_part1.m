clear all, close all;

%% Configuration

cd ..;
path_config;
cd ImageMatching;

%% load the images pair
img1 = rgb2gray(imread('images/Ex01_01.jpg'));
img2 = rgb2gray(imread('images/Ex01_02.jpg'));

%if the images are too large you might want to resize them to a smaller
%size
img1 = imresize(img1, 0.5);
img2 = imresize(img2, 0.5);

%% Input vector
 
thresh = (0.1: .1: 1);
sigma1 = (1:2:10);
sigma2 = (.1:.4:2);
 
%list_ncc = findMatches(img1, img2, 'NCC', thresh, sigma1, sigma2);
%list_sift = findMatches(img1, img2, 'SIFT', thresh, sigma1, sigma2);

load('list_ncc.mat');
load('list_sift.mat');

h=0;
k=0;
fname = 'images/result'; 

%NCC_points = zeros(length(thresh)*length(sigma1),3);
%SIFT_points = zeros(length(thresh)*length(sigma1),3);

for i = 1: length(thresh)*length(sigma1)
    i2 = (length(thresh)*length(sigma1)+i);
    
    if mod(h,length(sigma1))==0
        h=0;
        k=k+1;
    end
    
    h=h+1;
    
    ns=h;
    nTr=k;
    
    
    NCC_points(i,:) = [thresh(nTr),sigma1(ns), size(list_ncc{i},1)];
    SIFT_points(i,:) = [thresh(nTr),sigma1(ns),size(list_sift{i},1)];

%     saveTitle1 = ['NCC with sigma = ', num2str(sigma1(ns)),' and threshold =',num2str(thresh(nTr))];
%     show_matches(img1, img2, list_ncc{i}, 0, i);
%     figname1 = ['fig_', saveTitle1, '.png'];
%     saveas(figure(i), fullfile(fname, figname1), 'png')
    
    
%     saveTitle2 = ['SIFT with sigma = ', num2str(sigma2(ns)),' and threshold =',num2str(thresh(nTr))];
%     show_matches(img1, img2, list_sift{i}, 0, i2);
%     figname2 = ['fig_', saveTitle2, '.png'];
%     saveas(figure(i2), fullfile(fname, figname2), 'png')

end

for i = 1:5:length(thresh)*length(sigma1)
    txt = strcat('threshold = ', num2str(thresh(1+floor(i/5)),3));
    figure(1)
    plot3(NCC_points(i:4+i,1),NCC_points(i:4+i,2), NCC_points(i:4+i,3)), grid on, hold on
    t = text(NCC_points(i,1),NCC_points(i,2), NCC_points(i,3),txt);
    figure(2)
    plot3(SIFT_points(i:4+i,1),SIFT_points(i:4+i,2), SIFT_points(i:4+i,3)), grid on, hold on
    t = text(SIFT_points(i,1),SIFT_points(i,2), SIFT_points(i,3),txt);
end
