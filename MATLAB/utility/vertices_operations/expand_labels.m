function expanded_labels = expand_labels(vor_regions, fps, embedding)
%EXPAND_LABELS expand found fps embedding solution to the whole mesh
%   use the embedding generated for the farthest point sampling approximate
%   the solution to the whole mesh, thanks to the the voronoi regions
    expanded_labels = vor_regions;
    original_labels = vor_regions(fps);
    for i=1:length(fps)
        % replace each voronoi region with the corresponding embedding
        % value
        expanded_labels(expanded_labels == original_labels(i)) = embedding(i);
    end
end

