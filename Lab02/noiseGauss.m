%% Gaussian noise
% Add gaussian noise with given standard deviation (stdDev)

function imgGauss = noiseGauss(inputImg, stdDev)
%randn ritorna una matrice size * size di numeri casuali
    imgGauss = inputImg + stdDev * randn(size(inputImg)); 
end