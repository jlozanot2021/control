function answer_9_problem_draw(x)

l1 = 1;
l2 = 1; 
m1 = 1;
m2 = 1;
I1 = 1;
I2 = 1;
d1 = l1/2;
r2 = l1/2;
f1 = 0.1;
f2 = 0.1;
g = 9.81;

xelbow = cos(x(1))*l1;
yelbow = sin(x(1))*l1;

xtip = xelbow + r2*cos(x(1) + x(2));
ytip = yelbow + r2*sin(x(1) + x(2));

hold on;

axis square

plot([0,xelbow], [0,yelbow],'k','LineWidth',0.1)
plot([xelbow,xtip], [yelbow,ytip],'k','LineWidth',0.1)
 

 drawnow;