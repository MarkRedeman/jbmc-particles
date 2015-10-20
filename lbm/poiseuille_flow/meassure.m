%% meassure:
function [rho, velocity_x, velocity_y] = meassure(distributions, c_i)
    [nx, ny] = size(distributions{1});
    rho = zeros(nx, ny);
    velocity_x = zeros(nx, ny);
    velocity_y = zeros(nx, ny);

    for (x = 1:nx)
        for (y = 1:ny)
            for (idx = 1:length(distributions))
                rho(x, y) = rho(x, y) + distributions{idx}(x, y);
                velocity_x(x, y) = velocity_x(x, y) + distributions{idx}(x, y) * c_i(idx, 1);
                velocity_y(x, y) = velocity_y(x, y) + distributions{idx}(x, y) * c_i(idx, 2);
            end
        end
    end
    velocity_x = velocity_x ./ rho;
    velocity_y = velocity_y ./ rho;
end
