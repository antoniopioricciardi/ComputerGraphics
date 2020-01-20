M = read_off('tr_reg_001.off');
N = read_off('tr_reg_002.off');

[M.S, ~, M.A] = calc_LB_FEM(M);
[M.phi, ~,] = eigs(M.S, M.A, 10, -1e-5);

[N.S, ~, N.A] = calc_LB_FEM(N);
[N.phi, ~,] = eigs(N.S, N.A, 10, -1e-5);

Pi = speye(M.n);
C = M.phi'*Pi'N.A*N.phi;

%%
%plot spectral embeddings
plot_cloud([], N.phi(:,2:4), 'r.'); hold on
plot_cloud([], M.phi(:,2:4), 'b.')
% shapes have their own space, they're not supposed to align. 
% What aligns them is the application of C.

% i should get the same point cloud as the blue one, but black.
% I tried to align red to blue by multiplying C to the red shape (N.phi')
X = (C*N.phi')';
plot_cloud([], X(:,2:4), 'k.')


