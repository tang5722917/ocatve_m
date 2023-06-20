[x, fval,info] = fsolve(@f,[1:2])

function y=f(x)
    y=zeros(2,1);
    y(1)=(5+5*i-5*i)*x(1)+5*i*x(2)-10;
    y(2)=5*i*x(1)+(5+5*i-5*i)*x(2);
endfunction

