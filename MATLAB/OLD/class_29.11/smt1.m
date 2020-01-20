M = load_ply('tr_reg_000.ply');
N = load_ply('tr_reg_001.ply')

[S, ~, M.A] = calc_LB_FEM(M);
[S, ~, N.A] = calc_LB_FEM(N);

[M.evecs, M.evals] = eigs(S, M.A, 20, -1e-5); % 20: the number of eigenvalues we want to compute (e.g. first 20)
[N.evecs, N.evals] = eigs(S, N.A, 20, -1e-5); % 20: the number of eigenvalues we want to compute (e.g. first 20)
%M.evals = diag(M.evals);
%nN.evals = diag(N.evals);

ind = zeros(M.n,1);
p = 9368;
ind(p) = 1;

% take indicator function and project it into the first 20 eigenfunctions
figure, colormap(jet)
for i=1:3
    subplot(1,3,i)
    c = M.evecs(:,1:(i*20)'*A*ind;
    f = M.evecs(:,(i*20))*c; % Fourier synthesis
    plot_scalar_map(M,f)
end
