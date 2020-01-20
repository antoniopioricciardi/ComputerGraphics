% initialize a n x 3 matrix

% ";" when don't want the computation result to be printed
% the computation is an assign in this case,
%but would be printed with no ";"
n = 5;

mat = zeros(n, 3);

%{
output:
mat =

     0     0     0
     0     0     0
     0     0     0
%}

% create a matrix
mat1 = [1,2,3; 4,5,6; 7,8,9; 10,11,12]

mat1(2,3) % access row 2 column 3
mat1(2:3, 2:3) % access a range of elements
mat1(1:2:end) % get one element every two, starting from pos 1 to the end