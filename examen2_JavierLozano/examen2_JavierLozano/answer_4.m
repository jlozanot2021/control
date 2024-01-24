
clear all;
syms q1 q2 q3 q4

l1 = 1;
l2 = 1; 
m1 = 1;
m2 = 1;
I1 = 1;
I2 = 1;
d1 = l1/2;
r2 = l1/2;
f1 = 0.1;
f2 = 0.1;
g = 9.81;

PI = [0.75;0.75];
eqn1 = cos(q1)*l1 + cos(q1+q2)*r2 - PI(1) == 0;
eqn2 = sin(q1)*l1 + sin(q1+q2)*r2 - PI(2) == 0;
s = solve([eqn1, eqn2], [q1,q2]);
q1_inicial = vpa(s.q1)
q2_inicial = vpa(s.q2)

PF = [0.5;0.5];
eqn1 = cos(q1)*l1 + cos(q1+q2)*r2 - PF(1) == 0;
eqn2 = sin(q1)*l1 + sin(q1+q2)*r2 - PF(2) == 0;
s = solve([eqn1, eqn2], [q1,q2]);
q1_final = vpa(s.q1)
q2_final = vpa(s.q2)
