clear all;
syms m1 m2 I1 I2 l1 lc1 g u x1 x2 x3 x4 tau

f1 = x3;
f2 = x4;
f3 = (g*l1*m2*sin(x1) - u + g*lc1*m1*sin(x1))/(m2*l1^2 + m1*lc1^2 + I1);
f4 = (m2*u*l1^2 - I2*g*m2*sin(x1)*l1 + m1*u*lc1^2 - I2*g*m1*sin(x1)*lc1 + I1*u + I2*u)/(I2*(m2*l1^2 + m1*lc1^2 + I1));

A = jacobian([f1, f2, f3, f4] , [x1, x2, x3, x4]);
B = jacobian([f1, f2, f3, f4] , [u]);
C = jacobian(x2 , [x1, x2, x3, x4]);
D = jacobian(x2 , [u]);

%linealizacion x1 = 0, u = 0
A = subs(A,[x1 u],[0 0])
B = subs(B,[x1 u],[0 0])