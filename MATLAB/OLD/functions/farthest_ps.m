function S = farthest_ps(vertices, n, seed)
%FARTHEST_PS returns indices of the minimum maximum distances among set of
%points
%   Detailed explanation goes here

S = zeros(n, 1);
S(1) = seed;
dist = pdist2(vertices, vertices(seed, :));
for k = 2 : n
    [~, indMax] = max(dist);
    S(k) = indMax;
    % dist = pdist2(vertices, vertices(S(k), :));
    dist = min(pdist2(vertices, vertices(S(k), :)), dist);
end
end

