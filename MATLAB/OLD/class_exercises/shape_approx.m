clear;
clc;

M = read_off('tr_reg_000.off');

[M.S,~,M.A] = calc_LB_FEM(M);

[M.evecs, M.evals] = eigs(M.S, M.A, 200, -1e-5);

fps = farthest_ps(M.VERT, 200, 1);

F = sparse(fps, 1:200, 1, M.n, 200);
A = M.evecs'*M.A*F;

%{
t = 0.001;
V = exp(-t*diag(M.evals));
k = M.evecs*spdiags(V, 0, length(V), length(V))*M.evals;
fps = farthest_ps(M.VERT, 20, 1);

G = sparse(fps, 1:20, 1, M.n, 20);
B = M.phi'*M.A*G;

C = k\B';
%}