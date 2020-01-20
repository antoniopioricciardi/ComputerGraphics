function [] = sl04e02
    %Colored point cloud over a mesh
    
    % our colormap has k numbers, while our point cloud has a number n>>k
    % of vertices. We need to map mesh values into colormaps
    ax1 = axes;
    ax2 = axes;
    
    M = load_off('cat0.off');
    dists = l2distances(M.VERT(1,:), M.VERT);
    
    vertices_y = M.VERT(:,2);
    %normalize values
    min_y = min(vertices_y);
    max_y = max(vertices_y);
    
    vertices_y_norm = (vertices_y-min_y)/(max_y - min_y);
    vertices_y_norm = round(1 + 255 * vertices_y_norm);
    
    subplot(1,2,1);

    ax1 = plot_mesh_scalar(M,ones(M.n,1));
    colormap(gca,white);
    hold on;
    ax2 = plot_point_cloud(M,1,vertices_y_norm);
    colormap(gca,jet);
    
    camlight('headlight');
    shading interp;
    
    subplot(1,2,2);
    plot_mesh_scalar(M, dists,'AmbientStrength',0.5, 'SpecularStrength',0.6)
    colormap(gca,jet);
    camlight('headlight');
    shading interp;
    
end

