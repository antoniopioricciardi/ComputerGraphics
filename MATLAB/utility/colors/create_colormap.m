function [new_col] = create_colormap(color_matrix, colormap_size)
%CREATE_COLORMAP create a custom colormap with colors described in
%color_matrix
%   color_matrix: RGB values in [0,1] for each color (e.g [[1,1,1],[1,0,0]]
%   if we want 2 colors
    % colormap_size: the size of the colormap

%   n_steps: how fast the color gradient must change
    n_steps = round(colormap_size/size(color_matrix,1));
    num_colors = size(color_matrix,1);
    new_col = zeros(n_steps*(num_colors-1), 3);
    
    for col_channel=1:3 % for each color channel
        for i=1:num_colors-1
            
            %we need to do a transition from color i to next one
            col_1 = color_matrix(i,:);
            col_2 = color_matrix(i+1,:);
            
            % perform color transition on that color channel
            color = linspace(col_1(col_channel),col_2(col_channel), n_steps);
            new_col((i-1)*n_steps+1:(i)*n_steps,col_channel) = color;
        end
    end
    
end

