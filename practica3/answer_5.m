% 5)
clear all;
syms q1 q2 r1 l2

p1 = q1 + r1 + l2*cos(q2)
p2 = l2*sin(q2)

J = jacobian([p1, p2], [q1, q2])