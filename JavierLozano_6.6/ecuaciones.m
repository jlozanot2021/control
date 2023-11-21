A = [0,         0, 1, 0;
 0,         0, 0, 1;
 0,   981/500, 0, 0;
 0, 2943/1000, 0, 0]

B = [0;
   0;
 1/5;
1/20]

pcon = [-2;-2.1;-2.2;-2.3]
pobs = [-2;-2.1;-2.2;-2.3]


%E es = a [1,0,0,0] ya que queremos controlar la posicion
E = [1,0,0,0]

%diseñar K
K = place(A,B,pcon)
square(k*0.5)