% get neighbouring triangles

[M.triv(:,1) ; M.triv(:, 2); M.TRIV(:,3)], [1:M.m 1:M.m 1:M.m]

% more easily, do
P = sparse(M.TRIV(:), [1:m.m 1:m.m 1:m.m], 1, M.n, M.m);

logigal(P'*P)