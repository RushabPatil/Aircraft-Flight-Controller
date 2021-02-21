clearvars; clc;
%%%
% Set constants
h = 0; %m
Tsl = 288.16; %K
rhosl = 1.225; %kg/m^3
a1 = -6.5E-3; %K/m
W = 266893; %N
Wempty = 143677; %N
MaxTh = 169000; %N
S = 42.74; %m^2
CD0 = 0.007;
K = 4/3 * (1/(pi()*0.85761*2.6813));
Ct = 2.4E-5; %kg/(N*s)
g = 9.8; %m/s^2
R = 287; %J/(kg*K)
%%%
% Calculate density at 2 km altitude
T = Tsl + a1*h;
rho = rhosl*(T/Tsl)^(-1-(g/a1/R));
%%%
% Set velocity range to test
V = [30:1:1500]; %m/s
%%%
% Calculate CL and CD at each velocity
CL = W ./ (0.5*rho*V.^2*S);
CD = CD0 + K*CL.^2;
LDRatio = CL./CD;

plot(V,LDRatio); grid on; xlabel("Velocity (m/s)"); ylabel("Lift/Drag Ratio"); title("Lift/Drag Ratio vs Velocity for F-35B at Sea Level")
MaxThV = zeros(length(V),1);
MaxThV(:) = MaxTh;
Th = W ./ LDRatio;
figure(2); plot(V,Th); grid on; ylabel("Thrust (N)"); xlabel("Velocity (m/s)"); title("Thrust vs Velocity for F-35B at Sea Level");
hold on;
plot(V,MaxThV,"--");
hold off;

Range = (V/Ct) .* LDRatio * log(W/Wempty);
MaxRange = max(Range);
figure(3); plot(V,Range); grid on; ylabel("Range (m)"); xlabel("Velocity (m/s)"); title("Range vs Velocity for F-35B at Sea Level");