function [] = sl04e03
%   Rendering of farthest point sampling
    M = load_off('shapes/cat_partial.off');
    
    %   - Compute a Euclidean farthest point sampling of 50 points
    fps = fps_euclidean(M,1,50);
    
    %Render the mesh with flat white color, with the farthest point
    %samples rendered as blue points on top, and the boundary of the mesh visualized in red
    [e, v, t] = get_boundary_edges(M.TRIV);
    M1 = []
    M1.VERT = M.VERT
    M1.TRIV = t

    t1 = plot_mesh(M);
    colormap(white);
    shading interp;
    camlight;
    hold on;
    
    t2 = plot_mesh(M1, 'Facecolor', 'r', 'EdgeColor', 'r');
    set(t2, 'LineWidth', 2);
    title('Boundary edges over mesh');
end

