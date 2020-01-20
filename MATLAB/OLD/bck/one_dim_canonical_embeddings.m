M = read_off('01.10_mds/code/tr_reg_000.off');
D = load('01.10_mds/code/tr_reg_000.D.mat');
D = D.D;
fps_ind = farthest_ps(M.VERT, 1000, 1);
distances = D(fps_ind, fps_ind);
M_fps = M.VERT(fps_ind, :);
create_canonical(M_fps, distances, 3);