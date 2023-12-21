close all
close all
clc 

syms alpha betha delta q2 

A = [alpha + 2*betha*cos(q2), delta + betha*cos(q2);
    delta + betha*cos(q2), delta];

detA = simplify(det(A))
adjA = simplify(det(A)*inv(A))
invA = simplify(inv(A))

clear all;

syms l1 l2 q1 q2
p1 = (l1*cos(q1) +l2*cos(q1 + q2));
p2 = (l1*sin(q1) +l2*sin(q1 + q2));
J = jacobian([p1, p2], [q1, q2])
