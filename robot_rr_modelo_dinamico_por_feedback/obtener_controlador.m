% 1) obtener ecuacioens de estado del sitema
syms x1 x2 u1 u2 l1 l2
dotx1 = u1;
dotx2 = u2;
y1 = l1*cos(x1) + l2*cos(x1+x2);
y2 = l1*sin(x1) + l2*sin(x1+x2);

doty1 = -l1*u1*sin(x1) - l2*(u1 + u2)*sin(x1+x2);
doty2 = -l1*u1*cos(x1) - l2*(u1 + u2)*cos(x1+x2);

doty = [-l1*sin(x1)-l2*sin(x1+x2) -l2*sin(x1+x2);
        -l1*cos(x1)+l2*cos(x1+x2) l2*cos(x1+x2)]

% 2) calcular las coordenadas parametricas de la trayectoria a seguir por
% el robot en este caso es una circunferencia
% w = c + r( cos(t) )
%          ( sin(t) )   

% 3) obtener inv de A de forma simbolica para que en la simulacion matlab no la este
% calculando continuamente
close all
clc
syms l1 l2 x1 x2
A = [-l1 * sin(x1) - l2* sin(x1 +x2), - l2 *sin(x1 + x2);
l1 *cos(x1) + l2 *cos(x1 +x2), l2 *cos(x1 + x2)];
detA = simplify(det(A))
adjA = simplify(det(A)*inv(A))
invA = simplify(inv(A))

singularities = solve(detA == 0,'Real', true,'ReturnConditions', true)
% puntos de singularidad = 0 o pi*k es decir, o el brazo recogido o
% totalmente estirado