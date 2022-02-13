function [velocity_or_angle, resultant_velocity, x,y, all_angles, total_length] = tool5(target_x, target_y, initial_angle_or_velocity, d, m, unknown)

global C
rho=1.2041; 
Cd=0.5;
Af=pi*d^2/4; 
C=Cd*Af*rho/2/m; 


V0=initial_angle_or_velocity; 
beta0=initial_angle_or_velocity; 
tmax=5; 
h = 1;

if strcmp(unknown, 'angle')
    [velocity_or_angle, x, vx, y, vy] = get_angle(V0, target_x, target_y, tmax);
    disp(velocity_or_angle);
    [resultant_velocity, all_angles] = tool4(0,initial_angle_or_velocity, rad2deg(velocity_or_angle), x(end), h, d, m, 0);
    t = 0:h:x(end);
    [positionx, positiony] = tool3(t, resultant_velocity .* cosd(all_angles), resultant_velocity .* sind(all_angles));
    total_length = tool1 (positionx, positiony);

else
    [velocity_or_angle, x, vx, y, vy] = get_velocity (beta0, target_x, target_y, tmax);
    [resultant_velocity, all_angles] = tool4(0,velocity_or_angle, initial_angle_or_velocity, x(end), h, d, m, 0);
    t = 0:h:x(end);
    coss = cosd(all_angles);
    sinn = sind(all_angles);
    A = resultant_velocity;
    B = coss;
    D = sinn;
    vvx = bsxfun(@times, A(:, 1), B);
    vvy = bsxfun(@times, A(:, 1), D);
    
    [positionx, positiony] = tool3(t, vvx, vvy);
    total_length = tool1 (positionx, positiony);
    
    
    
    
    
    
   
end

tspan = linspace(0,tmax, length(resultant_velocity));
disp(length(x));
disp(length(tspan));

figure(1);
clf;
plot(x,y);




end

