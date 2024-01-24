
clear;
syms r2 l1 q1 q2

q1 = 0.29870320832267510715190518314212
q2 = 1.6961241579629620161058886779968
J = [- r2*sin(q1 + q2) - l1*sin(q1), -r2*sin(q1 + q2);
    r2*cos(q1 + q2) + l1*cos(q1),  r2*cos(q1 + q2)]

invJ = inv(J)