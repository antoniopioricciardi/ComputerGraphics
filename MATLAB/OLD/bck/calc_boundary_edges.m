function bound_edges = calc_boundary_edges(shape)
    triangles = shape.TRIV;
    ap = length(triangles);
    %p is the list of points
    %T is the list of triangles, ap is the number of points
    %this computes the adjacency matrix
    A = min(sparse(triangles(:,1),triangles(:,2),1,ap,ap)+sparse(triangles(:,2),triangles(:,3),1,ap,ap)+sparse(triangles(:,3),triangles(:,1),1,ap,ap),1);
    A = min(A+A',1);
    % this finds the boundary points, whose indexes are stored in Ibord
    boundaries = A^2.*A==1;
    % Ibord = find(sum(B,2)>0);
    
    % this should produce both a,b and b,a
    [v_ind1, v_ind2, foo] = find(boundaries);
    bound_edges = [v_ind1, v_ind2];
end

