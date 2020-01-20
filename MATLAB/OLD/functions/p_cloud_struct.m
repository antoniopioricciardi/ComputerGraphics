function point_cloud = p_cloud_struct(triangles,vertices)
point_cloud.VERT = zeros(length(vertices), 3);
count = 0;
%{
for i = 1 : length(triangles)
    for j = 1 : 3
        count = count+1;
        point_cloud.VERT(count, :) = vertices(triangles(i, j), :);
    end
end
%}
for i = 1 : length(vertices)
    point_cloud.VERT(i, :) = vertices(i, :);
end

point_cloud.n = size(point_cloud.VERT, 1);
end

