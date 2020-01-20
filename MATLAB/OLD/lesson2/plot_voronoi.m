shape = read_off('cat0.off');
p_cloud = p_cloud_struct(shape.TRIV, shape.VERT);
sampling = farthest_ps(p_cloud.VERT, 5, 1);
distances = compute_L2Dist(p_cloud.VERT, 1);
scatter3(p_cloud.VERT(:, 1), p_cloud.VERT(:, 2), p_cloud.VERT(:, 3), 3, voronoi_eucl(p_cloud.VERT, sampling), 'filled');
axis equal;