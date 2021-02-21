clc
clear
W=266893.3;%Inputs max
S=42.7;%Inputs
b=10.7;
T=169032.42;%Inputs max
%Inputs
AR=b^2/S;
e=0.85761;
Cdo=0.007;%Inputs
k=1/(pi*e*AR);
WS=W/S;
LD=1/(sqrt(4*Cdo*k));
v=15:5:1000;


rho0=1.225;
Q0=0.5*rho0*v.^2;
TW=T/W;
z=1+sqrt(1+(3/((LD^2)*(TW^2))));
RC0=v.*(TW-((Q0.*Cdo)/WS)-(WS*(k./Q0)));
RCmax0=sqrt((WS*z)/(3*rho0.*Cdo))*(TW^(3/2))*(1-(z/6)-(3/(2*(TW^2)*(LD^2)*z)))
Vmax0=sqrt((TW*WS*z)/(3*rho0.*Cdo))
gamma0=asind(RCmax0/Vmax0);

rho5=0.7364;
T5=T*(rho5/rho0);
TW5=T5/W;
z5=1+sqrt(1+(3/((LD^2)*(TW5^2))));
Q5=0.5*rho5*v.^2;
RC5=v.*(TW5-((Q5.*Cdo)/WS)-(WS*(k./Q5)));
RCmax5=sqrt((WS*z5)/(3*rho5.*Cdo))*(TW5^(3/2))*(1-(z5/6)-(3/(2*(TW5^2)*(LD^2)*z5)))
Vmax5=sqrt((TW5*WS*z5)/(3*rho5.*Cdo))
gamma5=asind(RCmax5/Vmax5);



rho10=0.4135;
T10=T*(rho10/rho0);
TW10=T10/W;
z10=1+sqrt(1+(3/((LD^2)*(TW10^2))));
Q10=0.5*rho10*v.^2;
RC10=v.*(TW10-((Q10.*Cdo)/WS)-(WS*(k./Q10)));
RCmax10=sqrt((WS*z10)/(3*rho10.*Cdo))*(TW10^(3/2))*(1-(z10/6)-(3/(2*(TW10^2)*(LD^2)*z10)))
Vmax10=sqrt((TW10*WS*z10)/(3*rho10.*Cdo))
gamma10=asind(RCmax10/Vmax10);


rho15=0.1948;
T15=T*(rho15/rho0);
TW15=T15/W;
z15=1+sqrt(1+(3/((LD^2)*(TW15^2))));
Q15=0.5*rho15*v.^2;
RC15=v.*(TW15-((Q15.*Cdo)/WS)-(WS*(k./Q15)));
RCmax15=sqrt((WS*z15)/(3*rho15.*Cdo))*(TW15^(3/2))*(1-(z15/6)-(3/(2*(TW15^2)*(LD^2)*z15)))
Vmax15=sqrt((TW15*WS*z15)/(3*rho15.*Cdo))
gamma15=asind(RCmax15/Vmax15);

rho20=0.08891;
T20=T*(rho20/rho0);
TW20=T20/W;
z20=1+sqrt(1+(3/((LD^2)*(TW20^2))));
Q20=0.5*rho20*v.^2;
RC20=v.*(TW20-((Q20.*Cdo)/WS)-(WS*(k./Q20)));
RCmax20=sqrt((WS*z20)/(3*rho20.*Cdo))*(TW20^(3/2))*(1-(z20/6)-(3/(2*(TW20^2)*(LD^2)*z20)))
Vmax20=sqrt((TW20*WS*z20)/(3*rho20.*Cdo))
gamma20=asind(RCmax20/Vmax20);


figure(1)

xlabel ('velocity v(m/s)'); ylabel ( 'Rate of Climb(m/s)');
ax.XAxis.LineWidth=3;
hold on
plot(v,RC0,'color','red')
grid on
plot(v,RC5,'color','yellow')
plot(v,RC10,'color','black')
plot(v,RC15,'color','green')
plot(v,RC20,'color','magenta')
plot(Vmax0,RCmax0,'d')
plot(Vmax5,RCmax5,'d')
plot(Vmax10,RCmax10,'d')
plot(Vmax15,RCmax15,'d')
plot(Vmax20,RCmax20,'d')
legend('Sea Level','5 km','10 km','15 km','20 km','Location','south');
title('Rate of Climb Vs velocity at various Altitudes');

hold off

