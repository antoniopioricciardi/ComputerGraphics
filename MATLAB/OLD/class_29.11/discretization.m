M = read_off('./deadpool.off');
M = remesh(M, struct('vertices', 1e4));

[S, ~, A] = calc_LB_FEM(M);

spy(A) % should give as the Identity (a diagonal)

% M.VERT(:,1)'*A*M.VERT(:,2) % this is how we compute inner product

% 0: shift we want to apply to the spectrum

% only thing we need is the discretization of the laplacian (S).
[M.evecs, M.evals] = eigs(S, A, 20, -1e-5); % 20: the number of eigenvalues we want to compute (e.g. first 20)
M.evals = diag(M.evals);

% let's have a look to the eigenfunctions

figure, colormap(bluewhitered)
for i=1:5
    subplot(M, M.evecs(:,i))
end

% the higher the values we use (e.g. 100 eigenvalues) the more the function
% oscillates, so we will notice more colour shifts on the shape.
% these are orthogonal with respect to the first shape
axis off
light; lighting phong; camlight head
% white 0, blue negative, red positive

imagesc(M.evecs'*A*M.evecs); axis image % DO NOT FORGET AREA ELEMENT, otherwise we won't get identity

%%
M.evecs(:,7)'*A*ones(M.n,1)
