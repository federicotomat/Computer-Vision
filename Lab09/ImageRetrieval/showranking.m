function [ ] = showranking(num_ranked_images, imlist, qidx, idx, distances)
subplot = @(m,n,p) subtightplot(m, n, p, [0.01 0.01], [0.00 0.00], [0.01 0.00]);
most_similar_images = num_ranked_images;
visual_columns = 5;
visual_rows = ceil(most_similar_images/visual_columns);
figure_handle = figure; 
for i=1:length(qidx)
    subplot(visual_rows, visual_columns, 1);
    query_fig = imread(imlist{qidx(i)});
    subimage(query_fig);
    title(sprintf ('Query image:%d', i));
    axis off;
    
    %% Showing images ranking
    for j=1:most_similar_images
        subplot(visual_rows, visual_columns, j+1);
        ranking_image = imread(imlist{idx(j, i)});
        subimage(ranking_image);
        title(sprintf ('Ranking pos.:%d; Dis:%.3f.', j, distances(j, i)));
        axis off;
    end
    pause;
end
close(figure_handle);
end

