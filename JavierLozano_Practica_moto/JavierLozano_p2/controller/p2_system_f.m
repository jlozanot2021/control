function  xdot  = f(x,u)

% State: x = (x(1),x(2))
% Control: u

m1 = 200;
m2 = 50;
I1 = 25;
I2 = 5;
l1 = 1;
lc1 = 0.5;
g = 9.81;

x1=x(1)
x2=x(2)
x3=x(3)
x4=x(4)
u

xdot = [x3
    x4
   (g*l1*m2*sin(x1) - u + g*lc1*m1*sin(x1))/(m2*l1^2 + m1*lc1^2 + I1)
   (m2*u*l1^2 - I2*g*m2*sin(x1)*l1 + m1*u*lc1^2 - I2*g*m1*sin(x1)*lc1 + I1*u + I2*u)/(I2*(m2*l1^2 + m1*lc1^2 + I1))];

end