function [out] = plot_point_cloud(shape, varargin)
%PLOT_MESH Summary of this function goes here
%   Detailed explanation goes here
% first arg after Z coord is the size of points, then color funct
out = scatter3(shape.VERT(:,1), shape.VERT(:,2), shape.VERT(:,3), varargin{:});
material(out, [0.35, 0.5, 0.15]);
axis equal;
end

