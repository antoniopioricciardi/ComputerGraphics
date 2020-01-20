function [] = sl04e01
    % inverting a colormap
    M = load_off('cat0.off');
    dists = l2distances(M.VERT(1,:), M.VERT);
    
    colors = colormap(hot);
    colors = flip(colors); % invert the colormap (from end to beginning)
    
    red_map = ones(100,3);
    red_map(:,1) = 1;
    red_map(:,2) = linspace(1,0,100);
    red_map(:,3) = linspace(1,0,100);
    
    subplot(1,3,1);
    plot_mesh_scalar(M, dists)
    colormap(gca,hot);
    shading interp;
    light;
    
    subplot(1,3,2);
    plot_mesh_scalar(M, dists,'AmbientStrength',0.5, 'SpecularStrength',0.6)
    colormap(gca,colors);
    camlight('headlight');
    shading interp;
    
    subplot(1,3,3);
    plot_mesh_scalar(M, dists,'AmbientStrength',0.5, 'SpecularStrength',0.6)
    colormap(gca,red_map);
    camlight('headlight');
    shading interp;
end

