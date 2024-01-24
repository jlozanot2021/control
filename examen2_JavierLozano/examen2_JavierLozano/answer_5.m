clear all;

syms q1 q2 l1 r2
p1 = cos(q1)*l1 + cos(q1+q2)*r2
p2 = sin(q1)*l1 + sin(q1+q2)*r2
J = jacobian([p1,p2],[q1,q2])