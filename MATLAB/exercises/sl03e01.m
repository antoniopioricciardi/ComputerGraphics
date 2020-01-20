% Exercise: Symmetry detection
%Write an algorithm that finds the left-right labeling for the human mesh tr_reg_000.off (download from course page).
%Compute a canonical form f(M) for the mesh M





% L R labeling: Separate the left side of the mesh from the right side.
% E.g: assign a value of 0 to the points to the left, 1 to the points to
% the right
function [] = sl03e01
    M = load_off('shapes/tr_reg_000.off');
    
    %To speed-up computation, run the algorithm on a farthest point
    %sampling of the mesh, and then expand the solution to all remaining
    %points via Voronoi decomposition.
    
    
    %start with a random configuration of points
    fps = fps_euclidean(M, randi(M.n,1), 1000);
    fps_shape = [];
    fps_shape.VERT = [M.VERT(fps,1), M.VERT(fps,2), M.VERT(fps,3)];
    
    % geodesic distances of the original shape, from each point to each
    % other
    dist = load('tr_reg_000.D.mat');
    
    % only take the distances in the farthest point sampling
    geo_dist = dist.D(fps, fps);
    
    % create embedding in the 3D, 2D and 1D spaces.
    embedding_3d = get_euclidean_embedding(fps,geo_dist,1000, 3, false);
    
    embedding_2d = get_euclidean_embedding(fps,geo_dist,1000, 2, false);
    embedding_2d.VERT = pad(embedding_2d.VERT,1);
        
    % on 1d, the euclidean embedding is trying to stretch the mesh onto the
    % line such that the distance of points is approximated by the
    % absolute distance on the line. This is giving us an ordering of
    % points of the shape in an increasing order, according to the
    % euclidean embedding.
    
    % Why is it useful: Imagine if we have two human shapes in a different
    % pose and we want to match them (find, for each point, a corresponding
    % point), thus we embed them on the real lin (1-dim) and, for the same
    % numbers we place corresponding points.
    embedding_1d = get_euclidean_embedding(fps,geo_dist,250, 1, false);
    embedding_1d.VERT = pad(embedding_1d.VERT, 2);
    
    
    max_coords = max(embedding_3d.VERT);
    min_coords = min(embedding_3d.VERT);
    mean_coords = (max_coords + min_coords)/2;
    
    embedding_3d_centered = [];
    embedding_3d_centered.n = embedding_3d.n;
    embedding_3d_centered.VERT = embedding_3d.VERT - mean_coords;
    
    embedding_3d_centered.VERT = embedding_3d_centered.VERT*pca(embedding_3d_centered.VERT);
    
    symmetries = find_simmetry(embedding_3d_centered, 2);
    
    %symmetries(symmetries==1) = 125;
    %symmetries(symmetries==0) = 1;
    symm = int16(symmetries);
    symm(symm==1) = 125;
    symm(symm==0) = 1;
    
    figure;
    
    subplot(3,3,1);
    plot_point_cloud(fps_shape)
    title('original sampling')
    
    subplot(3,3,2);
    plot_point_cloud(embedding_3d)
    title('3D embedding')
    
    subplot(3,3,3);
    plot_point_cloud(embedding_3d_centered)
    title('3D embedding, centered')

    subplot(3,3,4);
    plot_point_cloud(embedding_3d_centered,1, symm);
    
    subplot(3,3,5);
    plot_point_cloud(embedding_2d);
    title('2D embedding');    

    
    subplot(3,3,6);
    plot_point_cloud(embedding_1d);
    title('1D embedding');        
    
    
end