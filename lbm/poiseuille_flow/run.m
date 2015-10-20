clear all;
figure(1)
max_time = 1E6;
time = 0;
t_plot = 2;

tau = 0.666;
nx = 20;
ny = 50;
figure(1);
% D2Q9
[c_i, w_i, c_s] = d2q9();
N = length(w_i);

% initialize
f = {}; f_streamed = {};

% Currently not used;
rho = abs(5 * (sin(1:nx)' * sin(1:ny)));
v_x = (nx * ny) * sin(1:nx)' * sin(1:ny);
v_y = (nx * ny) * sin(1:nx)' * sin(1:ny);

% Note refactor
for idx = 1:N
    f{idx} = zeros(nx, ny);
    for x = 1:nx
        for y = 1:ny
            % f{idx}(x, y) = 1 / 9;
            f{idx}(x, y) = equilibrium(c_s, w_i(idx), c_i(idx, :), rho(x, y), [v_x(x, y), v_y(x, y)]);
        end
    end
    % f_streamed{idx} = f;
end
% f{1}(ceil(nx / 2), ceil(ny / 2)) = 1;

[rho, v_x, v_y] = meassure(f, c_i);

while (time < max_time)
    fprintf('Time: %d, Density: %f\n', time, sum(rho(:)));
    time = time + 1;

    % Apply boundary conditions

    % stream (refactor)
    for idx = 1:N
        for x = 1:nx
            for y = 1:ny
                % Using modulo we get a periodic boundary
                gather_x = mod(x - c_i(idx, 1), nx);
                gather_y = mod(y - c_i(idx, 2), ny);
                f_streamed{idx}(x, y) = f{idx}(gather_x, gather_y);
            end
        end
    end

    % collide
    for idx = 1:N
        for x = 1:nx
            for y = 1:ny
                f_eq = equilibrium(c_s, w_i(idx), c_i(idx, :), rho(x, y), [v_x(x, y), v_y(x, y)]);
                f{idx}(x, y) = f_streamed{idx}(x, y) - (f_streamed{idx}(x, y) - f_eq) / tau;
            end
        end
    end

    [rho, v_x, v_y] = meassure(f, c_i);

    % Visualize
    if (mod(time,t_plot) == 1)
        gcf;
        hold off;
        contourf(rho);
        hold on;
        quiver(1:ny, 1:nx, v_x, v_y);
        pause(1 / 60)
    end

end

