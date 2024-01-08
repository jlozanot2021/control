 Jinv = [1,      (3*7^(1/2))/7;
    0, (4*7^(1/2))/(7*1)]
dq = vpa(Jinv*[0.0316;-0.094])

%%
% 9)

clear all;
init;

I1 = 1;
I2 = 1;
m1 = 1;
m2 = 1;
l1 = 1;
l2 = 1;
r1 = l1/2;
d1 = l1/2;
d2 = l2/2;
g = 9.81;

x = [-0.16143782776614764762540393840982; 0.84806207898148100805294433899842; -0.074985981388602078074493663218039; -0.14211464185146943650650541712821];
xA = [-0.16143782776614764762540393840982; 0.84806207898148100805294433899842; -0.074985981388602078074493663218039; -0.14211464185146943650650541712821];
xB = [0.33856217223385235237459606159018; -0.8480620789814810080529443389984; -0.074985981388602078074493663218039; -0.14211464185146943650650541712821];

%Initial Guess
Kp = [50, 0;
    0, 50]
Kd = [20, 0;
    0, 20]


dt=0.01;

frame_counter=0;

t=0;

for t=0:dt:3.23
    x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    x4 = x(4);

    J = [1, -l2*sin(x2);
        0,  l2*cos(x2)];
    
    Jdot = [0, -l2*cos(x2)*x4;
        0, -l2*sin(x2)*x4];
    
    Jinv = [1, sin(x2)/cos(x2);
        0,  1/(l2*cos(x2))];
    
    p = [x1 + r1 + l2*cos(x2); l2*sin(x2)]
    pd = p + 0.1 * [cos(-1.24904577239825); sin(-1.24904577239825)] * t;
    dotpd = 0.1 * [cos(-1.24904577239825); sin(-1.24904577239825)];
    ddotpd = 0;

    B = [m1 + m2, -m2*d2*sin(x2);
        -m2*d2*sin(x2), I2 + m2*d2^2];

    C = [-m2*d2*cos(x2)*x4^2;
        0];

    N = [0;
        m2*g*d2*cos(x2)];
    
    v = Jinv * (ddotpd + Kd * (dotpd - J * [x3;x4]) + Kp * (pd - p) - Jdot * [x3;x4]);
    u = B * v + C + N;

    x=x+answer_9_system_f(x,u)*dt;
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 5
        %draw_circle(1,1,0.5)
        problem_draw(x)
        %plot( + r * cos(t), cy + r * sin(t), 'x', 'MarkerSize', 2, 'LineWidth', 1, 'Color', 'r');
       %plot(t,x(1),'r--.',t,x(2),'k--.',t,y(1),'g--.',t,y(2),'c--.')
       frame_counter =0;
    end
end;