function  xdot  = f(x,u)

% State: x = (x(1),x(2))
% Control: u

x1=x(1);
x2=x(2);
z=x(3);

a_0 = 2;
a_1 = 2;
alpha0 = 1;
alpha1 = 1;
alpham1 = 1;
w = 1;

x_=[0, 1, 0;
    -(alpha0 + a_0), -(alpha1 + a_1), alpham1;
    -1, 0, 0]
x = [x1;x2;z]

xdot = x_*x + [0;alpha0;1]*w

end