% 2)
clear all;
syms q1 q2 dothq1 dothq2 u1 u2 l1 l2 m1 m2 I1 I2 d1 r2 g f1 f2

B = [I1 + m1*d1^2 + I2 + m2*l1^2, I2;
    I2, I2];

B_inv = simplify(inv(B))

C = [0;
    0]

F = [f1, 0;
    0, f2];

N = [(m1*d1 + m2*l1)*g*cos(q1);
    0]

ddothq = -B_inv*C + B_inv*[u1;u2] -B_inv*N - B_inv*F*[dothq1;dothq2];

x1 = dothq1
x2 = dothq2
x3 = ddothq(1)
x4 = ddothq(2)