%Let matrix X ∈ Rn×3 contain the 3D coordinates of points xi as its rows.
%Consider the following expression:

% n SUM_i^n ⟨xi,xi⟩ - SUM_ij ⟨xi,xj⟩

%How do you write the expression above in matrix notation?
%Tip: Use the trace operation, defined as tr(X) = SUM_i^n xii

X = [1 1 1 ; 2 2 2; 3 3 3 ; 4 4 4; 5 5 5]

% this is for X ∈ Rn×1
res = trace(X*X') - sum(sum(X*X'))


% do it for X ∈ Rn×3
% X = [0.1000    0.2000    0.3000; 1.1000    1.2000    1.3000;
    %2.1000    2.2000    2.3000; 3.1000    3.2000    3.3000]
