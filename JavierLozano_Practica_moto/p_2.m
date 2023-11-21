clear all;
clear all;
init;
%2)
syms m1 m2 I1 I2 l1 lc1 g q1 q2 dotq1 dotq2 ddotq1 ddotq2 tau
eqn1 = (m1*lc1^2 + m2*l1^2 + I1 + I2)*ddotq1 + I2*ddotq2 - (m1*lc1 + m2*l1)*g*sin(q1);
eqn2 = I2*ddotq1 +I2*ddotq2 - tau;
% Resolver el sistema de ecuaciones
sol = solve([eqn1, eqn2], [ddotq1, ddotq2]);

% Mostrar los resultados
x1 = dotq1
x2 = dotq2
x3 = sol.ddotq1
x4 = sol.ddotq2

%%
%3)
clear;
syms u x1 x2 x3 x4 q1 q2 dotq1 dotq2 tau 

m1 = 200;
m2 = 50; 
I1 = 25;
I2 = 5;
l1 = 1;
lc1 = 0.5;
g = 9.81;

eqn1_q = (g*l1*m2*sin(q1) - tau + g*lc1*m1*sin(q1))/(m2*l1^2 + m1*lc1^2 + I1);
eqn2_q = (m2*tau*l1^2 - I2*g*m2*sin(q1)*l1 + m1*tau*lc1^2 - I2*g*m1*sin(q1)*lc1 + I1*tau + I2*tau)/(I2*(m2*l1^2 + m1*lc1^2 + I1));

eqn1_q = subs(eqn1_q,[q1 q2 dotq1 dotq2 tau],[x1 x2 x3 x4 u])
eqn2_q = subs(eqn2_q,[q1 q2 dotq1 dotq2 tau],[x1 x2 x3 x4 u])

eqn1 = x3 == 0;
eqn2 = x4 == 0;
eqn3 = eqn1_q == 0;
eqn4 = eqn2_q == 0;
eqns = [eqn1 eqn2 eqn3 eqn4]
s = solve(eqns, [x1 x2 x3 x4 u], 'ReturnConditions', true, 'Real', true);

Su = s.u
Sx1 = s.x1
Sx2 = s.x2
Sx3 = s.x3
Sx4 = s.x4

%% 
%4)
clear;
syms m1 m2 I1 I2 l1 lc1 g u x1 x2 x3 x4 tau

f1 = x3;
f2 = x4;
f3 = (g*l1*m2*sin(x1) - u + g*lc1*m1*sin(x1))/(m2*l1^2 + m1*lc1^2 + I1);
f4 = (m2*u*l1^2 - I2*g*m2*sin(x1)*l1 + m1*u*lc1^2 - I2*g*m1*sin(x1)*lc1 + I1*u + I2*u)/(I2*(m2*l1^2 + m1*lc1^2 + I1));

A = jacobian([f1, f2, f3, f4] , [x1, x2, x3, x4])
B = jacobian([f1, f2, f3, f4] , [u])
C = jacobian(x2 , [x1, x2, x3, x4])
D = jacobian(x2 , [u])
%hacer susbs a menos dos veces (sustituye lo que pone en primer [] por segundo []) 
A = subs(A,[x1 u],[0 0])
B = subs(B,[x1 u],[0 0])
%%
%5)
clear;

syms u x1 x2 x3 x4

m1 = 200;
m2 = 50;
I1 = 25;
I2 = 5;
l1 = 1;
lc1 = 0.5;
g = 9.81;


f1 = x3;
f2 = x4;
f3 = (g*l1*m2*sin(x1) - u + g*lc1*m1*sin(x1))/(m2*l1^2 + m1*lc1^2 + I1);
f4 = (m2*u*l1^2 - I2*g*m2*sin(x1)*l1 + m1*u*lc1^2 - I2*g*m1*sin(x1)*lc1 + I1*u + I2*u)/(I2*(m2*l1^2 + m1*lc1^2 + I1));

A = jacobian([f1, f2, f3, f4] , [x1, x2, x3, x4])
B = jacobian([f1, f2, f3, f4] , [u])
C = jacobian(x2 , [x1, x2, x3, x4])
D = jacobian(x2 , [u])


A = subs(A,[x1 x2 x3 x4 u],[0 0 0 0 0])
B = subs(B,[x1 x2 x3 x4 u],[0 0 0 0 0])
C = subs(C,[x1 x2 x3 x4 u],[0 0 0 0 0])

Co = ctrb(A,B) %calculo matriz controlabilidad 

rank(Co) %si es 4 es controbable ya que x tiene 4 dimensiones

%Es controlable
%%

%6)
Ob = obsv(A,[0,1,0,0]) %calculo matriz observador 
rank(Ob) %si es 4 es observable ya que x tiene 4 dimensiones
%%
%7)
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

%todas variables con _ encima = 0

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
    hatx=hatx+e_6p6_observer_f(hatx,w,y,A,B,K,L,C,H)*dt; 
    x=x+e_6p6_system_f(x,u)*dt

    % Euler
    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
        e_6p6_draw(t,x)
       frame_counter =0;
    end
end;
