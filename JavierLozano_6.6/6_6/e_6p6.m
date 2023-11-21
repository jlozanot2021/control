init;
%1)
l = 4;
mc = 5;
mr = 1;
g = 9.81;

syms u x2 x3 x4

eqn1 = x3 == 0;
eqn2 = x4 == 0;
eqn3 = (- l*mr*sin(x2)*x4^2 + u + g*mr*cos(x2)*sin(x2))/(- mr*cos(x2)^2 + mc + mr) == 0;
eqn4 = (- l*mr*cos(x2)*sin(x2)*x4^2 + u*cos(x2) + g*mc*sin(x2) + g*mr*sin(x2))/(l*(- mr*cos(x2)^2 + mc + mr)) == 0;
eqns = [eqn1 eqn2 eqn3 eqn4]
s = solve(eqns, [x2 x3 x4 u], 'ReturnConditions', true, 'Real', true);
 %como s (x1) no aparece en las ecuaciones de arriba, no hace falta
 %resolverlo y por tanto puede estar en cualquier posición de x
Su = s.u
 %x2 da eso porque son las dos posiciones de equlibrio posibles
Sx2 = s.x2
Sx3 = s.x3
Sx4 = s.x4

%2) ahora hacer deribadas parciales
clear;
syms u x2 x3 x4 l mr mc g x1

f1 = x3;
f2 = x4;
f3 = (- l*mr*sin(x2)*x4^2 + u + g*mr*cos(x2)*sin(x2))/(- mr*cos(x2)^2 + mc + mr);
f4 = (- l*mr*cos(x2)*sin(x2)*x4^2 + u*cos(x2) + g*mc*sin(x2) + g*mr*sin(x2))/(l*(- mr*cos(x2)^2 + mc + mr));

A = jacobian([f1, f2, f3, f4] , [x1, x2, x3, x4])
B = jacobian([f1, f2, f3, f4] , [u])
C = jacobian(x1 , [x1, x2, x3, x4])
D = jacobian(x1 , [u])
%hacer susbs a menos dos veces (sustituye lo que pone en primer [] por segundo []) 
A = subs(A,[x1 x2 x3 x4 u],[0 0 0 0 0])
B = subs(B,[x1 x2 x3 x4 u],[0 0 0 0 0])
%escoba tiene mas inercia que boli, se mantiene mas

%3)
clear;

syms u x1 x2 x3 x4

l = 4;
mc = 5;
mr = 1;
g = 9.81;


f1 = x3;
f2 = x4;
f3 = (- l*mr*sin(x2)*x4^2 + u + g*mr*cos(x2)*sin(x2))/(- mr*cos(x2)^2 + mc + mr);
f4 = (- l*mr*cos(x2)*sin(x2)*x4^2 + u*cos(x2) + g*mc*sin(x2) + g*mr*sin(x2))/(l*(- mr*cos(x2)^2 + mc + mr));

A = jacobian([f1, f2, f3, f4] , [x1, x2, x3, x4])
B = jacobian([f1, f2, f3, f4] , [u])
C = jacobian(x1 , [x1, x2, x3, x4])
D = jacobian(x1 , [u])


A = subs(A,[x1 x2 x3 x4 u],[0 0 0 0 0])
B = subs(B,[x1 x2 x3 x4 u],[0 0 0 0 0])
C = subs(C,[x1 x2 x3 x4 u],[0 0 0 0 0])

Co = ctrb(A,B) %calculo matriz controlabilidad 

rank(Co) %si es 4 es comprobable ya que x tiene 4 dimensiones

Ob = obsv(A,[1,0,0,0]) %calculo matriz observador 
rank(Ob) %si es 4 es observable ya que x tiene 4 dimensiones

%si cambias C a [0,1,0,0] no es observable, por tanto no se pude observar por
%el angulo

%polos asi ya qye matlab no deja
pcon = [-2;-2.1;-2.2;-2.3]
pobs = [-2;-2.1;-2.2;-2.3]

%E es = a [1,0,0,0] ya que queremos controlar la posicion
E = [1,0,0,0]

%diseñar K
%A y B no iban
A = [0,         0, 1, 0;
 0,         0, 0, 1;
 0,   (g*mr)/mc, 0, 0;
 0, (g*mc + g*mr)/(l*mc), 0, 0]

B = [0;
   0;
 1/mc;
1/(l*mc)]
K = place(A,B,pcon)

%diseñar L
C = [1,0,0,0]
L = (place(A',C',pobs))'

%diseñar H
H = -(E*(A-B*K)^(-1)*B)^(-1)

%todas variables con _ encima = 0

hatx = [1;0;0;0]
y=1
x = [0;0;0;0]

dt=0.01;

frame_counter=0;

t=0;

for t=0:dt:10
    %w periodico
    w = 1;
    u = -K*x+ H*w;
    x=x+e_6p6_system_f(x,u)*dt
    y = x(1);
    hatx=hatx+e_6p6_observer_f(hatx,w,y,A,B,K,L,C,H)*dt; 
    

    % Euler
    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
       plot(t,x(1),'k--.',t,x(2),'r--.',t,w,'b--.')
       frame_counter =0;
    end
end;
