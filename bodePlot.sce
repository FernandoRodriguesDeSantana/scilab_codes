s = poly(0,'s')
h = syslin('c', (0.0045*s) / ((s+1)*(s+0.0045))) 
clf();
bode(h, 0.1 / (2*%pi), 300 / (2*%pi), "rad");
