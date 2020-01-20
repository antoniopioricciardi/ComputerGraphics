function vor_indices = voronoi(shape,sampling_ind)
%VORONOI Compute voronoi regions
%   Results are indices of the vertices in the sampling.
%   return the index of the closer vertex of
%   the sampling for all the vertices in the shape.
   sampling = shape.VERT(sampling_ind, :);
   
   % [values, indices] = min(pdist2(sampling, shape.VERT)); % need to
   % convert results in columns.
   
   % take the min in the second dimension (columns), for each row.
   [values, vor_indices] = min(pdist2(shape.VERT, sampling), [], 2);
end

