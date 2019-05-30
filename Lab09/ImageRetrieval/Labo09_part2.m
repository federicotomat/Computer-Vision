%% Clear
close all;
clear all;
clc;

%% Load images
dir_jpg='images/';
[imlist, gnd, qidx] = load_images(dir_jpg);

%% Feature extraction
nimg = length(imlist);
sift_features = cell(nimg, 1);
sift_features_meta = cell(nimg, 1);
dataLearn = [];
load_features = false;
save_newFeatures = true;
for i=1:nimg
        
    filename_feature = fullfile('data/features', [imlist{i}(7:end), '.mat']);
    if load_features
        % Loading pre-computed features [F, D]
        load(filename_feature);
    else
        imgpath = imlist{i};
        
        % Loading image
        I = imread(imgpath);
        I = single(rgb2gray(I));

        % Extracting sift features
        [F, D] = vl_sift(I);
        
        % Saving sift features
        if save_newFeatures
            save(filename_feature, 'F', 'D');
        end
    end
    
    sift_features{i} = single(D);
    sift_features_meta{i} = F;
        
    % Features used for dictionary learning
    dataLearn = [dataLearn sift_features{i}];
end

%% Dictionary
numClusters = 200; % possible values are 30, 100, 200, 300, 500, 1000
load_dictionary = true;
save_newDictionary = false;
dict_path = fullfile('data/dictionaries', ['dict_' num2str(numClusters) '.mat']);
if load_dictionary
     % Loading pre-computed dictionary 'centers'
    load(dict_path);
else
    rndidx = randperm(size(dataLearn, 2));
    centers = vl_kmeans(dataLearn(:, rndidx(1:min(30000,size(rndidx,2)))), numClusters);
    
    if save_newDictionary
        save(dict_path, 'centers');
    end
end

%% BoF image description
image_descriptions = zeros(numClusters, nimg);
for i=1:nimg
    % BoF representation
    descriptor = zeros(1, numClusters);
    image_features = sift_features{i};
    for j=1:size(image_features,2)
      [~, k] = min(vl_alldist2(image_features(:,j), centers)); % computing the nearest neighbor
      descriptor(k) = descriptor(k) + 1;
    end
    image_descriptions(:, i) = descriptor; % a representation containing the frequency for each visual word in the image.
end

% Image description normalization
for i=1:nimg
    % L2 normalization
    image_descriptions(:, i) = image_descriptions(:, i)/norm(image_descriptions(:, i));
end

%% Image retrieval
num_ranked_images = 10;

% compute all distance between query images and all dataset images, can be
% used L0, L1, L2 (last parameter of the function vl_alldist2).
distances = vl_alldist2(image_descriptions, image_descriptions(:, qidx), 'L2'); 

[distances, idx] = sort(distances); % sort ascending
distances = distances(1:num_ranked_images, :);
idx = idx(1:num_ranked_images, :);

%% Ranking evaluation (Mean Average Precision - mAP = [0, 1], 1 = best one)
idx_first_row = idx (1,:);
idx = idx (2:end,:);  % removing the first element in the ranking list
distances = distances(2:end,:);
map = compute_map (idx, gnd);
% idx = [idx_first_row; idx];

%% Show image ranking
if num_ranked_images > size(idx, 1)
    num_ranked_images = size(idx, 1);
end
showranking(num_ranked_images, imlist, qidx, idx, distances);

%% Retrieval using your query image

imgpath = '../ImageMatching/images/Ex02_01.jpg';
I = imread(imgpath);
I = single(rgb2gray(I));
imlist1 = imlist;
imlist1{length(imlist)+1} = '../ImageMatching/images/Ex02_01.jpg';

% Extracting sift features
[F, D] = vl_sift(I);
D = single(D);

% computing the BoF descriptor
descriptor = zeros(1, numClusters);
image_features = D;
for j=1:size(image_features,2)
    [~, k] = min(vl_alldist2(image_features(:,j), centers)); % computing the nearest neighbor
    descriptor(k) = descriptor(k) + 1;
end

descriptor = descriptor/norm(descriptor);

% compute the distance between the query image and all the images in the
% dataset
distances = vl_alldist2(image_descriptions, descriptor', 'L2'); 
[distances, idx] = sort(distances); % sort ascending
distances = distances(1:num_ranked_images, :);

% rank and show the results
idx = idx(1:num_ranked_images, :);

if num_ranked_images > size(idx, 1)
    num_ranked_images = size(idx, 1);
end

showranking(num_ranked_images, imlist1, length(imlist1), idx, distances);