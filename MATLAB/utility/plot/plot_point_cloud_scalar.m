function [out] = plot_point_cloud(shape, f)
%PLOT_MESH Summary of this function goes here
%   Detailed explanation goes here
out = scatter3(shape.VERT(:,1), shape.VERT(:,2), shape.VERT(:,3), f);
axis equal;
end

