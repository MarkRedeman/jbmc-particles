% test rank of
function [tests] = test_equilibrium
    % tests = localfunctions
    tests = functiontests(localfunctions);
end

%% it_calculates_the_equilibrium_of_a_distribution_in_1d:
function [] = test_calculates_the_equilibrium_of_distribution_in_1d(tc)
     density = 1;
     velocity = [1];
     c_i = [1];
     w_i = 1;
     c_s = 1;

     assert(equilibrium(c_s, w_i, c_i, density, velocity) == 1 * 1 * ( ...
        1 + 1 + 1 / 2 - 1 / 2 ...
    ));
end


%% test_a_pair_wins_from_a_high_card:
function [] = test_calculates_the_equilibrium_of_a_2d_distribution(tc)
    density = 1;
    velocity = [2, 5];
    c_i = [-1, 1];
    w_i = 1;
    c_s = 1 / 3;

    assert(equilibrium(c_s, w_i, c_i, density, velocity) == 1 * 1 * ( ...
        1 +  (-2 + 5) * 3 + (-2 + 5)^2 / (2 / 9) - (4 + 25) / (2 / 3) ...
    ));
end

%% test_a_pair_wins_from_a_high_card:
function [] = test_calculates_the_equilibrium_of_a_3d_distribution(tc)
    density = 1;
    velocity = [2, 5, 7];
    c_i = [-1, 1, 1];
    w_i = 1;
    c_s = 1 / 3;

    assert(equilibrium(c_s, w_i, c_i, density, velocity) == 1 * 1 * ( ...
        1 +  (-2 + 5 + 7) * 3 + (-2 + 5 + 7)^2 / (2 / 9) - (4 + 25 + 49) / (2 / 3) ...
    ));
end


% % equilibrium stays in equilibrium
% %% an_equilibrium_stays_in_equilibrium:
% function [] = test_an_equilibrium_stays_in_equilibrium(eq)
%     % D1Q3
%     w_i = [2 / 3,  1 / 6, 1 / 6];
%     c_i = [0, 1, -1];
%     c_s = 1^2;

%     rho = 1;
%     velocity = 1;

%     eq = zeros(3, 1);
%     for idx = 1:3
%         w_i(idx)
%         c_i(idx)
%         eq(idx) = equilibrium(c_s, w_i(idx), c_i(idx), rho, velocity)
%     end

%     rho = eq(1) + eq(2) + eq(3)
%     velocity = (eq(2) - eq(3)) / rho

%     new_eq = zeros(3, 1);
%     for idx = 1:3
%         new_eq(idx) = equilibrium(c_s, w_i(idx), c_i(idx), rho, velocity);
%     end

%     display(norm(new_eq - eq, inf));
%     display(eq)
%     display(new_eq)
%     assert(1 == 2);
% end