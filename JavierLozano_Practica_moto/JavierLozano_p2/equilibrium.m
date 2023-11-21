clear all;
syms u x1 x2 x3 x4 q1 q2 dotq1 dotq2 tau 

m1 = 200;
m2 = 50; 
I1 = 25;
I2 = 5;
l1 = 1;
lc1 = 0.5;
g = 9.81;

eqn1_q = (g*l1*m2*sin(q1) - tau + g*lc1*m1*sin(q1))/(m2*l1^2 + m1*lc1^2 + I1);
eqn2_q = (m2*tau*l1^2 - I2*g*m2*sin(q1)*l1 + m1*tau*lc1^2 - I2*g*m1*sin(q1)*lc1 + I1*tau + I2*tau)/(I2*(m2*l1^2 + m1*lc1^2 + I1));

eqn1_q = subs(eqn1_q,[q1 q2 dotq1 dotq2 tau],[x1 x2 x3 x4 u]);
eqn2_q = subs(eqn2_q,[q1 q2 dotq1 dotq2 tau],[x1 x2 x3 x4 u]);

eqn1 = x3 == 0;
eqn2 = x4 == 0;
eqn3 = eqn1_q == 0;
eqn4 = eqn2_q == 0;
eqns = [eqn1 eqn2 eqn3 eqn4];
s = solve(eqns, [x1 x2 x3 x4 u], 'ReturnConditions', true, 'Real', true);

Su = s.u
Sx1 = s.x1
Sx2 = s.x2
Sx3 = s.x3
Sx4 = s.x4