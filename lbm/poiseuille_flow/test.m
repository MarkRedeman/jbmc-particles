%% test:
% Runs each test in the current folder and includes files from the src
% folder before running them
function [result] = test()
    clear functions;

    whatToTest = '../';

    import matlab.unittest.TestSuite

    suite = TestSuite.fromFolder('./tests');

    % Add the files under test to our path
    addpath(whatToTest);

    result = run(suite);

    % Remove files under test from our path
    rmpath(whatToTest);
end