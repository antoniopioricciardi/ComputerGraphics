function Z = create_canonical(M_fps, distances, emb_dimension)

[n_vert, dim] = size(M_fps);

Z = rand(n_vert, emb_dimension);

lr = 10^(-4);
iter = 1000;
V = n_vert*eye(n_vert) - ones(n_vert, n_vert);

for i = 0 : iter
    Dz = pdist2(Z, Z);
    k = distances ./ Dz;
    k(isnan(k)) = 0;
    B = -k + diag(k*ones(n_vert, 1));
    Z = Z - 2*lr*(V*Z - (B*Z));
    scatter3(Z(:,1), Z(:,2), Z(:,3));
    axis equal;
    drawnow
end

%CREATE_CANONICAL Summary of this function goes here
%   Detailed explanation goes here
end

