function [ c,d,I,v ] = get_boundary_edges( tri )
%GET_BOUNDARY determines the boundary edges of a triangular mesh 
%   [c,d] = get_boundary(tri) takes as input a list tri of consistently oriented triangles
%   returns the indices c of the triangles the boundary edges belong to and
%   the (local) indices d (in {1,2,3}) of the vertices opposing the boundary
%   edge
%   One gets the global indices of those vertices via F(sub2ind(size(F),c,d))
%   Via 
%   d1 = mod(d+1,3); d1(d1==0) = 3;
%   d2 = mod(d+2,3); d2(d2==0) = 3;
%   one gets the local indices of the boundary vertices.


if size(tri,1)<size(tri,2)
    tri=tri';
end
m = size(tri,1);

%% Check for opposing halfedges

% Matrix of directed edges
I = [tri(:,1) tri(:,2);
     tri(:,2) tri(:,3);
     tri(:,3) tri(:,1)];

%ismember(a,b, 'rows') - check wether a is in b. 'rows' treats each row of a and b as single entities,
%thus returns 1 for rows in a if they totally match to a row in b.
% by looking for [2 1] we're looking for an edge in a triangle that has another order in another one (remember, leftfold order matters).
% if it is not found (0 for that row), that means the edge is a boundary edge, thus we pick that with the not(..).
b = not(ismember(I(:,[2 1]),I,'rows'));

% returns the indices of the 1s.
b = find(b);



% Triangle indices
c = mod(b,m);
c(c==0) = m;

% vertex opposing boundary edge
d = floor((b-1)/m);
d(d==0)=3;


% Directed boundary edges
I=I(b,:);

% Boundary vertices
[~,~,v] = find(I);
v = unique(v);

end