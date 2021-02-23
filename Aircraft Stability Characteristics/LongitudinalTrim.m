%% F-35 - Longitudinal Trim Analysis
%% Rushab Patil

%%F-35 Specifications
%% Constants
W = 266893.3; %Maximum Weight
T_max = 169032.42; %Maximum thrust available
C_D_0 = 0.007; %Zero Lift Drag - from presentation
C_L_max = 0.65; %Maximum Lift coefficient - from presentation
rho_sl = 1.225; %Density at sea level
e = 0.85761; %Oswald Efficiency Factor - from presentation
S = 42.7; %Wing's Area
b = 10.7; %Wingspan
S_t =   ; %Tail Area
g = 9.8; %accelearation due to gravitation
altitude = 3; %can be changed based on requirements
rho = 0.909;  %Density at a given height -> use function from desnity calculator
i_t =   ; % Incident angle
epsilon_0 = ; %
k_epsilon_alpha =


%% Preliminary Equations

%Dynamic Pressure
Q = (1/2)*rho*velocity^2;

%Volume ratio
V_H =

%Stability Derivatives
C_L_0 = C_L_0_w + (S_t / S) * (i_t - epsilon_0);
C_M_0 = C_M_0_w + C_L_0 * (h_cm - h_ac) - V_H * C_L_alpha_t * (i_t - epsilon_0);
C_L_alpha = C_L_alpha_w + (S_t / S) * C_L_alpha_t * (1 - k_epsilon_alpha);
C_M_alpha = C_L_alpha * (h_cm - h_ac) - V_H * C_L_alpha_t * (1 - k_epsilon_alpha);
C_L_delta_epsilon = (S_t / S) * C_L_delta_epsilon_t;
C_M_delta_epsilon = C_L_delta_epsilon * (h_cm - h_ac) - C_L_delta_epsilon_t * V_H;

%% Main Calculations
C_L = C_L_0 + C_L_alpha * alpha + C_L_delta_epsilon * delta_epsilon;
C_M = C_M_0 + C_M_alpha * alpha + C_M_delta_epsilon * delta_epsilon;

final_result = [0; 0; 0]; %[velocity; alpha_trim; delta_trim]

for V = 10:1:200 %For loop for finding trim conditions at different velocities

    %Setting up the matrices
    A = [C_L_alpha C_L_delta_epsilon;
        C_M_alpha C_M_delta_epsilon];
    C = [W / Q - C_L_0; -C_M_0]

    %B = [alpha_trim; delta_epsilon_trim]
    B = A \ C;

    final_result = horzcat(final_result, B);
end
