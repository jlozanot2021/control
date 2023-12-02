clear all;
init;

l1 = 1;
l2 = 1;
cx = 1;
cy = 1;
r = 0.5;

x = [0;pi/2];

dt=0.01;

frame_counter=0;

t=0;

for t=0:dt:10

    x1 = x(1);
    x2 = x(2);
    %w periodico
    invA = [cos(x1 + x2)/(l1*sin(x2)), sin(x1 + x2)/(l1*sin(x2));
    -(l2*cos(x1 + x2) + l1*cos(x1))/(l1*l2*sin(x2)), -(l2*sin(x1 + x2) + l1*sin(x1))/(l1*l2*sin(x2))]
    v = [cx ; cy] + r*[cos(t); sin(t)] - [l1*cos(x1) + l2*cos(x1 + x2);l1*sin(x1) + l2*sin(x1 + x2)] + r*[-sin(t);cos(t)]
    u = invA*v;
    x=x+crunk_system(x,u)*dt
    y1 = l1*cos(x1) + l2*cos(x1 + x2);
    y2 = l1*sin(x1) + l2*sin(x1 + x2);
    y = [y1;y2];

    % Euler
    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
        draw_circle(1,1,0.5)
        problem_draw(x)
        plot(cx + r * cos(t), cy + r * sin(t), 'x', 'MarkerSize', 2, 'LineWidth', 1, 'Color', 'r');
       %plot(t,x(1),'r--.',t,x(2),'k--.',t,y(1),'g--.',t,y(2),'c--.')
       frame_counter =0;
    end
end;