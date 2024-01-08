% 4)
% Compute the relation between the position of the end effector p and the 
% configuration variables q. Compute the values of the configuration variables that correspond 
% to p = pA and p = pB .

clear all;

syms q1 q2 q3 q4

I1 = 1;
I2 = 1;
m1 = 1;
m2 = 1;
l1 = 1;
l2 = 1;
r1 = l1/2;
d1 = l1/2;
d2 = l2/2;

% SACAR LOS VALORES DE X
pI = [1 ; 0.75];
eqn1 = q1 + r1 + l2*cos(q2) -  pI(1) == 0;
eqn2 = l2*sin(q2) - pI(2) == 0;
s = solve([eqn1, eqn2], [q1,q2]);
q1_inicial = vpa(s.q1)
q2_inicial = vpa(s.q2)

% Tienen sentido -0.161437 y 0.848062
% Ya que las otras dos no se puede

pF = [1.5 ; -0.75];
eqn1 = q1 + r1 + l2*cos(q2) -  pF(1) == 0;
eqn2 = l2*sin(q2) - pF(2) == 0;
s = solve([eqn1, eqn2], [q1,q2]);
q1_final = vpa(s.q1)
q2_final = vpa(s.q2)