G1=1/10;G2=1/20;G3=1/10;G4=1/10;
us=40;is=1;
Gn=[G1+G2+G3 -G3;-(G3+2*G4) G3+G4];
In=[G1*us+is;-is];
Un=inv(Gn)*In;
Gn
