%% Salt & pepper noise
% Add salt & pepper noise with given noise density (noiseDen)
function imgSP = noiseSP(inputImg, noiseDen)
    [row,col] = size(inputImg);
    maxv = max(max(inputImg)); % research the maximum value of the matrix ??

    noiseMatrix = full(sprand(row, col, noiseDen));
    % Is a random, m-by-n, sparse matrix with approximately density *m *n
    % uniformly distributed nonzero entries (0 <= density <= 1).
    % La full me la converte a full storage mentre la sprand ritorna solo i
    % valori diversi da zero
    mask1 = noiseMatrix > 0 & noiseMatrix < 0.5; %boolean
    mask2 = noiseMatrix >= 0.5;

    imgSP = inputImg.*(~mask1); % ~mask0 is the negation of mask0
    imgSP = imgSP.*(~mask2) + maxv * mask2;
end