function f_prime = fourth_ord_centered_difference(f, t)
    n = length(f);
    f_prime = zeros(1, n);
    if length(t) >= 2
        h = t(2) - t(1);
        if n >= 5
            % Using forward difference to estimate the derivative of the
            % 1st 2 points
            f_prime(1) = (-25 * f(1) + 48 * f(2) - 36 * f(3) + 16 * f(4) -3 * f(5)) / (12*h);
            f_prime(2) = (-3 * f(1) - 10 * f(2) + 18 * f(3) - 6 * f(4) + f(5)) / (12*h);
            % Using backward difference to estimate the derivative of the
            % last 2 points
            f_prime(n - 1) = (-1 * f(n - 4) + 6 * f(n - 3) - 18 * f(n - 2) + 10 * f(n - 1) + 3 * f(n)) / (12*h);
            f_prime(n) = (3 * f(n - 4) - 16 * f(n - 3) + 36 * f(n - 2) - 48 * f(n - 1) + 25 * f(n)) / (12*h);
        end
        % Using centered difference to estimate the derivative of inner points
        for i = 3: n-2
            f_prime(i) = (f(i - 2) - 8 * f(i - 1) + 8 * f(i + 1) - f(i + 2)) / (12*h);
        end
    end
    disp(f_prime);
end