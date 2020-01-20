M = read_off('tr_reg_001.off');
N = read_off('tr_reg_002.off');

[M.S, ~, M.A] = calc_LB_FEM(M);
[M.phi, ~,] = eigs(M.S, M.A, 10, -1e-5);

plot_cloud([], M.phi(:, 4:6), 'r.')

[N.S, ~, N.A] = calc_LB_FEM(N);
[N.phi, ~,] = eigs(N.S, N.A, 10, -1e-5);

% pick a point with pick_points(N) function

% use fps as correspondence functions
fps = fps_euclidean(N.VERT, 20, 1);

F = sparse(fps, 1:20, 1, N.n, 20); % nx20 matrix, each column has a 1 at the position of the fps
G = sparse(fps, 1:20, 1, M.n, 20);

% maybe 20 is too much

A = N.phi'*N.A*F;
G = M.phi'*M.A*G;

C = A'\B';

%%
p = 1;
f = zeros(N.n, 1);
f(p) = 1;

p = 1;
g = zeros(M.n, 1);
f(p) = 1;

a = N.phi'*N.A*f;
b = M.phi'*M.A*g;

C = a'\b';
%%

p = 4806;
f = zeros(N.n, 1);
f(p) = 1;

figure, colormap(bluewhitered)
subplot(131), plot_scalar_map(N, f); view([0 90]); axis off
subplot(132), plot_scalar_map(M, M.phi*C*(N.phi'*N.A*f));  view([0 90]); axis image 
% the point will be super smooth because it is approximated because of C

% the rank defines the quality of the map, if instead of 20 pts we take 100
% points, it will be better approximated.
% The rank of C is at most the chosen rank.

% We won't be able to recover pi from C without injecting extra
% information.



