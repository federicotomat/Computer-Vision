function ag_mat=matrixLedger(matrix, K)
%add the appropriate ledge to the image in order to avoid loss on the edge
add_rows=zeros(floor(K/2), size(matrix,2)+2*floor(K/2));
add_columns=zeros(size(matrix,1),floor(K/2));
ag_mat=[add_rows; add_columns matrix add_columns; add_rows];
end