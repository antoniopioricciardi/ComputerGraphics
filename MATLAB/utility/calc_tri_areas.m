function S_tri = calc_tri_areas(M)

S_tri = zeros(size(M.TRIV,1),1);

for k=1:size(M.TRIV,1)
    % get the length of two of the three triangle edges (e1, e2)
    e1 = M.VERT(M.TRIV(k,3),:) - M.VERT(M.TRIV(k,1),:);
    e2 = M.VERT(M.TRIV(k,2),:) - M.VERT(M.TRIV(k,1),:);
    %compute the area: 1/2*(||AxB||)
    S_tri(k) = 0.5*norm(cross(e1,e2));
end

end
