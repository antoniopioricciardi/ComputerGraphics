clear all
close all
clc

M = read_off('1_fixed.off');
M = remesh(M, struct('vertices', 5e3));
f = M.VERT(:,1); % x coord;

% compute distance from a point to all the others, and then the gradient of
% it.
% we expect the gradient to "explode" from that point.

p = 3950;
f = pdist2(M.vert(p,:), M.vert)';
%{
% use a "mixed" function
[M.evecs, ~, ~, ~] = calc_LB_meshlp(M,10); %replace tilde with symbol
%}
figure
plot_scalar_map(M,f) % write this!!!!
axis off
freeze_colors
% the gradient on the belt should go to the right side of the shapef
% plot_mesh(M); shading interp; light; camlight head

G = calc_gradient(M);
% the gradient brings vertex based functions to triangle based
% the natural domain for the gradient is the triangle, not the vertex

hold on
subplot(122), colormap([1 1 1])

% I decide to plot the starting point in the center of the shape,
% hence calc_centroids
plot_scalar_map(M, ones(M.n,1)); hold on
plot_vfield(calc_centroids(M), reshape(D*f, M.m, 3), 1);

% we have almost zero value gradient on the left shoulder
% the gradient of a constant function should be zero
