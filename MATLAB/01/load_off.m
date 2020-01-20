function shape = load_off(filename)

shape = [];

f = fopen(filename, 'rt');

n = '';
while isempty(n)
    fgetl(f); %read and discard the first line
    n = sscanf(fgetl(f), '%d %d %d'); %read second line, containing: number of vertices, number of triangles, don't care
end

nv = n(1);
nt = n(2);
data = fscanf(f, '%f'); %data is now a 1-dim vector

if length(data) == nv*3+nt*4
	%data(a:b:end) <- from a to end, do this for every b elements
    data(3*nv+1:4:end)=[]; %remove the "3" from the triangles lines: make [] (empty, remove it) that value
elseif length(data) ~= nv*3+nt*3
    fclose(f);
    error('load_off(): The mesh seems to be composed of non-triangular faces.');
end

%reshape data, from (a:b)  a to b, in the shape [3 nt]. [3 nt] means create 3 rows and nt columns. Then take the transpose.
shape.TRIV = reshape(data(end-3*nt+1:end), [3 nt])';
data = data(1:end-3*nt);
data = reshape(data, [length(data)/nv nv]);
shape.VERT = data';

fclose(f);

if min(min(shape.TRIV))==0 % min(min..)) the first one returns the minimum value of each column
    shape.TRIV = 1+shape.TRIV;
end

shape.n = size(shape.VERT,1);
shape.m = size(shape.TRIV,1);

end