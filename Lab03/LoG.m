%%  Laplacian of Gaussian Operator
% Function that implements the Laplacian of Gaussian Operator with a given
% standard deviation sigma

function laplacianMatrix = LoG(sigma)

spatialSupport = ceil(sigma*3); % Half length of kernel should be 3 times the standard deviation

[X,Y]=meshgrid(-spatialSupport:spatialSupport);

laplacianMatrix = (1/(2*pi*sigma^2))*((X.^2+Y.^2 -2*sigma^2)/sigma^4).*exp(-(X.^2+Y.^2)/(2*sigma^2));