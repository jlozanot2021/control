%Adapted from https://www.ensta-bretagne.fr/jaulin/
clc;
clear all;
close all;
init;

% State: x = (x(1),x(2))

x=[-60/180*pi;120/180*pi;0;0]; % Initial state near to the equilibrium variable selected (x=2)
u = [0;0];

c=[1;1];
r=[0.5];
dt=0.01;

Iz1 = 1;
Iz2 = 1;
m1 = 1;
m2 = 2;
l1 = 1;
l2 = 1;
r1 = l1/2;
r2 = l2/2;

frame_counter=0;

x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);

%apartado 1
Kp = [50 0; 0 50];
Kd = [10 0; 0 10];

%apartado 2
%Kp = [10 0; 0 10];
%Kd = [5 0; 0 5];

J = [-l2*sin(x1+x2)-l1*sin(x1) -l2*sin(x1+x2);
    l2*cos(x1+x2)+l1*cos(x1)    l2*cos(x1+x2)];

for t=0:dt:10

    x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    x4 = x(4);

    p1= l1*cos(x1)+l2*cos(x1+x2);
    p2= l1*sin(x1)+l2*sin(x1+x2);

    p=[p1;p2]; % posición actual del end efector
    %posición deseada del endefector
    pd=c+r*[cos(t);
            sin(t)];
    dotpd=r*[-sin(t);
             cos(t)];
    ddotpd=r*[-cos(t);
              -sin(t)];

    J = [-l2*sin(x1+x2)-l1*sin(x1) -l2*sin(x1+x2);
         l2*cos(x1+x2)+l1*cos(x1)    l2*cos(x1+x2)];

    dotJ = [- l2*cos(x(1) + x(2))*(x(3) + x(4)) - l1*cos(x(1))*x(3), -l2*cos(x(1) + x(2))*(x(3) + x(4));
           - l2*sin(x(1) + x(2))*(x(3) + x(4)) - l1*sin(x(1))*x(3), -l2*sin(x(1) + x(2))*(x(3) + x(4))];

    invJ = [-cos(x1+x2)/(cos(x1+x2)*sin(x1)-sin(x1+x2)*cos(x1)) -sin(x1+x2)/(cos(x1+x2)*sin(x1)-sin(x1+x2)*cos(x1));
            (cos(x1)+l2*cos(x1+x2))/(l2*cos(x1+x2)*sin(x1)-l2*sin(x1+x2)*cos(x1))  (sin(x1)+l2*sin(x1+x2))/(l2*cos(x1+x2)*sin(x1)-l2*sin(x1+x2)*cos(x1))]

    alfa = Iz1 + Iz2 + m1* r1^2 + m2*(l1^2 + r2^2 );
    beta = m2*l1^r2;
    delta = Iz2 + m2*r2^2;

    B= [alfa+2*beta*cos(x2) delta+beta*cos(x2)
     delta+beta*cos(x2)    delta];
    C = [-beta*sin(x2)*x4 -beta*sin(x2)*(x3+x4)
        beta*sin(x2)*x3           0];
    
    % output feedback
    dotp=[x3;x4]; % derivada de la posición
    v=invJ*(ddotpd + Kd*(dotpd-J*dotp)+Kp*(pd-p)-dotJ*dotp);
    
    % apartado 1
    u=B*v+C*dotp;

    % apartado 2
    %g=9.81;
    %N=[(m1*r1+m2*l1)*g*cos(x1)+m2*r2*g*cos(x1+x2);
        %m2*r2*g*cos(x1+x2)];
    %u=B*v+C*dotp+N;

    x=x+e_5p8_system_f(x,u)*dt; % Euler
    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta

    frame_counter = frame_counter + 1;

    if frame_counter == 5
        problem_draw(x,pd); 
        frame_counter = 0;
    end
    pause(dt);
end;

