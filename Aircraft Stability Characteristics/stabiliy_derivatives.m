function out = stability_derivatives()
    %Stability Derivatives
    C_L_0 = C_L_0_w + (S_t / S) * (i_t - epsilon_0);
    C_M_0 = C_M_0_w + C_L_0 * (h_cm - h_ac) - V_H * C_L_alpha_t * (i_t - epsilon_0);
    C_L_alpha = C_L_alpha_w + (S_t / S) * C_L_alpha_t * (1 - k_epsilon_alpha);
    C_M_alpha = C_L_alpha * (h_cm - h_ac) - V_H * C_L_alpha_t * (1 - k_epsilon_alpha);

    out = [ C_L_0; C_M_0; C_L_alpha; C_M_alpha];
end