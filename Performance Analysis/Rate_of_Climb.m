clc
clear
W=266893.3;%Inputs max
S=42.7;%Inputs
b=10.7;
T=169032.42;%Inputs max
rho=1.225;%Inputs
AR=b^2/S;
e=0.85761;
Cdo=0.007;%Inputs
k=0.1846;
WS=W/S;
TW=T/W;
LD=1/(sqrt(4*Cdo*k))
v=15:5:1000;

Cl=W./(0.5*rho*(v.^2)*S);
Cd=Cdo+k*Cl.^2;
Q=0.5*rho*v.^2;
RC=v.*(TW-((Q.*Cdo)/WS)-(WS*(k./Q)));


z=1+sqrt(1+(3/((LD^2)*(TW^2))));
RCmax=sqrt((WS*z)/(3*rho*Cdo))*(TW^(3/2))*(1-(z/6)-(3/(2*(TW^2)*(LD^2)*z)))
Vmax=sqrt((TW*WS*z)/(3*rho*Cdo))
gamma=asind(RCmax/Vmax);


xlabel ('velocity v(m/s)'); ylabel ( 'Rate of Climb(m/s)');
hold on
plot(v,RC)
plot(Vmax,RCmax,'d')
title('Rate of Climb Vs velocity');
hold off