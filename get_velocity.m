function [best_velocity, x_best, vx_best, y_best, vy_best] = get_velocity (beta0, target_x, target_y, tmax)
tspan = [0 tmax];
lowest_x_diff = 10000;
lowest_y_diff = 10000;
prev_y_diff = 10000;
V0 = 1;
getting_closer = 1;
beta0 = beta0*pi/180;
reached = 0;
    while getting_closer
    IC   = [0; V0*cos(beta0); 0; V0*sin(beta0)];   
    [t, oput] = ode45(@secondode, tspan, IC);   % Runge-Kutta to solve
    x=   oput(:,1); 
    
    vx=   oput(:,2); 
    
    y=   oput(:,3); 
    
    vy=   oput(:,4); 
    
    
    %[closest_x,idx]=min(abs(x-target_x));
    [val,idx]=min(abs(x-target_x));
    closest_x=x(idx);
    
    if x(end) > target_x && prev_y_diff <= round(abs(y(idx)-target_y),2)
        getting_closer = 0;
        if ~reached
            x_best = x;
            vx_best = vx;
            y_best = y;
            vy_best = vy;
            disp('There is no velocity that can hit this target');
            disp('Smallest difference in y is:')
            disp(round(abs(y(idx)-target_y),2));
            disp('Closest velocity to come near this target is:');
            best_velocity = V0;
        end
    else
        
        getting_closer = 1;
    end
    
    prev_y_diff = abs(y(idx)-target_y);
    
    if (abs(closest_x-target_x)) < (0.1*target_x) && (abs(y(idx)-target_y)) < (0.1*target_y)
        
        if abs(closest_x-target_x) < lowest_x_diff && abs(y(idx)-target_y)< lowest_y_diff
            lowest_x_diff = abs(closest_x-target_x);
            lowest_y_diff = abs(y(idx)-target_y);
            x_best = x;
            vx_best = vx;
            y_best = y;
            vy_best = vy;
            reached = 1;
            best_velocity = V0;
        end
    end
    
    
    V0 = V0+1;
    end
    
    disp(best_velocity);

end