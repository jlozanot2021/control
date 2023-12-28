syms l2 x1 x2

J = [-l2*sin(x1+x2)-l1*sin(x1) -l2*sin(x1+x2);
    l2*cos(x1+x2)+l1*cos(x1)    l2*cos(x1+x2)]
invJ = inv(J)