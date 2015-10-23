#ifndef INCLUDED_SOD_SHOCK_1D
#define INCLUDED_SOD_SHOCK_1D

#include <array>

#include "../../SPH.h"

template <typename Precision>
class Sod_Shock_1D
{
    using Conditions = std::array<Precision, 3> const;

    public:
        Sod_Shock_1D(
            Conditions left_conditions,
            Conditions right_conditions,
            Precision adiabatic_index
        );

        SPH<Precision> initialize(unsigned int particles) const;

    private:
        Precision d_adiabatic_index;
        Conditions d_left_conditions;
        Conditions d_right_conditions;
};

#endif