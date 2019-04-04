%%  Laplacian of Gaussian Operator
% Function that implements the Laplacian of Gaussian Operator with a given
% standard deviation sigma

function laplacianMatrix = laplacianOfGaussian(sigma)
%Spatial support should be the nearesr integer to 3*sigma

    spatialSupport = ceil(sigma*3); 
    [X,Y]=meshgrid(-spatialSupport:spatialSupport);
    laplacianMatrix = (1/(2*pi*sigma^2))*((X.^2+Y.^2 -2*sigma^2)/sigma^4).*exp(-(X.^2+Y.^2)/(2*sigma^2));

end