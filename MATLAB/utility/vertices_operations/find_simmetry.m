function symmetries = find_simmetry(shape, dim)
%FIND_SIMMETRY Find simmetry points of a shape
% Takes as an input a shape and a dimension dim.
% Finds the mean point over that dimension, then return a list containing
% 1s for points in a greater position w.r.t. the mean, 0 otherwise
    vertexes = shape.VERT;
    max_coord = max(shape.VERT);
    min_coord = min(shape.VERT);
    d = max_coord - min_coord;
    
    %{
    [~, ind_1] = max(d);
    %d(ind_1) = -inf;
    
    [~, ind_2] = max(d);
    
    m = mean(shape.VERT(:,ind_2));
    symmetries = shape.VERT(:,ind_2) > m;
    %}
    
    m = mean(vertexes(:,dim));
    symmetries = vertexes(:, dim) > m;
    

end

