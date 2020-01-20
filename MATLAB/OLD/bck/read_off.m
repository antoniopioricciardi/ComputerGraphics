function shape = read_off(file_path)
% OFF FILE:
% 1st line: number of vertices, number of faces, number of edges

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
shape = [];
f = fopen(file_path, 'rt')

n = '';
while isempty(n)
    fgetl(f); % fgetl reads the first line of a file
    n = sscanf(fgetl(f), '%d %d %d');
end

vn = n(1);
tn = n(2);

shape.VERT = zeros(vn, 3);
shape.TRIV = zeros(tn, 3);

% read all the rows containing vertices coord
for c = 1:vn
    n = sscanf(fgetl(f), '%f %f %f');
    if length(n) ~= 3   % less then three vertices read
        fclose(f);
        error('load_off(): The mesh seems to be composed of non-triangular faces.');
    end
    tmplst = [n(1), n(2), n(3)];
    shape.VERT(c, :) = tmplst; % in the row number c of the matrix, insert tmplst
end

for c = 1 : tn
    n = sscanf(fgetl(f), '%f %f %f');
    if length(n) ~= 4
        fclose(f);
        error('load_off(): The mesh seems to be composed of non-triangular faces.'); 
    end
    tmplst = [n(2), n(3), n(4)];
    shape.TRIV(c, :) = tmplst; % in the row number c of the matrix, insert tmplst
end

fclose(f);

% if there are some 0 in the triangles indices, increase all the indices by
% 1. That's because in MATLAB indices start at 1.
if min(min(shape.TRIV))==0
    shape.TRIV = 1+shape.TRIV;
end

shape.n = size(shape.VERT,1);
shape.m = size(shape.TRIV,1);

end 