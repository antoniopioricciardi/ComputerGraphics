function point_cloud = p_cloud_struct(triangles,vertices)
point_cloud.VERT = zeros(length(vertices), 3);

for i = 1 : length(triangles)
    for j = 1 : 3
        point_cloud.VERT(i + j - 1, :) = vertices(triangles(i, j), :);
    end
end

point_cloud.n = size(point_cloud.VERT, 1);
end

