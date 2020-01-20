function embed = get_euclidean_embed(fps, distances, dimensions, num_iterations, l_rate, do_plot)
    %GET_EUCLIDEAN_EMBED Create canonical embeddings starting from a random
    %configuration of points
    % fps: farthest point sampling of the shape
    % distances: vertex-to-vertex distances of the original shape
    % num_iterations: the number of iterations to perform
    % dimensions: in how many dimensions the shape must be embedded
    % do_plot: if true > plot the creation of the embedding during the
    % process
    %   By using the vertex-to vertex distances of the original shape,
    %   create a canonical embedding of that shape starting from a random
    %   configuration of points.
    % A canonical embedding is a conversion of a shape from a metric to
    % another (Euclidean).
    
    % One can see, as the algorithms runs and iterations go on, that the
    % stress decreases, until we reach some stationary point
    
    % initial embeddings (usually random)
    Z = rand(length(fps), dimensions);
    
    % distances are the vertex-to-vertex distances of the original shape
    D_x = distances;
    
    n_vert = length(fps);
    alpha = l_rate; % "learning rate"
    
    ones_mat = ones(n_vert, 1);
    V = n_vert * eye(n_vert) - ones_mat * ones_mat';
    
    % at each iteration I need to compute the distance matrix of the
    % current configuration of points (pdist2(Z,Z)).
    
    % the stress is the L2 distance between the Geodesic distances and the
    % Euclidean distances.
    if do_plot == true
        figure;
    end
    for i=1:num_iterations
        D_z = pdist2(Z,Z);
        K = (D_x./D_z);
        K(isnan(K))=0;
        B = -K + diag(K*ones_mat);
        
        Z = Z - 2*alpha*(V*Z - (B*Z)); %gradient descent step
        if (do_plot)
            if dimensions == 3
                scatter3(Z(:,1), Z(:,2), Z(:,3));
                drawnow limitrate nocallbacks;
            end
            if dimensions == 2
                scatter(Z(:,1), Z(:,2));
                drawnow limitrate nocallbacks;
            end
            if dimensions == 1
                scatter(Z, zeros(length(Z),1))
                drawnow limitrate nocallbacks;
            end
        end
    end
    
    % create a structure for the embedding so that functions can be easily
    % used for it.
    embed = [];
    embed.VERT = Z;
    embed.n = n_vert;    
end

