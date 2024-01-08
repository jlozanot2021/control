function problem_draw(x)

I1 = 1;
I2 = 1;
m1 = 1;
m2 = 1;
l1 = 1;
l2 = 1;
r1 = l1/2;
d1 = l1/2;
d2 = l2/2;


xelbow = x(1) + r1;
yelbow = 0;

xtip = xelbow + l2*cos(x(2));
ytip = yelbow + l2*sin(x(2));

hold on;

axis square

plot(x(1), 0,'x', 'MarkerSize', 1, 'Color', 'b')
plot([xelbow,xtip], [yelbow,ytip],'k','LineWidth',0.1)
 

 drawnow;


 


                     
