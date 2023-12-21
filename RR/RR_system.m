function  xdot  = f(x,u)

% State: x = (x(1),x(2))
% Control: u

Iz1 = 1;
Iz2 = 1;
m1 = 1;
m2 = 1;
l1 = 1;
l2 = 1;
r1 = l1/2;
r2 = l2/2;

u1 = u(1)
u2 = u(2)
x1 = x(1)
x2 = x(2)
x3 = x(3)
x4 = x(4)


alpha = Iz1 + Iz2 + m1*r1^2 + m2*(l1^2 + r2^2);
betha = m2*l1*r2;
delta = Iz2 + m2*r2^2;

B_inv = [                 -delta/(betha^2*cos(x2)^2 - alpha*delta + delta^2),    (delta + betha*cos(x2))/(betha^2*cos(x2)^2 - alpha*delta + delta^2);
(delta + betha*cos(x2))/(betha^2*cos(x2)^2 - alpha*delta + delta^2), -(alpha + 2*betha*cos(x2))/(betha^2*cos(x2)^2 - alpha*delta + delta^2)]
C = [-betha*sin(x2)*x4 , - betha*sin(x2)*(x3 + x4);
    betha*sin(x2)*x3, 0];

f = -B_inv * C * [x3;x4] + B_inv * [u1;u2];

xdot = [x3;
    x4;
    f(1);
    f(2)]

end