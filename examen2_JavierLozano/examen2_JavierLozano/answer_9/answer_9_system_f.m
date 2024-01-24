function  xdot  = f(x,u)

% State: x = (x(1),x(2))
% Control: udothq2

l1 = 1;
l2 = 1; 
m1 = 1;
m2 = 1;
I1 = 1;
I2 = 1;
d1 = l1/2;
r2 = l1/2;
f1 = 0.1;
f2 = 0.1;
g = 9.81;

u1 = u(1);
u2 = u(2);
x1 = x(1);
x2 = x(2);
x3 = x(3)
x4 = x(4);


B = [I1 + m1*d1^2 + I2 + m2*l1^2, I2;
    I2, I2];

B_inv = [ 1/(m1*d1^2 + m2*l1^2 + I1),                                 -1/(m1*d1^2 + m2*l1^2 + I1);
    -1/(m1*d1^2 + m2*l1^2 + I1), (m1*d1^2 + m2*l1^2 + I1 + I2)/(I2*(m1*d1^2 + m2*l1^2 + I1))]

C = [0;
    0]

F = [f1, 0;
    0, f2];

N = [(m1*d1 + m2*l1)*g*cos(x1);
    0]

ddothq = -B_inv*C + B_inv*[u1;u2] -B_inv*N - B_inv*F*[x3;x4];

xdot = [x3;
    x4;
    ddothq(1);
    ddothq(2)]

end