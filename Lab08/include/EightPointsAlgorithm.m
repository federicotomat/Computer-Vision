%% F = EightPointsAlgorithm(P1,P2) version 1

% Calculated the Fundamental matrix between two views from the normalized 8
% point algorithm
% inputs: 
%               P1      3xN     homogeneous coordinates of matched points in view 1
%               P2      3xN     homogeneous coordinates of matched points in view 2
% outputs:
%               F       3x3     Fundamental matrix

function F = EightPointsAlgorithm(P1,P2)

    uno(1:size(P1,2)) = 1;
    
    A = [(P2(1,:).*P1(1,:))', (P2(1,:).*P1(2,:))', (P2(1,:)') ...
         (P1(1,:).*P2(2,:))', (P1(2,:).*P2(2,:))', (P2(2,:)') ... 
                  (P1(1,:)'),          (P1(2,:))',      uno'];
              
    [U,D,V] = svd(A);
    f = reshape(V(:,end),3,3);
    [Uf,Df,Vf] = svd(f);
    Df(3,3) = 0;
    F = Uf*Df*Vf';
    
end
