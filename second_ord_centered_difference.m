function f_prime = second_ord_centered_difference(f, t)
    n = length(f);
    f_prime = zeros(1, n);
    if length(t) >= 2
        h = t(2) - t(1);
        if n >= 3
            % Using forward difference to estimate the derivative of the 1st point
            f_prime(1) = (-1 * f(3) + 4 * f(2) -3 * f(1)) / (2*h);
            % Using backward difference to estimate the derivative of the last point
            f_prime(n) = (3 * f(n) - 4 * f(n - 1) + f(n - 2)) / (2*h);
        end
        % Using centered difference to estimate the derivative of inner points
        for i = 2: n-1
            f_prime(i) = (f(i+1) - f(i-1)) / (2*h);
        end
    end
    disp(f_prime);
end