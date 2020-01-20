% Render of a farthest point sampling as a point cloud
% over a white mesh, with boundaries in red
clear;
clc;

M = read_off('04.10_viz/code/cat_partial.off');

p_cloud = p_cloud_struct(M.TRIV, M.VERT);

dist_index = farthest_ps(M.VERT, 50, 1);

% compute jet colormap by normalizing y-axis values into 
% [1, 256]

min_f = min(p_cloud.VERT(:,2));
max_f = max(p_cloud.VERT(:,2));

jet = zeros(length(M.VERT),1);

for i = 1 : length(p_cloud.VERT)
    f_x = p_cloud.VERT(i, 2);
    f_x_1 = (f_x - min_f)/(max_f - min_f);
    f_x_1 = round(1 + 255*(f_x_1));
    jet(i) = f_x_1;
end

distances = compute_L2Dist(p_cloud.VERT, 1);

sampling = farthest_ps(p_cloud.VERT, 50, 1);
bound_edges = calc_boundary_edges(M);

whiteC = [1, 1, 1];

% plot edges
trisurf(M.TRIV, M.VERT(:,1), M.VERT(:,2), M.VERT(:, 3),'Facecolor',whiteC, 'AmbientStrength',1, 'DiffuseStrength', 0.8, 'SpecularStrength', 0.5);
hold on;

% plot point cloud
scatter3(p_cloud.VERT(:,1), p_cloud.VERT(:,2), p_cloud.VERT(:,3), 20, jet, 'filled');
hold on;

% plot boundary edges
trisurf(bound_edges , M.VERT(:, 1), M.VERT(:, 2), M.VERT(:, 3), 'edgecolor', 'r', 'LineWidth',3);
axis equal