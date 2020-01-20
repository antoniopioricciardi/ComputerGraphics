clc;
clear;

M = read_off('bunny.off');
p_cloud = p_cloud_struct(M.TRIV, M.VERT);

sampling = farthest_ps(p_cloud.VERT, 100, 1);

colormap(hsv(length(sampling)));

voro_col = voronoi_eucl(p_cloud.VERT, sampling);

jet_x = (M.VERT(:, 1) - min(M.VERT(:, 1)))/(max(M.VERT(:, 1)) - min(M.VERT(:, 1)));
jet_y = (M.VERT(:, 2) - min(M.VERT(:, 2)))/(max(M.VERT(:, 2)) - min(M.VERT(:, 2)));
jet_z = (M.VERT(:, 3) - min(M.VERT(:, 3)))/(max(M.VERT(:, 3)) - min(M.VERT(:, 3)));

dist = compute_L2Dist(M.VERT, 1);

size(p_cloud.VERT)
size(M.VERT)

subplot(2,3,1); % Upper left
% initial shape
trisurf(M.TRIV, M.VERT(:, 1), M.VERT(:, 2), M.VERT(:, 3), jet_y, 'AmbientStrength', 0, 'DiffuseStrength', 0);
title('Initial shape'); xlabel('x'); ylabel('y'); zlabel('z');
shading interp; light;

subplot(2,3,3); % Upper right
% 100 voronoi regions on mesh
trisurf(M.TRIV, M.VERT(:, 1), M.VERT(:, 2), M.VERT(:, 3), voro_col, 'AmbientStrength', 0, 'DiffuseStrength', 0);
title('100 voronoi'); xlabel('x'); ylabel('y'); zlabel('z');
lighting gouraud; shading interp; light;

subplot(2,3,4); % Upper left
% x funct coloring
trisurf(M.TRIV, M.VERT(:, 1), M.VERT(:, 2), M.VERT(:, 3), jet_x, 'AmbientStrength', 0, 'DiffuseStrength', 0);
title('x function'); xlabel('x'); ylabel('y'); zlabel('z');
shading interp;

subplot(2,3,5); % Upper left
% y funct coloring
trisurf(M.TRIV, M.VERT(:, 1), M.VERT(:, 2), M.VERT(:, 3), jet_y, 'AmbientStrength', 0, 'DiffuseStrength', 0);
title('y function'); xlabel('x'); ylabel('y'); zlabel('z');
shading interp;

subplot(2,3,6); % Upper left
% z funct coloring
trisurf(M.TRIV, M.VERT(:, 1), M.VERT(:, 2), M.VERT(:, 3), jet_z, 'AmbientStrength', 0, 'DiffuseStrength', 0);
title('z function'); xlabel('x'); ylabel('y'); zlabel('z');
shading interp;

figure;

colormap(hsv(length(sampling)));

voro_regions = zeros(1000, 100);
% we're taking the 100 voronoi regions, so the 1000 elements of the
% voronoi column have a range 1-100.
% Thus, we assign every element of the region to the respective column
for i=1 : size(voro_col)
    element = voro_col(i);
    voro_regions(i, element) = 1;
end


%c = A\B
%A*c = B
%newBase = c*B

% I want to reobtain x/y/z by solving, for each coord, the linear system
% V*c = X
% So I get coefficients and then multiply those to the voronoi regions
% to get x/y/z again. As we can see from the resulting shape, we do not
% get the original colouring because we lost some informations
% (we squeezed the 10000x100 matrix into a 10000x1 one).
coeff_x = voro_regions \ M.VERT(:,1);
voro_x = voro_regions*coeff_x;

coeff_y = voro_regions \ M.VERT(:,2);
voro_y = voro_regions*coeff_y;

coeff_z = voro_regions \ M.VERT(:,3);
voro_z = voro_regions*coeff_z;


subplot (2, 3, 1); % upper left
% x function, voro basis 
trisurf(M.TRIV, M.VERT(:, 1), M.VERT(:, 2), M.VERT(:, 3), voro_x);
title('x function voro basis'); xlabel('x'); ylabel('y'); zlabel('z');
shading interp;
light;

subplot (2, 3, 2); % upper middle
% y function, voro basis 
trisurf(M.TRIV, M.VERT(:, 1), M.VERT(:, 2), M.VERT(:, 3), voro_y);
title('y function voro basis'); xlabel('x'); ylabel('y'); zlabel('z');
shading interp;
light;

subplot (2, 3, 3); % upper right
% z function, voro basis 
trisurf(M.TRIV, M.VERT(:, 1), M.VERT(:, 2), M.VERT(:, 3), voro_z);
title('z function voro basis'); xlabel('x'); ylabel('y'); zlabel('z');
shading flat;
light;