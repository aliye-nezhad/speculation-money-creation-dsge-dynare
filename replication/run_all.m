% Run all four historical loan-allocation calibrations.
% Execute this file from any location after Dynare has been added to the path.

script_path = mfilename('fullpath');
repository_root = fileparts(fileparts(script_path));
models_directory = fullfile(repository_root, 'models');
original_directory = pwd;
cleanup_directory = onCleanup(@() cd(original_directory));

model_files = {
    'speculation_money_creation_q02.mod'
    'speculation_money_creation_q04.mod'
    'speculation_money_creation_q06.mod'
    'speculation_money_creation_q08.mod'
};

cd(models_directory);

for model_index = 1:numel(model_files)
    model_file = model_files{model_index};
    fprintf('\nRunning %s\n', model_file);
    dynare(model_file, 'noclearall');
end

fprintf('\nAll four Dynare calibration cases completed.\n');
