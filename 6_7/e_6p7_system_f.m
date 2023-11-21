function  xdot  = f(x,u)

% State: x = (x(1),x(2))
% Control: u

l = 4;
mc = 5;
mr = 1;
g = 9.81;

x1=x(1)
x2=x(2)
x3=x(3)
x4=x(4)

xdot = [x3
    x4
    (- l*mr*sin(x2)*x4^2 + u + g*mr*cos(x2)*sin(x2))/(- mr*cos(x2)^2 + mc + mr)
    (- l*mr*cos(x2)*sin(x2)*x4^2 + u*cos(x2) + g*mc*sin(x2) + g*mr*sin(x2))/(l*(- mr*cos(x2)^2 + mc + mr))];

end