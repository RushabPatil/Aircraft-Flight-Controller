#include <iostream>
#include <math.h>
using namespace std;

void main()
{
    //Calculating density(kg/m^3) for a given altitude(km)
    double altitude, density, pressure, temperature;

    //constants
    float T_sl = 288.16;   //Kelvin(K) - Temperature at sea level
    float a_1 = -0.0065;   //Kelvin per meter(K/m) - Temperature Gradient
    float T_11 = 216.66;   //Kelvin(K) - Temperature at altitude = 11 km
    float P_sl = 101.32;   //kiloPascal(kPa) - Pressure at sea level
    float P_11 = 22.346;   //kiloPascal(kPa) - Pressure at altitude = 11km
    float rho_11 = 0.3642; //Kilogram/meters cube (kg/m^3) - Density at altitude = 11km
    float g = 9.8;         //meters/second square (m/s^2) - Gravittional acceleration
    float R = 287;         //Joules/Kilogram-Kelvin(J/kg.K) - Universal Gas Constant

    //user input
    cout << "Input the altitude in km = ";
    cin >> altitude;

    if (altitude > 11)
    {
        temperature = T_11;
        pressure = P_11 * exp();
        cout << "Temperature at " << altitude << "= " << temperature << "K" << endl;
    }
    else
    {
    }
}
