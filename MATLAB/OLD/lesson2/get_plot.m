function figure = get_plot(file_path)
    shape = read_off(file_path);

    F = shape.TRIV;
    V = shape.VERT;
    % trisurf(F,V(:,1),V(:,2),V(:,3),'FaceColor',[0.26,0.33,1.0 ]);
    figure = trisurf(F, V(:,1),V(:,2),V(:, 3));
    axis equal;
end

