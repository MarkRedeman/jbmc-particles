#include <bandit/bandit.h>

using namespace bandit;

#include <array>

#include "../../src/Examples/Sod_Shock/Sod_Shock_1d.h"

go_bandit([](){
    describe("Solving the Sod Shock (1D) problem using SPH", [&](){
        using Conditions = std::array<double, 3>;
        // Involves the simulation of a 1D Riemann problem for an ideal gas

        it("It takes the initial conditions as constructor arguments", [&](){
            // velocity, density, pressure
            Conditions left_conditions = {0.0, 1.0, 1.0};
            Conditions right_conditions = {0.0, 0.125, 0.1};

            double abiatic_index = 1.4; // gamma
            Sod_Shock_1D<double> sod_shock(left_conditions, right_conditions, abiatic_index);
        });

        it("It initializes an SPH simulation", [&](){
            // velocity, density, pressure
            Conditions left_conditions = {0.0, 1.0, 1.0};
            Conditions right_conditions = {0.0, 0.125, 0.1};

            double abiatic_index = 1.4; // gamma
            Sod_Shock_1D<double> sod_shock(left_conditions, right_conditions, abiatic_index);

            auto sph = sod_shock.initialize(100);
        });
    });
});