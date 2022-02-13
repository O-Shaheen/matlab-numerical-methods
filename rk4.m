function y_pred = rk4(x0, xf, y0, h, deriv_func)


n_iter = ((xf-x0)/h)+1;
y_pred = zeros(1, n_iter);

y_pred(1) = y0;
i = 1;
while i <= n_iter
    k1 = deriv_func(x0, y0);
    k2 = deriv_func(x0 + 0.5*h, y0 + 0.5*k1*h);
    k3 = deriv_func(x0 + 0.5*h, y0 + 0.5*k2*h);
    k4 = deriv_func(x0 + h, y0 + k3*h);
    
    x0 = x0 + h;
    
    y0 = y0 + (1/6)*(k1+2*k2+2*k3+k4)*h;
    
    if i ~= n_iter
        y_pred(i+1) = y0;
    end
    i = i+1;
    
end


end