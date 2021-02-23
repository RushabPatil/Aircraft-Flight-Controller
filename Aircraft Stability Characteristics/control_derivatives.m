function out = control_derivatives(s, S_t, h_cm, h_ac, V_H)
    %Control Derivatives
    C_L_delta_epsilon = (S_t / S) * C_L_delta_epsilon_t;
    C_M_delta_epsilon = C_L_delta_epsilon * (h_cm - h_ac) - C_L_delta_epsilon_t * V_H;
    
    out = [C_L_delta_epsilon; C_M_delta_epsilon];
end