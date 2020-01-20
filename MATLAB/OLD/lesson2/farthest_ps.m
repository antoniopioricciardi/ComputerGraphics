function S = farthest_ps(vertices, n, seed)
%FARTHEST_PS Summary of this function goes here
%   Detailed explanation goes here

S = zeros(n, 1);
S(1) = seed;
dist = pdist2(vertices, vertices(seed, :));
for k = 2 : n
    [val, indMax] = max(dist);
    S(k) = indMax;
    % dist = pdist2(vertices, vertices(S(k), :));
    dist = min(pdist2(vertices, vertices(S(k), :)), dist);
end
end

