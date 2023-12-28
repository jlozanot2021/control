% 3)
% Compute the relation between the configuration variables q and the position of the
% end effector p = (p1, p2)T
clear all;

syms q1 q2 r1 l2

x = q1 + r1 + l2*cos(q2)
y = l2*sin(q2)
