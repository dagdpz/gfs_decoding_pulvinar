clear all, close all

resultsFolders = dir('results_*');
resultsFolders = resultsFolders([resultsFolders.isdir]);

for fldNum = 1:length(resultsFolders)
    
    % find decoding results file
    resultsFile = dir(['./' resultsFolders(fldNum).name filesep '*.mat']);
    disp(resultsFile(1).name)
    
    % create a plot_standard_results_object that has the directory with the real results
    result_names{1} = [resultsFolders(fldNum).name filesep resultsFile(1).name];
    plot_obj = plot_standard_results_object(result_names);
 
    % create the names of directories that contain the shuffled data for creating null distributions
    % (this is a cell array so that multiple p-values are created when comparing results)
    pval_dir_name{1} = [resultsFolders(fldNum).name '/shuff/'];
    plot_obj.p_values = pval_dir_name;
 
    % use data from all time bins when creating the null distribution
    plot_obj.collapse_all_times_when_estimating_pvals = 1;
    plot_obj.significant_event_times = 5000;
    
    % plot the results as usual
    plot_obj.plot_results;
    ylim([0 100])
    close(1)
end