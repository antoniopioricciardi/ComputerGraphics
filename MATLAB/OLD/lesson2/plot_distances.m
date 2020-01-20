shape = read_off('cat0.off')
figure = trisurf(shape.TRIV, shape.VERT(:,1),shape.VERT(:,2),shape.VERT(:, 3), compute_L2Dist(shape.VERT, 1), 'AmbientStrength',0.5, 'DiffuseStrength', 0.5, 'SpecularStrength', 0.5);
axis equal; shading interp; camlight; 