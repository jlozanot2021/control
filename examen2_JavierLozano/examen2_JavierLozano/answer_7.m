
clear all;
syms x1(t) x2(t) x3 x4 r2 l1

J = [- r2*sin(x1(t) + x2(t)) - l1*sin(x1(t)), -r2*sin(x1(t) + x2(t));
    r2*cos(x1(t) + x2(t)) + l1*cos(x1(t)),  r2*cos(x1(t) + x2(t))]

Jdot = diff(J,t)

% Esto traducido queda 

Jdot_traducida = [- r2*cos(x1 + x2)*(x3 + x4) - l1*cos(x1)*x3, -r2*cos(x1 + x2)*(x3 + x4);
- r2*sin(x1 + x2)*(x3 + x4) - l1*sin(x1)*x3, -r2*sin(x1 + x2)*(x3 + x4)]