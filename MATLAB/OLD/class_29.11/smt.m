M = read_off('deadpool.off');
M = remesh(M, struct('vertices', 1e4));

[S, ~, A] = calc_LB_FEM(M);

spy(A) % should give as the Identity (a diagonal)

% M.VERT(:,1)'*A*M.VERT(:,2) % this is how we compute inner product

% 0: shift we want to apply to the spectrum

% only thing we need is the discretization of the laplacian (S).
[M.evecs, M.evals] = eigs(S, A, 20, -1e-5); % 20: the number of eigenvalues we want to compute (e.g. first 20)
M.evals = diag(M.evals);

ind = zeros(M.n,1);
p = 9368;
ind(p) = 1;

% take indicator function and project it into the first 20 eigenfunctions
figure, colormap(jet)
for i=1:3
    subplot(1,3,i)
    c = M.evecs(:,1:(i*20))'*A*ind;
    f = M.evecs(:,(i*20))*c; % Fourier synthesis
    plot_scalar_map(M,f)
end

% Laplace-Beltrami basis is the optimal basis for smooth functions
