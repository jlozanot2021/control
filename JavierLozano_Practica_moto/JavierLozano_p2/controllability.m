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

A = jacobian([f1, f2, f3, f4] , [x1, x2, x3, x4]);
B = jacobian([f1, f2, f3, f4] , [u]);

A = subs(A,[x1 x2 x3 x4 u],[0 0 0 0 0]);
B = subs(B,[x1 x2 x3 x4 u],[0 0 0 0 0]);

Co = ctrb(A,B); %calculo matriz controlabilidad 

if (rank(Co) == 4)  %si es 4 es controbable ya que x tiene 4 dimensiones
    disp("Es controlable")
else
    disp("No es controlable")
end

%Es controlable