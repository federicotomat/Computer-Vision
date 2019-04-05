%% Hysteresis Thresolding

function edgeMatrix = hysteresisThresolding(H, L, convMatrix) 
    [row, col] = size(convMatrix);
    % Initialization of the matrix
    edgeMatrix = zeros(row, col); 
    % Scan along each row, record an edge point if upper the H limit or
    % if is L< edge< H but near point are switched on 
    for i = 1:row
        for j= 1:col-1
            %look for edge > H
            if (convMatrix(i,j) > H)
                edgeMatrix(i,j) = 1;
                
            %look for L<edge<H but with switched on pixel before him   
            elseif (convMatrix(i,j) > L)
                if i>1 && j>1
                    if convMatrix(i-1,j) > H
                        if convMatrix(i-1,j)>L
                            edgeMatrix(i,j) = 1;
                        end
                            
                    elseif convMatrix(i-1,j-1) > H
                        if convMatrix(i+1,j+1>L
                            edgeMatrix(i,j) = 1;
                        end  
                           
                    elseif convMatrix(i-1,j+1) > H
                        if convMatrix(i+1,j-1)>L
                            edgeMatrix(i,j) = 1;
                        end
                    elseif convMatrix(i,j-1) > H
                        if convMatrix(i,j+1)>L
                            edgeMatrix(i,j) = 1;
                        end
                            
                    elseif convMatrix(i,j+1) > H
                        if convMatrix(i,j-1)>L
                            edgeMatrix(i,j) = 1;
                        end  
                           
                    elseif convMatrix(i+1,j-1) > H
                        if convMatrix(i-1,j+1)>L
                            edgeMatrix(i,j) = 1;
                        end
                    elseif convMatrix(i+1,j) > H
                        if convMatrix(i-1,j)>L
                            edgeMatrix(i,j) = 1;
                        end
                            
                    elseif convMatrix(i+1,j+1) > H
                        if convMatrix(i-1,j-1)>L
                            edgeMatrix(i,j) = 1;
                        end  

                    end
                end
                
            else 
                    edgeMatrix(i,j) = 0;
            end
        end
    end
 end
