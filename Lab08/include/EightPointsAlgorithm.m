%% Eight points Algoritmh

function F = EightPointsAlgorithm(P1,P2)
uno(1:size(P1,2)) = 1;
A = [ (P2(1,:).*P1(1,:))',  (P2(1,:).*P1(2,:))', (P2(1,:)'), (P1(1,:).*P2(2,:))', (P1(2,:).*P2(2,:))', (P2(2,:)'), (P1(1,:)'), (P1(2,:))', uno'];
[~,~,V]= svd(A);
f = reshape(V(:,end),3,3);
[Uf,Df,Vf]=svd(f);
Df(3,3)=0;
F=Uf*Df*Vf';
end