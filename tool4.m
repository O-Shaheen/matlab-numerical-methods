function [finalV, Finalangle] = tool4(x0,v0, angle0, xn, h, diam, mass, useAirRes)
    p = 1.204;
    dynamicVis = 18.13*10.^(-6);
    finalV = x0:h:xn;
    Finalangle = x0:h:xn;
    Re = (p * v0 * diam)/dynamicVis;
    
    if(Re < 0.2)
        Cd = 24/Re;
    else 
        Cd = (21.12/Re)+(6.3/sqrt(Re))+0.25;
    end 
    
    Af = pi.* ((diam.^2)/4);
    
    vx0 = v0.*cosd(angle0);
    vy0 = v0.*sind(angle0);
    i = 1;
    if(useAirRes == 1)
        while x0<=xn
        vRes = sqrt((vx0.^2) + (vy0.^2));
        dvx = ((-0.5).*Cd.*Af.*p.*vx0.*vRes)/mass;
        dvz = (((-mass).*9.81) -(0.5.*Cd.*Af.*p.*vy0.*vRes))/mass;
        resV = sqrt((vx0.^2) + (vy0.^2));
        deg  = atand(vy0/vx0);
        finalV(i) = vRes;
        Finalangle(i) = deg;
        i = i+1;
       
        vx1=vx0+ h.*dvx;
        vx0=vx1;
        
        vy1 = vy0 + h.*(dvz);
        vy0 = vy1;
        
        x1=x0+h;
        x0=x1;
        end
    else 
        while x0<=xn
        resV = sqrt((vx0.^2) + (vy0.^2));
        deg  = atand(vy0/vx0);
        finalV(i) = resV;
        Finalangle(i) = deg;
        i = i+1;
        
        vx1=vx0+ h*0;
        vx0=vx1;
        
        vy1 = vy0 + (-9.81)*h;
        vy0 = vy1;
        
        x1=x0+h;
        x0=x1;
        end
    end
end