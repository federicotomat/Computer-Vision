%% Error Analisis

function errorAnalisys(mat1, mat2)
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

    error_percentage = error_count/(size(mat1,2)*size(mat1,1))*100;
    % disp(error_percentage)
    imshowpair(mat1, mat2), title(strcat('Similarity error =', {' '}, num2str(error_percentage)));
end