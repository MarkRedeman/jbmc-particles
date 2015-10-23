#ifndef INCLUDED_SPH
#define INCLUDED_SPH

#include <cstring>
#include <vector>
#include <array>

template <typename T>
class SPH
{
    using Vector = std::vector<T>;

    public:
        SPH(Vector velocities, Vector densities, Vector pressures)
        :
            d_velocities(velocities),
            d_densities(densities),
            d_pressures(pressures)
        {};

    private:
        Vector d_velocities;
        Vector d_densities;
        Vector d_pressures;
};

#endif