% test d2q9 lattice
function [tests] = test_d2q9
    tests = functiontests(localfunctions);
end

%% it_calculates_the_equilibrium_of_a_distribution_in_1d:
function [] = test_it_creates_a_d2q9_lattice(tc)
     [c_i, w_i, c_s] = d2q9();

     assert(isequal(c_i, [
        [ 0,  0],
        [ 1,  0],
        [ 0,  1],
        [-1,  0],
        [ 0, -1],
        [ 1,  1],
        [-1,  1],
        [-1, -1],
        [ 1, -1],
    ]) == true);

    assert(isequal(w_i, [4 / 9, 1 / 9, 1 / 9, 1 / 9, 1 / 9, 1 / 36, 1 / 36, 1 / 36, 1 / 36]) == true);
    assert(c_s == 1 / 3);
end

%% test_it_satisfies_the_first_lattice_constraint:
function [] = test_it_satisfies_the_first_lattice_constraint(tc)
    import matlab.unittest.constraints.IsEqualTo;
    import matlab.unittest.constraints.RelativeTolerance;

    [c_i, w_i, c_s] = d2q9();

    tc.assertThat(sum(w_i), IsEqualTo(1, 'Within', RelativeTolerance(1E-8)));
end

%% test_it_satisfies_the_second_lattice_constraint:
function [] = test_it_satisfies_the_second_lattice_constraint(tc)
    import matlab.unittest.constraints.IsEqualTo;
    import matlab.unittest.constraints.RelativeTolerance;

    [c_i, w_i, c_s] = d2q9();
    tc.assertThat(sum(w_i' .* c_i(:, 1)), IsEqualTo(0, 'Within', RelativeTolerance(1E-8)));
    tc.assertThat(sum(w_i' .* c_i(:, 2)), IsEqualTo(0, 'Within', RelativeTolerance(1E-8)));
end

%% test_it_satisfies_the_third_lattice_constraint:
function [] = test_it_satisfies_the_third_lattice_constraint(tc)
    import matlab.unittest.constraints.IsEqualTo;
    import matlab.unittest.constraints.RelativeTolerance;

    [c_i, w_i, c_s] = d2q9();

    tc.assertThat(sum(w_i' .* c_i(:, 1) .* c_i(:, 1)), IsEqualTo(c_s, 'Within', RelativeTolerance(1E-8)));
    tc.assertThat(sum(w_i' .* c_i(:, 2) .* c_i(:, 2)), IsEqualTo(c_s, 'Within', RelativeTolerance(1E-8)));
    tc.assertThat(sum(w_i' .* c_i(:, 1) .* c_i(:, 2)), IsEqualTo(0, 'Within', RelativeTolerance(1E-8)));
    tc.assertThat(sum(w_i' .* c_i(:, 2) .* c_i(:, 1)), IsEqualTo(0, 'Within', RelativeTolerance(1E-8)));
end

%% test_it_satisfies_the_fourth_lattice_constraint:
function [] = test_it_satisfies_the_fourth_lattice_constraint(tc)
    import matlab.unittest.constraints.IsEqualTo;
    import matlab.unittest.constraints.RelativeTolerance;

    [c_i, w_i, c_s] = d2q9();

    tc.assertThat(sum(w_i' .* c_i(:, 1) .* c_i(:, 1)  .* c_i(:, 1)), IsEqualTo(0, 'Within', RelativeTolerance(1E-8)));

    tc.assertThat(sum(w_i' .* c_i(:, 1) .* c_i(:, 1)  .* c_i(:, 2)), IsEqualTo(0, 'Within', RelativeTolerance(1E-8)));
    tc.assertThat(sum(w_i' .* c_i(:, 1) .* c_i(:, 2)  .* c_i(:, 1)), IsEqualTo(0, 'Within', RelativeTolerance(1E-8)));
    tc.assertThat(sum(w_i' .* c_i(:, 2) .* c_i(:, 1)  .* c_i(:, 1)), IsEqualTo(0, 'Within', RelativeTolerance(1E-8)));

    tc.assertThat(sum(w_i' .* c_i(:, 1) .* c_i(:, 2)  .* c_i(:, 2)), IsEqualTo(0, 'Within', RelativeTolerance(1E-8)));
    tc.assertThat(sum(w_i' .* c_i(:, 2) .* c_i(:, 2)  .* c_i(:, 1)), IsEqualTo(0, 'Within', RelativeTolerance(1E-8)));
    tc.assertThat(sum(w_i' .* c_i(:, 2) .* c_i(:, 1)  .* c_i(:, 2)), IsEqualTo(0, 'Within', RelativeTolerance(1E-8)));

    tc.assertThat(sum(w_i' .* c_i(:, 2) .* c_i(:, 2)  .* c_i(:, 2)), IsEqualTo(0, 'Within', RelativeTolerance(1E-8)));
end
