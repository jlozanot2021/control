% Adapted from https://www.ensta-bretagne.fr/jaulin/

function  xdot  = f(x,u)

% State: x = (x(1),x(2))
% Control: u 
x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);

Iz1 = 1;
Iz2 = 1;
m1 = 1;
m2 = 2;
l1 = 1;
l2 = 1;
r1 = l1/2;
r2 = l2/2;

alfa = Iz1 + Iz2 + m1* r1^2 + m2*(l1^2 + r2^2 );
beta = m2*l1^r2;
delta = Iz2 + m2*r2^2;

B_inv = [-delta/(beta^2*cos(x2)^2-alfa*delta+delta^2)                 (delta+beta*cos(x2))/(beta^2*cos(x2)^2-alfa*delta+delta^2);
        (delta+beta*cos(x2))/(beta^2*cos(x2)^2-alfa*delta+delta^2)    -(alfa+2*beta*cos(x2))/(beta^2*cos(x2)^2-alfa*delta+delta^2)];
C = [-beta*sin(x2)*x4 -beta*sin(x2)*(x3+x4)
    beta*sin(x2)*x3           0];

%apartado1
xdot=[x3; x4; -B_inv*C*[x3;x4] + B_inv*u];
%apartado2
%g=9.81;
%N=[(m1*r1+m2*l1)*g*cos(x1)+m2*r2*g*cos(x1+x2);
    %m2*r2*g*cos(x1+x2)];
%xdot=[x3; x4; -B_inv*C*[x3;x4]+B_inv*u-B_inv*N];
end

