M = rad_off('idk');

f = rand(M.n,1);

A = calc_LB_FEM(M);

figure

for a=0.001:0.001:5
    plot_scalar_map(M,f); drawnow
    f = f-a*A*f;
end