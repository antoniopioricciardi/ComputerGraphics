M = ('tr_reg000.off')
N = ('tr_reg001.off')

% t \in [0, 1]
% x*(1-t) + t*y % for t in [0,1] we can go from x (when t is 0) to y (when t is 1).

figure
for t=0:0.05:1
    
    P = {};
    P.TRIV = M.TRIV;
    P.VERT = (1-t)*M.VERT + t*N.VERT;
    
    P.VERT = P.VERT*rotate_y(15)
    plot_mesh(P);
    axis off
    view([0 90])
    drawnow
    
    shading interp
    light; camlight head; lighting phong
end


