%Adapted from https://www.ensta-bretagne.fr/jaulin/

init;

% State: x = (x(1),x(2))

x = [0;0;0]
a_0 = 0.1;
a_1 = 2.1;
k1 = 7;
k2 = 6;
alpha = 1;
w = 1;

dt=0.01;

frame_counter=0;

t=0;

for t=0:dt:10
    
    x(2) = x(2) + 0.01
    u = alpha*x(3) + - k1*x(1) - k2*x(2)

    
    x=x+e_5p13_system_f(x,u)*dt; 
    % Euler
    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
       e_5p13_draw(t,x,u); 
       frame_counter =0;
    end
end;
