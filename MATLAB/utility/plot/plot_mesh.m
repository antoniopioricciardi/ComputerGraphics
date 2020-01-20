function [out] = plot_mesh(shape, varargin)
%PLOT_MESH Summary of this function goes here
%   Detailed explanation goes here
  out = trisurf(shape.TRIV, shape.VERT(:, 1), shape.VERT(:, 2), shape.VERT(:, 3), varargin{:});
  material(out, [0.35, 0.5, 0.15]);

  axis equal;
end

