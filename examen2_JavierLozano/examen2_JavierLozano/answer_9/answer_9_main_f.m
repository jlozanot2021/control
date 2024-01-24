% Jinv de qA1 y qA2 
Jinv = [-0.4147,    0.9186;
   -1.5119,   -1.5119]
dq = vpa(Jinv*[-0.03535;-0.03535])

%%
% 9)

clear all;
init;

l1 = 1;
l2 = 1; 
m1 = 1;
m2 = 1;
I1 = 1;
I2 = 1;
d1 = l1/2;
r2 = l1/2;
f1 = 0.1;
f2 = 0.1;
g = 9.81;

x = [0.29870320832267510715190518314212; 1.6961241579629620161058886779968; -0.017812864999999997173141252915229; 0.10689133000000000661700028103951];
xA = [0.29870320832267510715190518314212; 1.6961241579629620161058886779968; -0.017812864999999997173141252915229; 0.10689133000000000661700028103951];
xB = [0.29870320832267510715190518314212; 2.4188584057763776272842660306382; -0.017812864999999997173141252915229; 0.10689133000000000661700028103951];

%Initial Guess
Kp = [1, 0;
    0, 1]
Kd = [200, 0;
    0, 200]


dt=0.01;

frame_counter=0;

t=0;

for t=0:dt:7
    x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    x4 = x(4);

    J = [- r2*sin(x1 + x2) - l1*sin(x1), -r2*sin(x1 + x2);
    r2*cos(x1 + x2) + l1*cos(x1),  r2*cos(x1 + x2)]
    
    Jdot = [- r2*cos(x1 + x2)*(x3 + x4) - l1*cos(x1)*x3, -r2*cos(x1 + x2)*(x3 + x4);
- r2*sin(x1 + x2)*(x3 + x4) - l1*sin(x1)*x3, -r2*sin(x1 + x2)*(x3 + x4)];
    
    Jinv = [                       -cos(x1 + x2)/(l1*cos(x1 + x2)*sin(x1) - l1*sin(x1 + x2)*cos(x1)), -sin(x1 + x2)/(l1*cos(x1 + x2)*sin(x1) - l1*sin(x1 + x2)*cos(x1));
(r2*cos(x1 + x2) + l1*cos(x1))/(l1*r2*cos(x1 + x2)*sin(x1) - l1*r2*sin(x1 + x2)*cos(x1)), (r2*sin(x1 + x2) + l1*sin(x1))/(l1*r2*cos(x1 + x2)*sin(x1) - l1*r2*sin(x1 + x2)*cos(x1))]
    
    p = [cos(x1)*l1 + cos(x1 + x2)*r2; sin(x1)*l1 + sin(x1 + x2)*r2];
    pd = p + 0.05 * [cos(-3*pi/4); sin(-3*pi/4)] * t;
    dotpd = 0.05 * [cos(-3*pi/4); sin(-3*pi/4)];
    ddotpd = 0;

    B = [I1 + m1*d1^2 + I2 + m2*l1^2, I2;
    I2, I2];

    B_inv = [ 1/(m1*d1^2 + m2*l1^2 + I1),                                 -1/(m1*d1^2 + m2*l1^2 + I1);
        -1/(m1*d1^2 + m2*l1^2 + I1), (m1*d1^2 + m2*l1^2 + I1 + I2)/(I2*(m1*d1^2 + m2*l1^2 + I1))]
    
    C = [0;
        0]
    
    F = [f1, 0;
        0, f2];
    
    N = [(m1*d1 + m2*l1)*g*cos(x1);
        0]
    
    v = Jinv * (ddotpd + Kd * (dotpd - J * [x3;x4]) + Kp * (pd - p) - Jdot * [x3;x4]);
    u = B * v + C + N + F;

    x=x+answer_9_system_f(x,u)*dt;
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 5
        %draw_circle(1,1,0.5)
        answer_9_problem_draw(x)
        %plot( + r * cos(t), cy + r * sin(t), 'x', 'MarkerSize', 2, 'LineWidth', 1, 'Color', 'r');
       %plot(t,x(1),'r--.',t,x(2),'k--.',t,y(1),'g--.',t,y(2),'c--.')
       frame_counter =0;
    end
end;