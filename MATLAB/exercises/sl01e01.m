M = load_off('cat0.off');
figure;
subplot(1,3,1)
plot_mesh(M);

[e, v, t] = get_boundary_edges(M.TRIV);

M1 = []
M1.VERT = M.VERT
M1.TRIV = t

%compute area of each triangle
tri_areas = calc_tri_areas(M);

subplot(1,3,2)
t1 = plot_mesh(M, 'Facecolor', 'r', 'EdgeColor', 'b');

subplot(1,3,3)
t1 = plot_mesh(M)
set(t1, 'EdgeColor', 'default');
set(t1, 'FaceAlpha', 0.1);
set(t1, 'EdgeAlpha', 0.025);
set(t1, 'LineWidth', 0.1);
axis equal;
hold on;
t2 = plot_mesh(M1, 'Facecolor', 'r', 'EdgeColor', 'r');
set(t2, 'LineWidth', 2);
