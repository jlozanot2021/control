%Adapted from https://www.ensta-bretagne.fr/jaulin/

init;

% State: x = (x(1),x(2))

x=0.25; % Initial state
xhat=0.75;

dt=0.01;

frame_counter=0;

t=0;

for t=0:dt:10
    
    w = 5
    
    y = 4*x

    K = 2
    L = 1
    H = 1/2

    u = -K*xhat + H*w

    
    x=x+e_5p8_system_f(x,u)*dt; 
    xhat=xhat+e_5p8_observer_f(xhat,w,y)*dt; 
    % Euler
    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
       e_5p7_draw(t,x,xhat); 
       frame_counter =0;
    end
end;


