%% Gaussian noise
% Add gaussian noise with given standard deviation (stdDev)

function imgGauss = noiseGauss(inputImg, stdDev)
    imgGauss = inputImg + stdDev * randn(size(inputImg)); %randn ritorna una matrice size * size di numeri casuali
end