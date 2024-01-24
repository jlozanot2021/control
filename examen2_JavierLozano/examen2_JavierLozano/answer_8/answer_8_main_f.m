% 8)

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

x = [0.29870320832267510715190518314212; 1.6961241579629620161058886779968; 0; 0];
xA = [0.29870320832267510715190518314212; 1.6961241579629620161058886779968; 0; 0];
xB = [0.29870320832267510715190518314212; 2.4188584057763776272842660306382; 0; 0];

%Initial Guess
Kp = [10, 0;
    0, 10]
Kd = [10, 0;
    0, 10]


dt=0.01;

frame_counter=0;

t=0;

for t=0:dt:10
    x1 = x(1)
    x2 = x(2)
    x3 = x(3)
    x4 = x(4)
    gl = square(0.66*t);

    J = [- r2*sin(x1 + x2) - l1*sin(x1), -r2*sin(x1 + x2);
        r2*cos(x1 + x2) + l1*cos(x1),  r2*cos(x1 + x2)]
    
    p = [cos(x1)*l1 + cos(x1 + x2)*r2; sin(x1)*l1 + sin(x1 + x2)*r2];
    dothp = J*[x(3);x(4)]
    if gl == 1
        pd = [cos(xB(1))*l1 + cos(xB(1) + xB(2))*r2; sin(xB(1))*l1 + sin(xB(1) + xB(2))*r2];
    else
        pd = [cos(xA(1))*l1 + cos(xA(1) + xA(2))*r2; sin(xA(1))*l1 + sin(xA(1) + xA(2))*r2];
    end
    
    N = [(m1*d1 + m2*l1)*g*cos(x1);
    0]
    u = N + (J')*[Kp*(pd - p) - Kd*dothp];

    x=x+answer_8_system_f(x,u)*dt
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
        answer_8_problem_draw(x)
       frame_counter =0;
    end
end;