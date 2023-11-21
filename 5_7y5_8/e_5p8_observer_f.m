% Adapted from https://www.ensta-bretagne.fr/jaulin/

function  xhatdot  = f(xhat,w,y)

% State: x = (x(1),x(2))
% Control: u

K = 2
L = 1
H = 1/2
xhatdot = (3-2*K-L*4)*xhat + (2*H)*w + L*y
end

