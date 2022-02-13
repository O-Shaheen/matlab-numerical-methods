
function A = tool1(x,y)
Z=quad_splines(x,y);


coef=Gauss_jordan(Z);
n=length(coef)/3;
j=1;
for i=1:1:n
    coeff(i,1)=coef(j);
    coeff(i,2)=coef(j+1);
    coeff(i,3)=coef(j+2);
    j=j+3;
end

A=int_integration(coeff,x);

end






