%Adapted from https://www.ensta-bretagne.fr/jaulin/

init;

% State: x = (x(1),x(2))

x=[pi-15/180*pi;-5/180*pi]

dt=0.01;

frame_counter=0;

t=0;

for t=0:dt:10
    
    u = (-2*x(1)+2*pi-x(2))
    x=x+e_6p4_system_f(x,u)*dt;


    % Euler
    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
       e_6p4_draw(x,u); 
       frame_counter =0;
    end
end;
