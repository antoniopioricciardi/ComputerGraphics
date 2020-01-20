function distortion = metric_distortion(fps_M, fps_N)
% input: already mapped VERTICES of the farthest points
distances_M = pdist2(fps_M, fps_M);
distances_N = pdist2(fps_N, fps_N);
% max(max..)) because the inner max takes the max value for each distances
% column (the max value of distances between a vertex and all other
% vertices).
distortion = 1/2 * max(max(abs(distances_M - distances_N)));
end

