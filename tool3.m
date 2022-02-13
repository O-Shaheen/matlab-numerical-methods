function [y1, y2] = tool3(t, vx, vz)

L = length(t);
xdistTrapezoidal = zeros(L-1);
xdistSimpson = zeros(L-1);
zdistTrapezoidal = zeros(L-1);
zdistSimpson = zeros(L-1);

for j = 2: L
    xdistTrapezoidal(j-1) = Trapezoidal (t, vx, 1, j);
    zdistTrapezoidal(j-1) = Trapezoidal (t, vz, 1, j);
    if rem(j,2)==1 
        xdistSimpson(j-1) = Simpson (t, vx, 1, j);
        zdistSimpson(j-1) = Simpson (t, vz, 1, j);
    end
end
for s = 1: (L-1)
    if xdistSimpson(s)==0
        xdistSimpson(s) = xdistTrapezoidal(s);
    end
    if zdistSimpson(s) == 0
        zdistSimpson(s) = zdistTrapezoidal(s);
    end

end

y1 = xdistTrapezoidal(:, 1);
y2 = zdistSimpson(:, 1);
end
