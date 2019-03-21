function AugmentedMatrix = matrixLedger(matrix, K)
    % Add the appropriate ledge to the image in order to avoid loss on the edge
    addRows = zeros(floor(K/2), size(matrix, 2) + 2*floor(K/2));
    addColumns = zeros(size(matrix, 1), floor(K/2));
    AugmentedMatrix = [addRows; addColumns matrix addColumns; addRows];   
end