% Adapted from https://www.ensta-bretagne.fr/jaulin/

% State x = (x(1),x(2))

function e_6p4_draw(x,u)
    clf();
    hold on;
    axis square;
    axis([-1,1,-1,1]);
    plot([0, sin(x(1))], [0, -cos(x(1))], 'red', 'LineWidth', 1)

  
end