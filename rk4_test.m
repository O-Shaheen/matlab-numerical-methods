x0 = 0;
xf = 4; 
y0 = 2;
h = 1;
 
y_pred = rk4(x0, xf, y0, h, @deriv_func);

disp(y_pred);

function f = dvx(vx, v)
    
    f = 4*exp(0.8*x)-0.5*y;
end