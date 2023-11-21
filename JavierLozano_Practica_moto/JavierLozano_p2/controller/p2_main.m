clear all;
init;

m1 = 200;
m2 = 50; 
I1 = 25;
I2 = 5;
l1 = 1;
lc1 = 0.5;
g = 9.81;

%polos asi ya qye matlab no deja
pcon = [-2;-2.2;-2.4;-2.6];
pobs = [-2;-2.2;-2.4;-2.6];

%E es = a [0,1,0,0] ya que queremos controlar la q2
E = [0,1,0,0];
A = [                                                    0, 0, 1, 0;
                                                         0, 0, 0, 1;
            (g*l1*m2 + g*lc1*m1)/(m2*l1^2 + m1*lc1^2 + I1), 0, 0, 0;
-(I2*g*l1*m2 + I2*g*lc1*m1)/(I2*(m2*l1^2 + m1*lc1^2 + I1)), 0, 0, 0]
B = [                                                       0;
                                                            0;
                                 -1/(m2*l1^2 + m1*lc1^2 + I1);
(m2*l1^2 + m1*lc1^2 + I1 + I2)/(I2*(m2*l1^2 + m1*lc1^2 + I1))]
C = [0, 1, 0, 0];
K = place(A,B,pcon)

%diseñar L
L = (place(A.',C.',pobs)).'

%diseñar H
H = -inv(E * inv(A - B*K) * B)


hatx = [0.26179;0;0;0]
y=0
x = [0.26179;0;0;0]

dt=0.01;

frame_counter=0;

t=0;

for t=0:dt:10
    %w periodico
    w = 0;
    u = -K*hatx + H*w;
    y = x(2);
    hatx=hatx+p2_observer_f(hatx,w,y,A,B,K,L,C,H)*dt; 
    x=x+p2_system_f(x,u)*dt

    % Euler
    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 5
       p2_draw(x)
       %plot(t,x(1),'r--.',t,x(2)/10,'k--.',t,x(3)*10,'g--.',t,x(4)/100,'c--.')
       frame_counter =0;
    end
end;