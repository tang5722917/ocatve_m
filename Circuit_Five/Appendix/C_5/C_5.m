    U=10;
    R1=4;
    R2=0.2;
    C=1;
    L=1;
yd=@(t,y) [-(1/(R1*C))*y(1)-(1/C)*y(2)+(1/(R1*C))*U; (1/L)*y(1)-(R2/L)*y(2)];


tspan=[0,40];
y0=[0;0];
[t,YY]=ode45(yd,tspan,y0);
plot(t,YY(:,1));
xlabel('t');
ylabel('uc');
