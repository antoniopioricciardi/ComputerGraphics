function color = bluewhitered(colormap_size)
%BLUEWHITERED colormap
    r = [1,0,0];
    w = [1,1,1];
    b = [0,0,1];
    color = create_colormap([b;w;r],colormap_size);
end

