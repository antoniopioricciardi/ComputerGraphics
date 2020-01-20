%slide 2 exercise 2: farthest sampling and voronoi decomposition.
%Compute the farthest point sampling on a mesh and then perform the voronoi
%decomposition of it.

%Implement Voronoi decomposition for meshes and point clouds using
%the Euclidean metric and using farthest point sampling for S Visualize the
%Voronoi regions by assigning to each of them a random color

function [] = sl02e02()
    shape = load_off('shapes/cat0.off');
    
    figure;
    subplot(2,2,1);
    sampling_ind = fps_euclidean(shape,1, 10);
    vor_regions = voronoi(shape,sampling_ind);
    
    plot_mesh_scalar(shape,vor_regions);
    shading flat;
    hold on;
    scatter3(shape.VERT(sampling_ind,1), shape.VERT(sampling_ind,2), shape.VERT(sampling_ind,3), 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r');
    
    title('10 Voronoi regions with sampling points (starting at 1)');
    
    
    %------------------
    subplot(2,2,2);
    sampling_ind = fps_euclidean(shape,1, 20);
    vor_regions = voronoi(shape,sampling_ind);
    
    plot_mesh_scalar(shape,vor_regions);
    shading flat;
    hold on;
    scatter3(shape.VERT(sampling_ind,1), shape.VERT(sampling_ind,2), shape.VERT(sampling_ind,3), 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r');
    
    title('20 Voronoi regions with sampling points (starting at 1)');

    %------------------
    subplot(2,2,3);
    
    seed = randi(shape.n,1)
    sampling_ind = fps_euclidean(shape,seed, 10);
    vor_regions = voronoi(shape,sampling_ind);
    
    plot_mesh_scalar(shape,vor_regions);
    shading flat;
    hold on;
    scatter3(shape.VERT(sampling_ind,1), shape.VERT(sampling_ind,2), shape.VERT(sampling_ind,3), 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r');
    
    title(sprintf('10 Voronoi regions with sampling points (starting at %i)', seed));
    
    
    %------------------
    subplot(2,2,4);
    seed = randi(shape.n,1)
    sampling_ind = fps_euclidean(shape,seed, 10);
    vor_regions = voronoi(shape,sampling_ind);
    
    plot_mesh_scalar(shape,vor_regions);
    shading flat;
    hold on;
    scatter3(shape.VERT(sampling_ind,1), shape.VERT(sampling_ind,2), shape.VERT(sampling_ind,3), 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r');
    
    title(sprintf('10 Voronoi regions with sampling points (starting at %i)', seed));

end