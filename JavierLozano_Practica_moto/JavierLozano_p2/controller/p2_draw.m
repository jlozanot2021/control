% Adapted from https://www.ensta-bretagne.fr/jaulin/

% State x = (x(1),x(2))


function e_6p6_draw(x)
    clf();
    hold on
    axis square

    axis([-2 2 -2 2]);
    plot([0, -sin(x(1))],[0, cos(x(1))], 'red', "LineWidth", 1);
    plot([-sin(x(1)), -sin(x(1)) - 0.5*sin(x(2))], [cos(x(1)), cos(x(1)) + 0.5*cos(x(2))], 'blue', "LineWidth",1);

    
end