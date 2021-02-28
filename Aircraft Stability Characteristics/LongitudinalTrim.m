%% F-35 - Longitudinal Trim Analysis
%% Rushab Patil

%%Assumptions
% Airfoil -> NACA 66-206

%% F-35 Specifications
W_takeoff = 266893.3;           %Maximum Weight
T_sl = 169032.42;       %Maximum thrust available at sea level
C_D_0 = 0.0065;         %Zero Lift Drag - from presentation
C_L_max = 0.65;         %Maximum Lift coefficient - from presentation
rho_sl = 1.225;         %Density at sea level
e = 0.6;                %Oswald Efficiency Factor - from presentation
S = 42.7;               %Wing's Area
b = 10.7;               %Wingspan
S_t = 42.7;             %Tail Area
g = 9.8;                %accelearation due to gravitation
i_t = 0;                %Incident angle
epsilon_0 = 0; 
k_epsilon_alpha = 0;
h_ac = 0.25;
h_cm = 0;
l_t = 3.6576;           %Distance betweeen the aerodynamic centers of the wing and the tail
c_bar = 4.78;           %Mean Chord Length
C_L_0_w = 0;            %Zero-angle lift
C_M_0_w = 0;            %Zero-angle pitching moment
C_L_alpha_t = 0;        %Coefficient of change in tail's lift w.r.t alpha
C_L_alpha_w = 0;        %Coefficient of change in wing's lift w.r.t alpha
C_L_delta_epsilon_t = 0;        %Tail Effectiveness

%% Preliminary Equations

AR = b^2/S;                        %Wing's Aspect Ratio
K = (4/3)*(1/(pi*e*AR));           %Induced Drag
V_H = (S_t/S)*(l_t/c_bar);         %horizontal tail mass volume
L_to_D_max = 1/sqrt(4*C_D_0*K);    %max. lift-to-drag ratio
T_to_W = T_sl/W_takeoff;           %Thrust to Weight ratio
W_to_S = W_takeoff/S;              %Wing loading ratio

%Stability Derivatives
C_L_0 = C_L_0_w + (S_t / S) * (i_t - epsilon_0);
C_M_0 = C_M_0_w + C_L_0 * (h_cm - h_ac) - V_H * C_L_alpha_t * (i_t - epsilon_0);
C_L_alpha = C_L_alpha_w + (S_t / S) * C_L_alpha_t * (1 - k_epsilon_alpha);
C_M_alpha = C_L_alpha * (h_cm - h_ac) - V_H * C_L_alpha_t * (1 - k_epsilon_alpha);

%Control Derivatives
C_L_delta_epsilon = (S_t / S) * C_L_delta_epsilon_t;
C_M_delta_epsilon = C_L_delta_epsilon * (h_cm - h_ac) - C_L_delta_epsilon_t * V_H;

%% Main Calculations

final_result = [0; 0; 0]; %[velocity; alpha_trim; delta_trim]

for height = 0:500:25000
    
    for velocity = 10:1:200 %For loop for finding trim conditions at different velocities
        
        %calaculating air-density at a specific height
        rho = density_calculator(height);
        
        %calculating dynamic pressure value
        Q = (1/2)*rho*velocity^2;
        
        %Setting up the matrices
        A = [C_L_alpha C_L_delta_epsilon;
            C_M_alpha C_M_delta_epsilon];
        C = [(W_takeoff / Q) - C_L_0; -C_M_0];
        
        %B = [alpha_trim; delta_epsilon_trim]
        B = A \ C;
        
        output = [velocity; B];
        
        final_result = horzcat(final_result, output);
    end
    
end
