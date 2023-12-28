% x1 = x1, x2 = x2.
l1 = 1;
l2 = 1;
p1 = 1;
p2 = 0;
syms x1 x2
% de las ecuaciones de p1 y p2 sacamos x1 y x2
eqn1 = l1*cos(x1) + l2*cos(x1+x2) - p1;
eqn2 = l1*sin(x1) + l2*sin(x1+x2) - p2;


sol_pos_init = solve(eqn1==0, eqn2==0, [x1 x2]);

sol_pos_init.x1
sol_pos_init.x2

p1 = 1;
p2 = 1;
% de las ecuaciones de p1 y p2 sacamos x1 y x2
eqn1 = l1*cos(x1) + l2*cos(x1+x2) - p1;
eqn2 = l1*sin(x1) + l2*sin(x1+x2) - p2;

sol_pos_end = solve(eqn1==0, eqn2==0, [x1 x2]);

sol_pos_end.x1
sol_pos_end.x2

syms alfa beta x2 delta dotq2

% sabemos que 


B = [alfa+2*beta*cos(x2) delta+beta*cos(x2)
     delta+beta*cos(x2)    delta];

C = [-beta*sin(x2)*dotq2 -beta*sin(x2)*(dotq1+dotq2)
    beta*sin(x2)*dotq1           0];


B_inv = B^(-1)

%alfa = Iz1 + Iz2 + m1* r1^2 + m2*(l1^2 + r2^2 )
%beta = m2*l1^r2
%delta = I12 + m2*r2^2