function density = density_calculator(height)
    %%constants
    rho_sl = 1.225;        %air density at sea level - in kg/m^3
    rho_11000 = 0.3642;    %air density at the altitude of 11km - in kg/m^3
    Temp_sl = 288.16;      %Temperature at sea level - in kelvin 
    Temp_11000 = 216.66;   %Temperature at altitude of 11km - in kelvin 
    a1 = -6.5*10^-3;       %temperature gradient - k/m
    h_11 = 11000;          %height - in meters
    g = 9.8;               %acceleration due to gravity - in m/s^2
    R = 287;               %gas constant
    
    Temp_h = Temp_sl + (a1 * height);

    if height <= 11000
        density = rho_sl * (Temp_h / Temp_sl)^(-1 - (g / (a1 * R)));
    else
        density = rho_11000 * exp(-g * (height - h_11) / (R * Temp_11000));
    end
end