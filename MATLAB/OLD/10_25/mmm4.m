M = read_off('cat0.off');

normals = cross(M.VERT(m.TRIV(:,2),:) - M.VERT(M.TRIV(:,1),:), M.VERT(m.TRIV(:,2),:) - M.VERT(M.TRIV(:,1),:))
normals = spdiag(1./sqrt(sum(normals.^2,2)))*normals;

P = sparse(M.TRIV(:)', [1:M.m 1:M.m 1:M.m], 1, M.n, M.m);

normals_vert = P*normals;
normals_vert = spdiag(1./sqrt(sum(normlas_vert.^2,2)))

%let's create a fat version of the cat
% CARICATURIZATION
figure
for a=0.01:0.1:5
    N = M;
    N.VERT = N.VERT + a*normals_vert;
    plot_mesh(N), shading interp
    axis off
    light; camlight head; lighting phong
    drawnow
end