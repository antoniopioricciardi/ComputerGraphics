max_coords = max(M:VERT);
min_coords = min(M:VERT);

mean_coords = (max_coords + min_coords)/2;
mean_x = mean_coords(1);
mean_y = mean_coords(2);
mean_z = mean_coords(3);

canonical_shape - mean_coords;
