%Adapted from https://www.ensta-bretagne.fr/jaulin/

init;

% State: x = (x(1),x(2))

x = [0;0;0]
a_0 = 2;
a_1 = 2;
alpha0 = 1;
alpha1 = 1;
alpham1 = 1;
w = 1;

dt=0.01;

frame_counter=0;

t=0;

for t=0:dt:10
    
    u = alpham1*x(3) + alpha0*w - alpha0*x(1) - alpha1*x(2)

    
    x=x+e_5p11_system_f(x,u)*dt; 
    % Euler
    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
       e_5p7_draw(t,x,u); 
       frame_counter =0;
    end
end;
