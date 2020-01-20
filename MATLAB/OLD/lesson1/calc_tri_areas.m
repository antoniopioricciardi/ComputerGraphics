function calc_tri_areas(mesh)

mesh_structure = read_off('code/cat0.off')

% create vector of 0 with size equal to the number of triangles
% areas = zeros(1, mesh_structure.TRIV(:, 1))

X = mesh_structure.VERT(:, 1);
Y = mesh_structure.VERT(:, 2);
Z = mesh_structure.VERT(:, 3);

P = [X, Y, Z];

v1 = P(mesh_structure.TRIV(:, 2), :) - P(mesh_structure.TRIV(:, 1), :);
v2 = P(mesh_structure.TRIV(:, 3), :) - P(mesh_structure.TRIV(:, 2), :);

v1(1, :);
cp = cross(v1,v2)/2;

areas = sqrt(dot(cp, cp, 2));

figure = get_plot('code/cat0.off')
figure.CData = areas
end    