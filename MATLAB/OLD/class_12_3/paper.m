M = read_off('tr_reg_001.off');
N = read_off('tr_reg_002.off');

[M.S, ~, M.A] = calc_LB_FEM(M);
[M.phi, ~,] = eigs(M.S, M.A, 20, -1e-5);

[N.S, ~, N.A] = calc_LB_FEM(N);
[N.phi, ~,] = eigs(N.S, N.A, 20, -1e-5);

% 20 by 20 is enough to get good correspondences

plot_scalar_map(M, M.phi(:,2))

imagesc(M.phi'*M.A*M.phi); axis

c = VORONOI\STANDARD

T.F'*N.A*N.phi 

Pi = speye(M.n)
c = M.phi' * Pi'*N.A*N.phi; %This is kxk

figure, imagesc(C), axis image; colorbar; colormap(bluewhitered)
% linear comb coefficients: eigenfunction in rows equals eigenfuncts in
% columns time the value contained in cells

figure, colormap(bluewhitered)
subplot(131), plot_scalar_map(N, N.phi(:,2));  view([0 90]); axis image
subplot(132), plot_scalar_map(M, pi*N.phi(:,2));  view([0 90]); axis image % transport N function over M
subplot(133), plot_scalar_map(M, M.phi(:,2));  view([0 90]); axis image
% if these functions are the same, their inner product should be 1


subplot(131), plot_scalar_map(N, -N.phi(:,2));  view([0 90]); axis equal
subplot(132), plot_scalar_map(M, -pi*N.phi(:,2));  view([0 90]); axis equal % transport N function over M
% inner product between these 2 should be -1

f = N.VERT(:,1);

figure, colormap(bluewhitered)
subplot(131), plot_scalar_map(N, f);  view([0 90]); axis image
subplot(132), plot_scalar_map(M, M.phi*C*(N.phi'*N.A*f));  view([0 90]); axis image

% transfer a function to another without using pi

%%
% pick a point with pick_points(N) function
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



