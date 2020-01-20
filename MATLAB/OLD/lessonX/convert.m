M = load_off('cat2.off');

% we cannot see mesh in povray, so we need to move that in the space

M.VERT = M.VERT - repmat(mean(M.VERT), M.n, 1);


% povRay expects a colour for each triangle, not for each vertex
% so i take the avg value for each triangle

f = M.VERT(:,1);
f_tri = mean(f(M.TRIV), 2); %mean across the second dimension
colors = jet(256);


idx = 1 + round(255 * (f_tri - min(f_tri)) ./ range(f_tri));

figure = trisurf(M.TRIV, M.VERT(:,1),M.VERT(:,2),M.VERT(:, 3));
save_mesh_povray('cat2.mesh', M, colors(idx, :)); % save a mesh for M with random colors for edges


