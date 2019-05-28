%% Sum of squares is a statistical technique used in regression analysis to
% determine the dispersion of data points.
% In a regression analysis, the goal is to determine how well a data series
% can be fitted to a function that might help to explain how the data series 
% was generated. 
% Sum of squares is used as a mathematical way to find the function that 
% best fits (varies least) from the data.

function d = my_ssd(N1, N2)
    X = N1 - N2;
    d = sum(X(:).^2);
end
