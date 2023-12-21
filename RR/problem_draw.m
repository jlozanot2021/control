function problem_draw(x)

l1=1;
l2=1;

r = 0.5;

xelbow = l1*cos(x(1));
yelbow = l1*sin(x(1));

xtip = xelbow + l2*cos(x(1) + x(2));
ytip = yelbow + l2*sin(x(1) + x(2));

axis([-1 2 -1 2])

hold on;

axis square

plot([0,xelbow], [0,yelbow],'k','LineWidth',0.1)
plot([xelbow,xtip], [yelbow,ytip],'k','LineWidth',0.1)
 

 drawnow;


 


                     
