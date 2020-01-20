shape = load_off('code/cat0.off');
F = shape.TRIV;
V = shape.VERT;
% trisurf(F,V(:,1),V(:,2),V(:,3),'FaceColor',[0.26,0.33,1.0 ]);
s = trisurf(F, V(:,1),V(:,2),V(:, 3));
axis equal;