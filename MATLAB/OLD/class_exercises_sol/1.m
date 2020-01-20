M = read_off('tr_reg_000.off');

[M.S,~,M.A] = calc_LB_FEM(M);

[M.evecs, M.evals] = eigs(M.S, M.A, 200, -1e-5);
