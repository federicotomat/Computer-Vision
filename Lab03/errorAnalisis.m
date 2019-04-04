%% Error Analisis
function error_percentage = errorAnalisis(mat1, mat2)
if size(mat1) ~= size(mat2) 
    msg='The two images need to have the same size';
    error(msg)
end

error_count=0;
for i=1:size(mat1,1)
    for j=1:size(mat1,2)
        if  mat1(i,j) ~= mat2(i,j)
            error_count=error_count+1;
        end
    end
end

error_percentage=error_count/(size(mat1,2)*size(mat1,1))*100;

inputImg={mat1, mat2};
method={1,1};
figure()
imagesc(mat1)
hold on
image(mat2)
hold off
printFigure(2, 1, inputImg, method, 'error comparison')
end