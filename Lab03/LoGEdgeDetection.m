%% Edge detection
% Detect zerocrossings and apply a threshold on the slope of the
% zerocrossing

function edgeMatrix = LoGEdgeDetection(threshold, convMatrix, method)

[row, col] = size(convMatrix);
edgeMatrix = zeros(row, col); % Initialization of the matrix

switch method
    
    case 1
        % Scan along each row, record an edge point at the location of the zerocrossing
        for i = 1:row
            for j= 1:col-1
                % Transition {+,-}
                if (convMatrix(i,j) > threshold && convMatrix(i,j+1) < - threshold)
                     edgeMatrix(i,j) = 1;
                % Transition {-,+}
                elseif (convMatrix(i,j) < - threshold && convMatrix(i,j+1) > threshold)
                     edgeMatrix(i,j) = 1;
                end
            end       
        end

        % Scan along each column, record an edge point at the location of the zerocrossing
        for i = 1:row-1
            for j= 1:col
                % Transition {+,-}
                if (convMatrix(i,j) > threshold && convMatrix(i+1,j) < - threshold)
                     edgeMatrix(i,j) = 1;
                % Transition {-,+}
                elseif (convMatrix(i,j) < - threshold && convMatrix(i+1,j) > threshold)
                     edgeMatrix(i,j) = 1;
                end
            end       
        end

    case 2
        threshold = threshold * 2; % To have the same threshold in the two methods

        % Scan along each row, record an edge point at the location of the zerocrossing
        for i = 1:row
            for j = 1:col-1
                zeroCross = convMatrix(i,j) * convMatrix(i,j+1);
                if zeroCross < 0 % Check if there is a zerocrossing
                   result = abs(convMatrix(i,j)) + abs(convMatrix(i,j+1));
                   if result > threshold % Check if there is a big jump (edge)
                        edgeMatrix(i,j) = 1;
                   end
                end
            end
        end

        % Scan along each column, record an edge point at the location of the zerocrossing
        for i = 1:row-1
            for j = 1:col
                zeroCross = convMatrix(i,j) * convMatrix(i+1,j);
                if zeroCross < 0 % Check if there is a zerocrossing
                   result = abs((convMatrix(i+1,j)) + abs(convMatrix(i+1,j)));
                   if result > threshold % Check if there is a big jump (edge)
                       edgeMatrix(i,j) = 1;
                   end
                end
            end
        end
        
    otherwise
        disp('ERROR: Insert method 1 or 2')
        return
end