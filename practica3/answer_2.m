% 2)
clear all;
syms q1 q2 dothq1 dothq2 u1 u2 l1 l2 m1 m2 I1 I2 d1 r1 d2 g

B = [m1 + m2, -m2*d2*sin(q2);
    -m2*d2*sin(q2), I2 + m2*d2^2];

B_inv = simplify(inv(B));

C = [-m2*d2*cos(q2)*dothq2^2;
    0];

N = [0;
m2*g*d2*cos(q2)];

ddothq = -B_inv*C + B_inv*[u1;u2] -B_inv*N;

x1 = dothq1
x2 = dothq2
x3 = ddothq(1)
x4 = ddothq(2)