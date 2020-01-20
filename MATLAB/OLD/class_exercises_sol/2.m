% Schrodinger eigenbasis

% all pts on the Y coord and above 0

M = read_off('tr_reg_000.off');

[M.S,~,M.A] = calc_LB_FEM(M);

u = double(M.VERT(:,2)>0.35);

% with this weight, functions on the figures just look as the usual
% eigenfunctions
% mu = 1.0;
mu = 100.0;
R = M.A * spdiag( (1-u).^2);

[evecs, ~] = eigs(M.S + mu*R, M.A, 10, 'sm')

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

% we're concentrating eigenfunctions on the regions we selected
% if we increase the frequency of the eigenfunctions we would get more
% details.
