%% Lab06

clear all
close all

addpath('1.PerpDist')
addpath('2.ImagesHomog')
addpath('3.Mosaic')

loop  = true;
while(loop)
    prompt = 'Which of the 3 programs you want to run?   ';
    x = input(prompt);
    switch (x)
        case 1
            folder  = '1.PerpDist';
            file    = load(fullfile(folder, 'mainPerpDist.m'));
            success = false;
            try
                run(file);
                success = true;
            catch
                fprintf('Failed to run: %s\n', file);
            end
            loop = false;
        case 2
            folder  = '2.ImagesHomog';
            file    = load(fullfile(folder, 'homographyBetweenImages.m'));
            success = false;
            try
                run(file);
                success = true;
            catch
                fprintf('Failed to run: %s\n', file);
            end
            loop = false;
        case 3
            folder  = '3.Mosaic';
            file    = load(fullfile(folder, 'imageMosaicing.m'));
            success = false;
            try
                run(file);
                success = true;
            catch
                fprintf('Failed to run: %s\n', file);
            end
            loop = false;
        otherwise
        disp('Incorrect enter value');
    end
end
  
    
  