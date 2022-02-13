function out = Trapezoidal (x, y, index1, index)
    sum = 0;
    n = index -index1;
    h = x(index) -x(index1);
    h = h/(2*n);
    for i = (index1+1): n
        sum = sum + y(i);
    end
    out = h * (y(index1)+ y(index)+ 2* sum);
end