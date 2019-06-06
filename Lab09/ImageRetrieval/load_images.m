% Load the set of image descriptors of the Holidays dataset
% and construct the groundtruth.
% Usage: [imlist, sift, qidx, gnd] = load_holidays (dir_sift)
% 
% Input/Output variables:
%   dir_sift   the directory where the siftgeo files are stored
%   imlist     the list of image number (the number of the files)
%   sift       a cell containing the sift descriptors
%   gnd        the groundtruth: first value is the query number
%              next are the corresponding matching images
function [imlist, gnd, qidx] = load_images(dir_jpg)

jpgfname = struct2cell(dir(fullfile(dir_jpg, '*.jpg')));
jpgfname = jpgfname(1, :);

nimg = size (jpgfname, 2);

imlist = cell (nimg, 1);  % the set of image path
qidx = [];                % the query identifiers
gnd = {};                 % first element is the query image number
                          % following are the corresponding matching images

qno = 0;                  % current query number
for i = 1:nimg
  imno = str2num(jpgfname{i}(1:end-4)); 
  imlist{i} = fullfile(dir_jpg, jpgfname{i});
  
  if mod(imno, 100) == 0
    qno = qno + 1;
    qidx = [qidx i];
    gnd{qno, 1} = []; 
  end
  
  gnd{qno, 1} = [gnd{qno} i];
end 

