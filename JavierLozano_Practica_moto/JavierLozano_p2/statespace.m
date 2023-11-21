clear all;
syms m1 m2 I1 I2 l1 lc1 g q1 q2 dotq1 dotq2 ddotq1 ddotq2 tau

eqn1 = (m1*lc1^2 + m2*l1^2 + I1 + I2)*ddotq1 + I2*ddotq2 - (m1*lc1 + m2*l1)*g*sin(q1);
eqn2 = I2*ddotq1 +I2*ddotq2 - tau;
% Resolver el sistema de ecuaciones
sol = solve([eqn1, eqn2], [ddotq1, ddotq2]);

% Mostrar los resultados
x1 = dotq1
x2 = dotq2
x3 = sol.ddotq1
x4 = sol.ddotq2