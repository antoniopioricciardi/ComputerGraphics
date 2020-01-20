function distances = compute_L2Dist(vertices, vert_index)
%COMPUTE_DIST Summary of this function goes here
%   Detailed explanation goes here
starting_vert = vertices(vert_index, :);

v = vertices(vert_index, :);

distances = sqrt(sum((v - vertices)'.^2));
end

