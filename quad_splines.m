function Z=quad_splines(x,y)  
    N = length(x)-1;
    w = 3*N+1;
    V = [0;zeros(2*N,1);zeros(N-1,1)];
    Z = zeros(length(V),length(V)+1);
    j=1;
    f=1;
for i=2:2:2*N    
    Z(i,f:f+2) = [x(j)^2 x(j) 1];
    Z(i,w) = y(j);
    j = j+1;
    Z(i+1,f:f+2) = [x(j)^2 x(j) 1]; 
    Z(i+1,w) = y(j);
    f = f+3;
end
j=1;
l=2;
for i=2*N+2:3*N
    Z(i,j:j+1) = [2*x(l) 1 ];
    Z(i,j+3:j+4) = [-2*x(l) -1];
    j = j+3;
    l = l+1;
end
Z(1,1)=1;
Z(1,w)= 0;
% scatter(x,y,50,'r','filled')
% grid on;
% xlim([min(x)-2 max(x)+2]);
% ylim([min(y)-2 max(y)+2]);
% xlabel('x');
% ylabel('y');
% title('Quadratic Spline')
end