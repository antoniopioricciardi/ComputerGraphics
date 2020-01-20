function f = voronoi_eucl(vertices, S)
%VORONOI Summary of this function goes here
%   Detailed explanation goes here
% return the min in the second dimension. This means that for each row,
% return its minimun.
[~,f] = min(pdist2(vertices,vertices(S,:)), [], 2);
end

