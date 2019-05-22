%% Lab06

clear all
close all

addpath('1.PerspDist')
addpath('2.ImagesHomog')
addpath('3.Mosaic')

loop  = true;
while(loop)
    prompt = 'Which of the 3 programs you want to run?   ';
    x = input(prompt);
    switch (x)
        case 1
            file = 'mainPerspDist.m';
            run(file);
            loop = false;
        case 2
            file = 'homographyBetweenImages.m';
            run(file);
            loop = false;
        case 3
            file = 'imageMosaicing.m';
            run(file);
            loop = false;
        otherwise
        disp('Incorrect enter value, try again');
    end
end
  
    
  