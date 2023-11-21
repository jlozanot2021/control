%Adapted from https://www.ensta-bretagne.fr/jaulin/

init;

% State: x = (x(1),x(2))

x=[0;0]; % Initial state

dt=0.01;

frame_counter=0;

t=0;

e_5p7_draw(t,x); 

for t=0:dt:5
    
    x1= x(1);
    x2= x(2);

    w = 1
    
    u = -

    
    x=x+e_5p8_system_f(x,u)*dt; 
    xhat=xhat+e_5p8_observer_f(x,u,w)*dt; 
    % Euler
    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
       e_5p7_draw(t,x); 
       frame_counter =0;
    end
end;


