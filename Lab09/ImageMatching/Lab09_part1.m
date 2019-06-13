% clc, clear all, close all;
% 
% %% Config
% 
% cd ..;
% path_config;
% cd ImageMatching;
% 
% %% load the images pair
% img1 = rgb2gray(imread('images/Ex01_01.jpg'));
% img2 = rgb2gray(imread('images/Ex01_02.jpg'));
% 
% % if the images are too large you might want to resize them to a smaller
% % size
% %img1 = imresize(img1, 0.5);
% %img2 = imresize(img2, 0.5);
% %% Inut vector
% 
thresh = [0.1 0.2 0.5];
sigma1 = [1 3 5];
sigma2 = [.5 1.5 2.6];
% 
% %%
% list_ncc = findMatches(img1, img2, 'NCC', thresh, sigma1, sigma2);
% list_sift = findMatches(img1, img2, 'SIFT', thresh, sigma1, sigma2);
h=0;
k=0;
for i = 1: length(thresh)*length(sigma1)
    if mod(h,length(thresh))==0
        h=0;
        k=k+1;
    end
    h=h+1;
    ns=h;
    nTr=k;
    
    %fname = /where/you/want/to/save
        
    %figure(i), show_matches(img1, img2, list_ncc{i}, 0, 1);

    % hold off
    %fig = figure(i);
    %figname = ['fig_', saveTitle, '.jpg'];
    %saveas(fig, fullfile(fname, figname), 'jpeg')
    %close(fig)
    
    %figure((length(thresh)*length(sigma1)+1), show_matches(img1, img2, list_sift{i}, 0, 2);
    
    % hold off
    %fig = figure((length(thresh)*length(sigma1)+1);
    %figname = ['fig_', saveTitle, '.jpg'];
    %saveas(fig, fullfile(fname, figname), 'jpeg')
    %close(fig)
end

