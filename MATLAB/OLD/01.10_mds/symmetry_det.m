M = read_off('01.10_mds/code/tr_reg_000.off');
D = load('01.10_mds/code/tr_reg_000.D.mat');
D = D.D;
fps_ind = farthest_ps(M.VERT, 500, 1);
distances = D(fps_ind, fps_ind);
M_fps = M.VERT(fps_ind, :);
M_fps_embeddings = create_canonical_noplot(M_fps, distances, 3);


M_fps_embeddings_centered = M_fps_embeddings - mean(M_fps_embeddings);
M_fps_pca = M_fps_embeddings_centered*pca(M_fps_embeddings_centered);

jet_L = (M_fps_pca(:, 1) - min(M_fps_pca(:, 1)))/(max(M_fps_pca(:, 1)) - min(M_fps_pca(:, 1)));
jet_L = round(1 + 255.*(jet_L));
jet_R = (M_fps_pca(:, 2) - min(M_fps_pca(:, 2)))/(max(M_fps_pca(:, 2)) - min(M_fps_pca(:, 2)));
jet_R = round(1 + 255.*(jet_R));
scatter3(M_fps(:,1), M_fps(:,2), M_fps(:,3), 5, jet_L);
axis equal;
