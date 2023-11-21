function  xdot  = f(x,u)

% State: x = (x(1),x(2))
% Control: u

x1=x(1);
x2=x(2);
z=x(3);

a_0 = 0.1;
a_1 = 2.1;
k1 = 7;
k2 = 6;
alpha = 1;
w = 1;

x_=[1, 1, 0;
    -(k1 + a_0), -(k2 - a_1), alpha;
    -1, 0, 0]
x = [x1;x2;z]

xdot = x_*x + [0;0;1]*w

end