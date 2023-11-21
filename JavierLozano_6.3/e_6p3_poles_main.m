%Adapted from https://www.ensta-bretagne.fr/jaulin/

init;

% State: x = (x(1),x(2))

x = 2;
hatx = 0.05;
w = 6 
y = 6

dt=0.01;

frame_counter=0;

t=0;

for t=0:dt:10
    
    u = -8 -9*hatx + (1/3)*(w-6)
    x=x+e_6p3_system_f(x,u)*dt;
    y = 3*x;
    hatx=hatx+e_6p3_observer_f(hatx,w,y)*dt; 

    % Euler
    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
       e_6p3_draw(t,x,hatx,y); 
       frame_counter =0;
    end
end;
