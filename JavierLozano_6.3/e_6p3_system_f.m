function  xdot  = f(x,u)

% State: x = (x(1),x(2))
% Control: u

x1=x(1);

xdot = [2*x1^2 + u]

end