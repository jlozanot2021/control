function  xdot  = f(x,u)

% State: x = (x(1),x(2))
% Control: u

u1 = u(1)
u2 = u(2)

xdot = [u1;
    u2];

end