clc;
t = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6];
vx = [1.4, 1.3, 1.14, 0.99, 0.84, 0.78, 0.76];
vz = [1.11, 0.91, 0.4, 0, -0.35, -0.65, -1.02];


[y1, y2] = tool3(t, vx, vz);


xa = 1:1:6;

%%%%%%% try it on class examples

plot(xa,y1, xa,y2);
xlabel("interval");
ylabel("distance");