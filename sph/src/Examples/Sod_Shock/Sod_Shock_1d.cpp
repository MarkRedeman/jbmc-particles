#include "Sod_Shock_1d.h"

#include <vector>
#include <cmath>

template <typename Precision>
Sod_Shock_1D<Precision>::Sod_Shock_1D(Conditions left_conditions, Conditions right_conditions, Precision adiabatic_index)
:
    d_left_conditions(left_conditions),
    d_right_conditions(right_conditions),
    d_adiabatic_index(adiabatic_index)
{}

template <typename Precision>
SPH<Precision> Sod_Shock_1D<Precision>::initialize(unsigned int particles) const
{
    using Vector = std::vector<Precision>;
    Vector velocities(particles);
    Vector densities(particles);
    Vector pressures(particles);

    auto left_halve = particles / 2;

    for (unsigned int i = 0; i < left_halve; ++i)
    {
        velocities[i] = d_left_conditions[0];
        densities[i] = d_left_conditions[1];
        pressures[i] = d_left_conditions[2];
    }

    for (unsigned int i = left_halve; i < particles; ++i)
    {
        velocities[i] = d_right_conditions[0];
        densities[i] = d_right_conditions[1];
        pressures[i] = d_right_conditions[2];
    }

    return SPH<Precision> {
        velocities, densities, pressures
        // Todo (?) add a function pointer for the equation of state
        // add a function pointer to the kernel
        // Or maybe both are objects?
    };
}

template class Sod_Shock_1D<double>;