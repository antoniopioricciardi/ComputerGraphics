function S = fps_euclidean(shape, seed, n)
%FPS_EUCLIDEAN Summary of this function goes here
%   seed: starting point
%   n: number of samples
    starting_p = shape.VERT(seed,:);
    S = zeros(n, 1);
    S(1) = seed;
    dist = pdist2(shape.VERT, shape.VERT(S(1),:));

    for i=2:n
        [x,ind] = max(dist);
        S(i) = ind;
    
        % for very edge, take the minimum distance value between
        % the previous computed distance and the 
        % distance of every vertex from the newly inserted vertex.
        % Then we will take the maximum among these min values; this will
        % be distance of the next farthest point.
        % This works cause when we add a new vertex, the next maximum
        % distance can only be <= than the current one and we don't need to
        % consider all of the vertices inserted before.
        % By performing the operation below (takin the min each time) we
        % make sure that there are no points at a further distance from any
        % vertex in the Sampling S.
    
        dist = min(pdist2(shape.VERT, shape.VERT(S(i), :)), dist);
    end
end

