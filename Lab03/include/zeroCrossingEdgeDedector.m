%% Zero Crossing Edge Dedector
% Detect zerocrossings and apply a threshold on the slope of the
% zerocrossing

function edgeMatrix = zeroCrossingEdgeDedector(threshold, convMatrix)

[row, col] = size(convMatrix);
    % Initialization of the matrix
    edgeMatrix = zeros(row, col); 
    
    % Scan along each row, record an edge point at the location of the zerocrossing
    for i = 2:row
        for j= 2:col-1
            % Transition {+,-}
            if (convMatrix(i,j) > 0 && convMatrix(i, j+1) < 0)
                if (abs(convMatrix(i,j)-convMatrix(i,j+1))) > threshold
                    edgeMatrix(i,j)=1;
                end
                % Transition {-,+}
            elseif (convMatrix(i,j) < 0 && convMatrix(i, j+1) > 0)
                if (abs(convMatrix(i,j)-convMatrix(i,j+1))) > threshold
                    edgeMatrix(i,j)=1;
                end
            elseif(convMatrix(i,j)==0)
                %Transition{+,0,-}
                if (convMatrix(i,j-1) > 0 && convMatrix(i, j+1) < 0)
                    if (abs(convMatrix(i,j-1)-convMatrix(i,j+1))) > threshold
                        edgeMatrix(i,j)=1;
                    end
                    
                % Transition {-,0,+}
                elseif (convMatrix(i,j-1) < 0 && convMatrix(i, j+1) > 0)
                    if (abs(convMatrix(i,j-1)-convMatrix(i,j+1))) > threshold
                        edgeMatrix(i,j)=1;
                    end
                end
            end
        end
    end
    
    % Scan along each row, record an edge point at the location of the zerocrossing
    for i = 2:row-1
        for j= 2:col
            % Transition {+,-}
            if (convMatrix(i,j) > 0 && convMatrix(i+1, j) < 0)
                if (abs(convMatrix(i,j)-convMatrix(i+1,j))) > threshold
                    edgeMatrix(i,j)=1;
                end
                % Transition {-,+}
            elseif (convMatrix(i,j) < 0 && convMatrix(i+1, j) > 0)
                if (abs(convMatrix(i,j)-convMatrix(i+1,j))) > threshold
                    edgeMatrix(i,j)=1;
                end
            elseif(convMatrix(i,j)==0)
                %Transition{+,0,-}
                if (convMatrix(i,j-1) > 0 && convMatrix(i+1, j) < 0)
                    if (abs(convMatrix(i-1,j)-convMatrix(i+1,j))) > 0
                        edgeMatrix(i,j)=1;
                    end
                    
                % Transition {-,0,+}
                elseif (convMatrix(i-1,j) < 0 && convMatrix(i+1, j) > 0)
                    if (abs(convMatrix(i-1,j)-convMatrix(i+1,j))) > threshold
                        edgeMatrix(i,j)=1;
                    end
                end
            end
        end
    end
end