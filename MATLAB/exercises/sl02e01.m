%slide 2, exercise 1: L2 dist in R3
%Let us be given a triangle mesh M and the associated point cloud P
%obtained by removing the mesh connectivity from M.
%For a given vertex v of M , compute dL2 (v, x), i.e., the L2 distance
%from v to all other vertices x in M.
%Make sure you understand that, for a fixed v, 
%the distance dL2 (v, x) can be seen as a scalar function fv : M → R such that
%fv(x) = dL2(v,x)
%Visualize fv by coloring the mesh, by assigning a different vertex color 
%to each value of fv; in Matlab, you can use the trisurf () function

%Compute and visualize the average L2 distance function, defined as:
%avg(v) = SUM_x∈M (fv(x))
    

function [] = sl02e01()
    M = load_off('shapes/cat0.off')
    vert = randi(M.n); % pick a random vertex
    disp('Picked Vertex:')
    M.VERT(vert,:)
    
    shape_dist = l2distances(M.VERT(vert, :), M.VERT);
    
    avg_distances = zeros(M.n, 1);
    
    % this takes a while. Search for a more efficient method
    for i=1:M.n
       avg_distances(i) = sum(l2distances(M.VERT(i,:), M.VERT));
    end

    
    figure;
    %plot the standard shape
    subplot(1,3,1);
    plot_mesh(M);
    hold on;
    shading interp;
    title('Standard Figure');
    
    subplot(1,3,2);
    %plot the shape with colours as distance from the random seed
    p = plot_mesh_scalar(M, shape_dist);
    %set transparence to see the random seed point
    set(p, 'FaceAlpha', 0.5);
    set(p, 'EdgeAlpha', 0.025);
    hold on;
    % visualize the random seed
    p = scatter3(M.VERT(vert,1), M.VERT(vert,2), M.VERT(vert,3), 40, 'r');
    p.MarkerFaceColor = 'r';
    shading interp;
    title('Colours as distance from red point');
    
    subplot(1,3,3);
    %plot the average distances for each point on the shape
    plot_mesh_scalar(M, avg_distances);
    shading interp;
    title('Average Distances');

end
