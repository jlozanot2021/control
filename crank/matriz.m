close all
close all
clc 

syms l1 l2 x1 x2

A = [-l1 * sin(x1) - l2 * sin(x1 + x2), -l2 * sin(x1 +x2);
    l1 * cos(x1) + l2 * cos(x1 + x2), l2 * cos(x1 +x2)];

detA = simplify(det(A))
adjA = simplify(det(A)*inv(A))
invA = simplify(inv(A))