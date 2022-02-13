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

t = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6];
x = [0, 2.1, 4.3, 6.1, 8.5, 11.0, 13.2];
z = [0, 1.5, 2.7, 3.8, 2.4, 0.8, -0.5];
tool2_solver(x, z, t);

function tool2_solver(x, z, t)
    clc;
    order = input("Please enter the order of the central difference formula (2 for 2nd order or 4 for 4th order):\n");
    while order ~= 2 && order ~= 4
        order = input("Only 2nd and 4th orders are implemented; please either enter 2 or 4:\n");
    end
    if order == 2
        disp("v_x:");
        v_x = second_ord_centered_difference(x, t);
        disp("v_z:");
        v_z = second_ord_centered_difference(z, t);
        resultant_v = sqrt(v_x.^2 + v_z.^2);
        disp("Resultant velocity:");
        disp(resultant_v);
        angle = atan(v_z ./ v_x);
        disp("Angle:");
        disp(angle);
    elseif order == 4
        disp("v_x:");
        v_x = fourth_ord_centered_difference(x, t);
        disp("v_z:");
        v_z = fourth_ord_centered_difference(z, t);
        resultant_v = sqrt(v_x.^2 + v_z.^2);
        disp("Resultant velocity:");
        disp(resultant_v);
        angle = atan(v_z ./ v_x);
        disp("Angle:");
        disp(angle);
    end
end
