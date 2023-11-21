clear all;

syms u x1 x2 x3 x4

m1 = 200;
m2 = 50;
I1 = 25;
I2 = 5;
l1 = 1;
lc1 = 0.5;
g = 9.81;


f1 = x3;
f2 = x4;
f3 = (g*l1*m2*sin(x1) - u + g*lc1*m1*sin(x1))/(m2*l1^2 + m1*lc1^2 + I1);
f4 = (m2*u*l1^2 - I2*g*m2*sin(x1)*l1 + m1*u*lc1^2 - I2*g*m1*sin(x1)*lc1 + I1*u + I2*u)/(I2*(m2*l1^2 + m1*lc1^2 + I1));


% y = x1???
A = jacobian([f1, f2, f3, f4] , [x1, x2, x3, x4]);
C = jacobian(x1 , [x1, x2, x3, x4]);

A = subs(A,[x1 x2 x3 x4 u],[0 0 0 0 0]);
C = subs(C,[x1 x2 x3 x4 u],[0 0 0 0 0]);

Ob = obsv(A,C); %calculo matriz observador 

if (rank(Ob) == 4)  %si es 4 y = x1
    disp("y = x1")
end

% y = x2???
C = jacobian(x2 , [x1, x2, x3, x4]);
C = subs(C,[x1 x2 x3 x4 u],[0 0 0 0 0]);

Ob = obsv(A,C); %calculo matriz observador 

if (rank(Ob) == 4)  %si es 4 y = x2
    disp("y = x2")
end