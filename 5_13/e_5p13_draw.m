% Adapted from https://www.ensta-bretagne.fr/jaulin/

% State x = (x(1),x(2))

function e_5p7_draw(t,x,u)

  plot(t,x(1),'k--.',t,x(2),'r--.',t,x(3),'b--.',t,u,'g--.')
  
end