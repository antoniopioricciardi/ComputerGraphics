M = read_off('dog.off')
sym = load('sym/idk')

P_dir = speye(M.n);
P_sym = sparse(1:M.n, sym, 1, M.n, M.n);

p = 18754; % or 16074
f = exp(-sum((M.VERT(p,:)-M.VERT).^2,2)./100);

% figure, plot_scalar_map(M, f)
% figure, plot_scalar_map(M, P_sym*f)

figure
for t=0:0.02:1
    S = (1-t)*P_dir + t*P_sym;
    g = S*f;
    plot_scalar_map(M, g)
    axis off
    light; camlight head; lighting phong
    drawnow
end
