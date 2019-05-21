function B = normalizeMatrix(A)
sigma = std(A);
m = mean(A);
for i=1
    B=(A-m)/sigma;
end