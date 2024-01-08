% 6)
clear all;
syms l2
q2 = 0.84806207898148100805294433899842
J = [1, -l2*sin(q2);
0,  l2*cos(q2)];

invJ = inv(J)
