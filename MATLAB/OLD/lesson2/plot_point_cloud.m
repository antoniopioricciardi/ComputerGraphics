shape = read_off('cat0.off');
p_cloud = p_cloud_struct(shape.TRIV, shape.VERT);
distances = compute_L2Dist(p_cloud.VERT, 1);
scatter3(p_cloud.VERT(:, 1), p_cloud.VERT(:, 2), p_cloud.VERT(:, 3), 3, distances, 'filled');
axis equal;