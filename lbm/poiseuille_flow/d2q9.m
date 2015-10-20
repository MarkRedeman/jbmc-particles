%% d2q9:
function [c_i, w_i, c_s] = d2q9()
    c_i = [
        [ 0,  0],
        [ 1,  0],
        [ 0,  1],
        [-1,  0],
        [ 0, -1],
        [ 1,  1],
        [-1,  1],
        [-1, -1],
        [ 1, -1],
    ];
    w_i = [
        4 / 9, 1 / 9, 1 / 9, 1 / 9, 1 / 9, 1 / 36, 1 / 36, 1 / 36, 1 / 36
    ];
    c_s = 1 / 3;
end