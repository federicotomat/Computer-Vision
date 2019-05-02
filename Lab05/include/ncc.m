%% Normalized cross correltion

function box = ncc(tragetImage, template)
n_target = size(tragetImage,1)  * size(tragetImage,2);
n_template =  size(template,1)  * size(template,2);

mi_target = mean2(targetImage);
mi_template = mean2(template);

std_target = std2(targetImage);
std_template = std2(template);


end