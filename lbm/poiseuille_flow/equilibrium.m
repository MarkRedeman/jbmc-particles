%% equilibrium:
% input:
% w_i scalar weight
% c_i 2-vector
% density scalar
% velocity 2-vector
% c_s scalar
function [equilibrium] = equilibrium(c_s, w_i, c_i, density, velocity)
    c_1 = (c_i * velocity') / (c_s);
    c_2 = ((c_i * velocity')^2) / (2 * c_s^2);
    c_3 = (dot(velocity, velocity)) / (2 * c_s);

    equilibrium = w_i * density .* (1 + c_1 + c_2 - c_3);
end