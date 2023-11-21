function  xdot  = f(x,u)

% State: x = (x(1),x(2))
% Control: u

x1=x(1);
x2=x(2);

xdot = [x2; u-sin(x1)-x2]

end