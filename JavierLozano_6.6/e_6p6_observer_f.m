% Adapted from https://www.ensta-bretagne.fr/jaulin/

function  xhatdot  = f(xhat,w,y,A,B,K,L,C,H)

% State: x = (x(1),x(2))
% Control: u

xhatdot = (A-B*K-L*C)*xhat + B*H*(w) + L*(y);
end