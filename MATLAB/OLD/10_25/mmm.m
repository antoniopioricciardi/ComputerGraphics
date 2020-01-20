M = read_off('dog0.off')
normals = cross(M.VERT(M.TRIV(:,2),:) - M.VERT(M.TRIV(:,1),:), M.VERT(M.TRIV(:,3),:) - M.VERT(M.TRIV(:, 1),:))
figure, plot_mesh(M), hold on

centroids = calc_centroids(M)

% by looking at norms, we can see that some are pointing inside. This
% means they're not consistently oriented.