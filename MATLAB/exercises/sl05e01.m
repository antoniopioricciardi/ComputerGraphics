% Exercise: Voronoi basis
% - Construct a Voronoi decomposition of 100 regions using Euclidean Metric.
% - By interpreting each region as an indicator function (meaning a function that is 0 everywhere,
% except at the region where it is 1 (so, 100 functions), consider the
% resulting 100-dimensional Voronoi basis.
% Put the functions in a set and claim that it's a basis for some vect.
% space. Prove that they are a basis (see if they're linearly independent)

% - Interpret the x, y, z coordinates of the shape as (3) scalar functions defined on the mesh vertices

% For the bunny.off mesh
% - Express these functions in the Voronoi basis by solving, for each function, the linear system
% V*c /approx x
% where V contains the basis functions as its columns, and x is the matrix
% representation of coordinate x in the standard basis

% V dimension is nx100 (100 cols, one per Voronoi basis funct) and n
% vertices (one per vertex). This matrix will be full of zeros (ones at
% each regions, all the rest are zeros)

% - Go back to the standard basis by computing Vc and plotting the result as color on the original mesh
% in theory we should get back x, but in practice we will get back some
% other functions

% c dimension: 100x1 (these are linear comb. coefficients)
% Vc is nx1
% if I have a n-dim voronoi decomposition c and x would represent the same
% vector, just in different bases.
% Again, c and x are different representations for the same vector: x in
% the standard basis, c in Voronoi basis.


function [] = sl05e01

    M = load_off('shapes/bunny.off');
    
    % Euclidean distances among vertices of the shape.
    distances = pdist2(M.VERT, M.VERT);
    seed = 1;
    num_regions = 100;
    fps = fps_euclidean(M,seed,num_regions);
    
    % voronoi decomposition of 100 regions (size 10000x1)
    voro_regions = voronoi(M,fps);
    voro_basis = zeros(M.n, 100);
    
    % V is nx100 (10000x100)
    for i=1:num_regions
        voro_basis(voro_regions==i, i) = voro_regions(fps((i)));
    end
    
    % interpret x,y,z as scalar functions
    x_funct = M.VERT(:,1);
    z_funct = M.VERT(:,2);
    y_funct = M.VERT(:,3);
    
    % express x,y,z in the voronoi basis
    % A\B is used to find coefficients c in A*c = B
    x_vor_basis = voro_basis\x_funct;
    y_vor_basis = voro_basis\y_funct;
    z_vor_basis = voro_basis\z_funct;
    
    % back to standard basis (voro_basis*x_voro)
    x_stand = voro_basis*x_vor_basis;
    y_stand = voro_basis*y_vor_basis;
    z_stand = voro_basis*z_vor_basis;
    

    % expand embeddings to plot voronoi regions over the whole mesh
    emb_struct = get_euclidean_embedding(fps,distances(fps,fps),1,100,0.001,false);
    emb = emb_struct.VERT;
    
    % expand the embeddings found on the fps to the whole mesh
    expanded_lab = expand_labels(voro_regions, fps, emb);
    
    
    subplot(2,3,1);
    plot_mesh(M);
    shading flat;
    title('original shape (colored according to y coord)');
    colormap(hsv);
    
    subplot(2,3,2);
    plot_mesh_scalar(M,expanded_lab);
    colormap(hsv);
    shading interp;
    title('epxansion of 100 fps')
    
    
    
    subplot(2,3,4);
    plot_mesh_scalar(M,x_stand);
    shading interp;
    title('shape colored with reconverted x coord');
    colormap(hsv);

    
    subplot(2,3,5);
    plot_mesh_scalar(M,y_stand);
    shading interp;
    title('shape colored with reconverted y coord');
    colormap(hsv);
    
    subplot(2,3,6);
    plot_mesh_scalar(M,z_stand);
    shading interp;
    title('shape colored with reconverted z coord');
    colormap(hsv);    
    
    %As a result, we can see that the coloring functions (x,y,z coords) are
    %now mixed with the voronoi regions. This is caused by the change of
    %bases from-standard-to-voronoi and from-voronoi-to-standard.

end

