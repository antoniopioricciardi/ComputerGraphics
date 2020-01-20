function canonical_shape = create_canonical(M_fps, distances, emb_dimension)

[n_vert, dim] = size(M_fps);

canonical_shape = rand(n_vert, emb_dimension);

lr = 0.00001;
iter = 1000;
V = n_vert*eye(n_vert) - ones(n_vert,n_vert);

for i = 0 : iter
    pd = pdist2(canonical_shape, canonical_shape);
    B = (-distances ./ pd) + diag((distances ./ pd)*ones(n_vert, 1));
    B(isnan(B)) = 0;
    canonical_shape = canonical_shape - 2*lr*(V*canonical_shape - (B*canonical_shape));
    scatter3(canonical_shape(:,1), canonical_shape(:,2), canonical_shape(:,3));
    axis equal;
    drawnow
end

%CREATE_CANONICAL Summary of this function goes here
%   Detailed explanation goes here
end

