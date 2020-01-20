function dist = l2distances(v,vertices)
%L2DISTANCES Compute the Euclidean distance between vertex v
% and a list of vertices.
% This also works if v is another list of vertices


%   sqrt( SUM( |v - vi|^2))

%vecnorm(matrix, p, d)
% - p is the type of distance to pefrorm: p=2 is Eucl.
% - d is the dimension on which we want to compute it: d = 2 is on columns
dist = vecnorm(v-vertices,2,2);

%{
% sum(a,2) - computes the sum of the elements of matrix a on the 2nd dim.
sqrt(sum((v-a).^2,2))
%}
end

