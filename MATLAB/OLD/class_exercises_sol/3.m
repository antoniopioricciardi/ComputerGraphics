M = read_off('tr_reg_001.off');
N = read_off('tr_reg_002.off');

[M.S,~,M.A] = calc_LB_FEM(M);
[N.S,~,N.A] = calc_LB_FEM(N);

p =  4688;
u = double(pdist2(M.VERT(p,:), M.VERT) <= 0.1);

mu = 10000.0;
M.R = M.A * spdiag( (1-u).^2);
N.R = N.A * spdiag( (1-u).^2);

[M.evecs, ~] = eigs(M.S + mu*M.R, M.A, 10, 'sm');
[N.evecs, ~] = eigs(M.S + mu*N.R, M.A, 10, 'sm');

P = speye(M.m);

% inner prod between bases functions on N and bases functions on M.
C = N.evecs' * N.A * P * M.evecs;

%%
% delta function represented in the new schrodinger eigenbasis
ind = zeros(M.n,1);
ind(p) = 1;

figure, colormap(bluewhitered)

subplot(121)
plot_scalar_map(M, M.evecs*(M.evecs'*M.A*ind)
axis off; view([0 90])
light; camlight head; lighting phong

subplot(122)
plot_scalar_map(N, N.evecs*(M.evecs'*M.A*ind)
axis off; view([0 90])
light; camlight head; lighting phong

% Schrodinger eigenbasis tries to be mostly accurate on the selected
% region, but doesn't care that much about the entire shape.

%%
% if you notice loss of localization (the function spreads), just increase
% the weight.
figure, colormap(bluewhitered)
for i=1:10
    f = evecs(:,i);
    th = max(abs(f));
    subplot(2,5,i)
    plot_scalar_map(M, f)
    axis off; view([0 90])
    light; camlight head; lighting phong
    caxis([-th th]) % in this way the 0 must be white
end

% use this to check if C is more or less diagonal
%imagesc(C), axis image, colormap(blue) 
