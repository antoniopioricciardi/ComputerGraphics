shape = read_off('lesson2/cat0.off');
p_cloud = p_cloud_struct(shape.TRIV, shape.VERT);
sampling = farthest_ps(p_cloud.VERT, 10, 1);
sampling
distances = compute_L2Dist(p_cloud.VERT, 1);
voronoi_eucl(p_cloud.VERT, sampling);
scatter3(p_cloud.VERT(:, 1), p_cloud.VERT(:, 2), p_cloud.VERT(:, 3), 5, voronoi_eucl(p_cloud.VERT, sampling), 'filled');
axis equal;