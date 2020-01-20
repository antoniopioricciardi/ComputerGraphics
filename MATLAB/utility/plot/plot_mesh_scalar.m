function out = plot_mesh_scalar(shape, f, varargin)
%PLOT_MESH_SCALAR Plot a mesh and colour it according to the scalar
%function f
%   Detailed explanation goes here
  out = trisurf(shape.TRIV, shape.VERT(:, 1), shape.VERT(:, 2), shape.VERT(:, 3), f, varargin{:});
  %material(out, [0.35, 0.5, 0.15]); %if using this lighting options won't
  %work

  axis equal;
end

