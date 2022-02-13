 %{
2nd order forward difference:
    f'(x_i) = (-f(x_i+2) + 4f(x_i+1) - 3f(x_i)) / 2h
2nd order backward difference:
    f'(x_i) = (3f(x_i) - 4f(x_i-1) + f(x_i-2)) / 2h
2nd order centered difference:
    f'(x_i) = (f(x_i+1) - f(x_i-1)) / 2h

Reference of 4th order forward and backward difference equations -> https://doi.org/10.1016/j.cam.2004.12.026
4th order forward difference:
    f'(x_i) = (-25f(x_i) + 48f(x_i+1) - 36f(x_i+2) + 16f(x_i+3) - 3f(x_i+4))/ 12h
    f'(x_i) = (-3f(x_i-1) - 10f(x_i) + 18f(x_i+1) - 6f(x_i+2) + f(x_i+3))/ 12h
4th order backward difference:
    f'(x_i) = (-f(x_i-3) + 6f(x_i-2) - 18f(x_i-1) + 10f(x_i) + 3f(x_i+1))/ 12h
    f'(x_i) = (3f(x_i-4) - 16f(x_i-3) + 36f(x_i-2) - 48f(x_i-1) + 25f(x_i))/ 12h
4th order centered difference:
    f'(x_i) = (-f(x_i+2) + 8f(x_i+1) - 8f(x_i-1) + f(x_i-2)) / 12h
%}
%{
f(x) = x^4+x^3+x^2+x+313
f'(x) = 4x^3+3x^2+2x+1
%}
x = linspace(0, 20);
f =@(x) (x).^4 + (x).^3 + (x).^2 + x + 313;
tool2_validator(x, f);

function tool2_validator(x, f)
clc;
y = feval(f,x);
f_p =@(x) 4.*(x).^3 + 3.*(x).^2 + 2.*(x) + 1;
y_p = feval(f_p,x);
order = input("Please enter the order of the central difference formula (2 for 2nd order or 4 for 4th order):\n");
    while order ~= 2 && order ~= 4
        order = input("Only 2nd and 4th orders are implemented; please either enter 2 or 4:\n");
    end
    if order == 2
        second_ord_centered_difference(y, x, y_p);
    elseif order == 4
        fourth_ord_centered_difference(y, x, y_p);
    end
end

function f_prime = second_ord_centered_difference(f, t, y_p)
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
    disp ("Known         Calculated    Error");
    n = length(y_p);
    for i = 1:n
        fprintf("%d %d %d\n", y_p(i), f_prime(i), 100.*(y_p(i) - f_prime(i)) ./ y_p(i));
    end
end

function f_prime = fourth_ord_centered_difference(f, t, y_p)
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
    disp ("Known         Calculated    Error");
    n = length(y_p);
    for i = 1:n
        fprintf("%d %d %d\n", y_p(i), f_prime(i), 100.*(y_p(i) - f_prime(i)) ./ y_p(i));
    end
end
