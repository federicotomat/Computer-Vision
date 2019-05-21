
function [residual] = testH(H, sin, des)
    res = H * sin;
    res(1, :) = res(1, :) ./ res(3, :);
    res(2, :) = res(2, :) ./ res(3, :);
    res(3, :) = res(3, :) ./ res(3, :);
    res = res  - des;
    residual = zeros(size(res, 2), 1);
    for i=1:size(res, 2)
        residual(i) = norm(res(:, i));
    end
    residual = sqrt(residual);
end