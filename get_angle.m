function [best_angle, x_best, vx_best, y_best, vy_best] = get_angle(V0, target_x, target_y, tmax)
tspan = [0 tmax];
lowest_x_diff = 10000;
lowest_y_diff = 10000;
best_angle = 1;
x_best = 1;
vx_best = 1;
y_best = 1;
vy_best = 1;
for angle = 1:89
    beta0=angle*pi/180; 
    IC   = [0; V0*cos(beta0); 0; V0*sin(beta0)];   
    [t, oput] = ode45(@secondode, tspan, IC);   
    x=   oput(:,1); 
    vx=   oput(:,2); 
    y=   oput(:,3); 
    vy=   oput(:,4); 
    
    %[closest_x,idx]=min(abs(x-target_x));
    
    %disp(x);
    %disp(closest_x);
    %disp(target_x);
    [val,idx]=min(abs(x-target_x));
    closest_x=x(idx);
    
    if (abs(closest_x-target_x)) < (0.1*target_x) && (abs(y(idx)-target_y)) < (0.1*target_x)
        
        if abs(closest_x-target_x) < lowest_x_diff && abs(y(idx)-target_y)< lowest_y_diff
            lowest_x_diff = abs(closest_x-target_x);
            lowest_y_diff = abs(y(idx)-target_y);
            x_best = x;
            vx_best = vx;
            y_best = y;
            vy_best = vy;
            best_angle = beta0;
        end
    end
    
end

  

end