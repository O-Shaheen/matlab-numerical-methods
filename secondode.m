function [ p ] = secondode(t, indata )
% simultaneous second order differentials for projectile
% motion with air resistance
% output vector z has the four differential outputs
% assumed units: metres, seconds, Newtons, kg, radians
g = 9.81;
global C
% these are defined globally so they can be changed
% outside the function - means this function doesn't need editing
% for different projectiles
p = zeros(4,1); % initialize space
p(1) = indata(2);
p(2) = -C*sqrt(indata(2)^2 + indata(4)^2)* indata(2);
p(3) = indata(4);
p(4) = -g -C*sqrt(indata(2)^2 + indata(4)^2)* indata(4);
end

