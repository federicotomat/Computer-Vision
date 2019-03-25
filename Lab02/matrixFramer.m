function AugmentedMatrix = matrixFramer(matrix, matrixSize)
    % Add the appropriate ledge to the image in order to avoid loss on the edge
    addRows = zeros(floor(matrixSize/2), size(matrix, 2) + 2*floor(matrixSize/2));
    addColumns = zeros(size(matrix, 1), floor(matrixSize/2));
    AugmentedMatrix = [addRows; addColumns matrix addColumns; addRows];   
end