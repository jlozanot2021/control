clear all;

syms x1 x2 x3 x4

Iz1 = 1;
Iz2 = 1;
m1 = 1;
m2 = 1;
l1 = 1;
l2 = 1;
r1 = l1/2;
r2 = l2/2;

% SACAR LOS VALORES DE X
pI = [1;0];
pF = [1;1];
eqn1 = l1*cos(x1) + l2*cos(x1 + x2) - 1 == 0;
eqn2 = l1*sin(x1) + l2*sin(x1 + x2) - 0 == 0;
s = solve([eqn1, eqn2], [x1,x2]);
q1_inicial = s.x1
q2_inicial = s.x2
eqn1 = l1*cos(x1) + l2*cos(x1 + x2) - 1 == 0;
eqn2 = l1*sin(x1) + l2*sin(x1 + x2) - 1 == 0;
s = solve([eqn1, eqn2], [x1,x2]);
q1_final = s.x1
q2_final = s.x2

alpha = Iz1 + Iz2 + m1*r1^2 + m2*(l1^2 + r2^2);
betha = m2*l1*r2;
delta = Iz2 + m2*r2^2;

B_inv = [                 -delta/(betha^2*cos(x2)^2 - alpha*delta + delta^2),    (delta + betha*cos(x2))/(betha^2*cos(x2)^2 - alpha*delta + delta^2);
(delta + betha*cos(x2))/(betha^2*cos(x2)^2 - alpha*delta + delta^2), -(alpha + 2*betha*cos(x2))/(betha^2*cos(x2)^2 - alpha*delta + delta^2)]
C = [-betha*sin(x2)*x4 , - betha*sin(x2)*(x2 + x4);
    betha*sin(x2)*x3, 0];
%% Ejercicio 1
clear all;
init;

% ECUACUIONES

Iz1 = 1;
Iz2 = 1;
m1 = 1;
m2 = 1;
l1 = 1;
l2 = 1;
r1 = l1/2;
r2 = l2/2;

x = [-pi/3; (2*pi)/3; 0; 0];
xd = [0; pi/2; 0; 0];

%Initial Guess
Kp = [20, 0;
    0, 40]
Kd = [10, 0;
    0, 20]



dt=0.01;

frame_counter=0;

t=0;

for t=0:dt:10
    x1 = x(1)
    x2 = x(2)
    J = [- l2*sin(x1 + x2) - l1*sin(x1), -l2*sin(x1 + x2);
        l2*cos(x1 + x2) + l1*cos(x1),  l2*cos(x1 + x2)]
    p = [l1*cos(x1) + l2*cos(x1 + x2); l1*sin(x1) + l2*sin(x1 + x2)];
    pd =  [l1*cos(xd(1)) + l2*cos(xd(1) + xd(2)); l1*sin(xd(1)) + l2*sin(xd(1) + xd(2))];
    % Primera formula
    % u = (J')*Kp*(pd - p)- Kd*[x(3);x(4)]
    % Segundo formula
    u = (J')*Kp*(pd - p)- (J')*Kd*J*[x(3);x(4)]
    x=x+RR_system(x,u)*dt
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
        %draw_circle(1,1,0.5)
        problem_draw(x)
        %plot( + r * cos(t), cy + r * sin(t), 'x', 'MarkerSize', 2, 'LineWidth', 1, 'Color', 'r');
       %plot(t,x(1),'r--.',t,x(2),'k--.',t,y(1),'g--.',t,y(2),'c--.')
       frame_counter =0;
    end
end;
%% Ejercicio 2
clear all;

syms x1 x2 x3 x4

% SACAR LOS VALORES DE X

Iz1 = 1;
Iz2 = 1;
m1 = 1;
m2 = 1;
l1 = 1;
l2 = 1;
r1 = l1/2;
r2 = l2/2;

% 1)
pI = [1;0];
pFA = [0.5;1];
pFB = [0;0.5];
eqn1 = l1*cos(x1) + l2*cos(x1 + x2) - 1 == 0;
eqn2 = l1*sin(x1) + l2*sin(x1 + x2) - 0 == 0;
s = solve([eqn1, eqn2], [x1,x2]);
q1_inicial = s.x1
q2_inicial = s.x2
eqn1 = l1*cos(x1) + l2*cos(x1 + x2) - pFA(1) == 0;
eqn2 = l1*sin(x1) + l2*sin(x1 + x2) - pFA(2) == 0;
s = solve([eqn1, eqn2], [x1,x2]);
q1_final_A = s.x1
q2_final_A = s.x2
eqn1 = l1*cos(x1) + l2*cos(x1 + x2) - pFB(1) == 0;
eqn2 = l1*sin(x1) + l2*sin(x1 + x2) - pFB(2) == 0;
s = solve([eqn1, eqn2], [x1,x2]);
q1_final_B = s.x1
q2_final_B = s.x2
%%
clear all;
init;

% ECUACIONES 

Iz1 = 1;
Iz2 = 1;
m1 = 1;
m2 = 1;
l1 = 1;
l2 = 1;
r1 = l1/2;
r2 = l2/2;

x = [-pi/3; (2*pi)/3; 0; 0];
xdA = [-2*atan(55^(1/2)/9 - 8/9); 2*atan(55^(1/2)/5); 0; 0];
xdB = [-2*atan(15^(1/2) - 4); 2*atan(15^(1/2)); 0; 0]; 

%Initial Guess
Kp = [20, 0;
    0, 40]
Kd = [10, 0;
    0, 20]



dt=0.01;

frame_counter=0;

t=0;

for t=0:dt:10
    x1 = x(1)
    x2 = x(2)
    % no me va square gl = square(0.66*t);
    gl = sin(2 * pi * 0.66 * t) >= 0;
    J = [- l2*sin(x1 + x2) - l1*sin(x1), -l2*sin(x1 + x2);
        l2*cos(x1 + x2) + l1*cos(x1),  l2*cos(x1 + x2)]
    p = [l1*cos(x1) + l2*cos(x1 + x2); l1*sin(x1) + l2*sin(x1 + x2)];
    if gl == 1
        pd = [l1*cos(xdA(1)) + l2*cos(xdA(1) + xdA(2)); l1*sin(xdA(1)) + l2*sin(xdA(1) + xdA(2))];
    else
        pd = [l1*cos(xdB(1)) + l2*cos(xdB(1) + xdB(2)); l1*sin(xdB(1)) + l2*sin(xdB(1) + xdB(2))];
    end
    % Primera formula
    u = (J')*Kp*(pd - p)- Kd*[x(3);x(4)]
    % Segundo formula
    %u = (J')*Kp*(pd - p)- (J')*Kd*J*[x(3);x(4)]
    x=x+RR_system(x,u)*dt
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
        %draw_circle(1,1,0.5)
        problem_draw(x)
        %plot( + r * cos(t), cy + r * sin(t), 'x', 'MarkerSize', 2, 'LineWidth', 1, 'Color', 'r');
       %plot(t,x(1),'r--.',t,x(2),'k--.',t,y(1),'g--.',t,y(2),'c--.')
       frame_counter =0;
    end
end;