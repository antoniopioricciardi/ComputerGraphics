M = load_off('tr_reg000.off')

% compute a distance from a point to all the others

% pick_points(M) % let's you visualize points on a mesh
pt = 4344;
k = 1;

figue
for p=2:2:8
    subplot(1,4,k)
    d = (sum((M.VERT(pt, :) - M.VERT).^p,2).^(1/p);
    plot_scalar_map(M, d)
    axis off; view([0 90])
    light; lighting phong; camlight head;
    k = k+1
    colormap(lines)
    
    % with shading flat this would look really bad
    % use shading interp
end