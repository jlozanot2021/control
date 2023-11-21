% Adapted from https://www.ensta-bretagne.fr/jaulin/

function  xhatdot  = f(xhat,w,y)

% State: x = (x(1),x(2))
% Control: u

xhatdot = -10*xhat + (1/3)*(w - 6) + 3*(y - 6)
end