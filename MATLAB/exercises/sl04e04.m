function [] = sl04e04
%For the human shape tr reg 000 . off , compute its minimum distortion
%Euclidean embedding into R1 using the gradient descent algorithm with a quadratic stress.
%Interpret the resulting embedding as a scalar function f : M → R.
%Create a new colormap ‘bluewhitered’ growing linearly from blue to white to red
%Render f as a colored mesh in Matlab (or your favorite environment) in the bluewhitered colormap
    
    % Rendering of 1d Euclidean embedding
    M = load_off('tr_reg_000.off');
    bwr = bluewhitered(100); %bluewhitered colormap
    subplot(2,2,1);
    plot_mesh(M);
    colormap(bwr);
    shading interp;
    camlight;
    title('original shape')
    
    
    %geodesic distances file
    file = load('tr_reg_000.D.mat');
    l_rate = 0.001;

    fps = fps_euclidean(M,1,100); %100 fps
    geo_dist = file.D(fps, fps);
    
    %get euclidean embeddings on the farthest point sampling
    emb_struct = get_euclidean_embedding(fps,geo_dist,1,200,l_rate,false);
    emb = emb_struct.VERT;
        
    vor_reg = voronoi(M, fps);
    % expand the embeddings found on the fps to the whole mesh
    expanded_lab = expand_labels(vor_reg, fps, emb);
    
    subplot(2,2,2);
    plot_mesh_scalar(M,expanded_lab);
    colormap(bwr);
    shading interp; camlight;
    title('epxansion of 100 fps')
    
    %----------------------------------
    
    fps = fps_euclidean(M,1,500);
    geo_dist = file.D(fps, fps);
    
    emb_struct = get_euclidean_embedding(fps,geo_dist,1,200,l_rate,false);
    emb = emb_struct.VERT;
        
    vor_reg = voronoi(M, fps);
    expanded_lab = expand_labels(vor_reg, fps, emb);
    
    subplot(2,2,3);
    plot_mesh_scalar(M,expanded_lab);
    colormap(bwr);
    shading interp; camlight;
    title('epxansion of 500 fps')
    %---------------------------------------------------
    
    fps = fps_euclidean(M,1,1000);
    geo_dist = file.D(fps, fps);
    
    emb_struct = get_euclidean_embedding(fps,geo_dist,1,10,l_rate,false);
    emb = emb_struct.VERT;
        
    vor_reg = voronoi(M, fps);
    expanded_lab = expand_labels(vor_reg, fps, emb);
    
    subplot(2,2,4);
    plot_mesh_scalar(M,expanded_lab);
    colormap(bwr);
    shading interp; camlight;
    title('epxansion of 1000 fps')

    
    
end

