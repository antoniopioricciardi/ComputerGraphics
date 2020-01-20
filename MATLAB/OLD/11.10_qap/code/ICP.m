clc;
clear;
M = read_off('bun000.off')
N = read_off('bun045.off')

get_plot(N)
fps_M_ind = farthest_ps(M.VERT, 300, 1);
fps_N_ind = farthest_ps(M.VERT, 300, 1);

fps_M = M.VERT(fps_M_ind);
fps_N = M.VERT(fps_N_ind);

fps_M_centered = fps_M - mean(fps_M);
fps_N_centered = fps_N - mean(fps_N);

idx = knnsearch(fps_M_centered, fps_N_centered);

X = fps_M_centered(idx, :);
Y = fps_N_centered;

[U, ~, V] = svd(X'*Y);
T = U*V'