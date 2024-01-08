function  xdot  = f(x,u)

% State: x = (x(1),x(2))
% Control: udothq2

I1 = 1;
I2 = 1;
m1 = 1;
m2 = 1;
l1 = 1;
l2 = 1;
r1 = l1/2;
d1 = l1/2;
d2 = l2/2;
g = 9.81;

u1 = u(1);
u2 = u(2);
x1 = x(1);
x2 = x(2);
x3 = x(3)
x4 = x(4);


B = [m1 + m2, -m2*d2*sin(x2);
    -m2*d2*sin(x2), I2 + m2*d2^2];

B_inv = [ (m2*d2^2 + I2)/(- d2^2*m2^2*sin(x2)^2 + d2^2*m2^2 + m1*d2^2*m2 + I2*m2 + I2*m1), (d2*m2*sin(x2))/(- d2^2*m2^2*sin(x2)^2 + d2^2*m2^2 + m1*d2^2*m2 + I2*m2 + I2*m1);
(d2*m2*sin(x2))/(- d2^2*m2^2*sin(x2)^2 + d2^2*m2^2 + m1*d2^2*m2 + I2*m2 + I2*m1),       (m1 + m2)/(- d2^2*m2^2*sin(x2)^2 + d2^2*m2^2 + m1*d2^2*m2 + I2*m2 + I2*m1)]

C = [-m2*d2*cos(x2)*x4^2;
    0];

N = [0;
m2*g*d2*cos(x2)];

ddothq = -B_inv*C + B_inv*[u1;u2] -B_inv*N

xdot = [x3;
    x4;
    ddothq(1);
    ddothq(2)]

end
