% 7)
clear;
syms l2 x2(t) x4

J = [1, -l2*sin(x2(t));
    0,  l2*cos(x2(t))];

Jdot = diff(J,t)

%------------------------------------------

% Traducimos el resultado 
clear;
syms l2 x2 x4

Jdot = [0, -l2*cos(x2)*x4;
    0, -l2*sin(x2)*x4]