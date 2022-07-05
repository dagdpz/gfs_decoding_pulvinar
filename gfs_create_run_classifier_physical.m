clear all, close all

% create binned data
raster_file_directory_name = '.\allAreas_physical';
save_prefix_name = 'Binned_';
bin_width = 200;
step_size = 20;

create_binned_data_from_raster_data(raster_file_directory_name, save_prefix_name, bin_width, step_size);

% load the binned data
load Binned__150ms_bins_50ms_sampled.mat

for k = 1:65
    inds_of_sites_with_at_least_k_repeats = find_sites_with_k_label_repetitions(binned_labels.condition, k);
    num_sites_with_k_repeats(k) = length(inds_of_sites_with_at_least_k_repeats);
end

% the name of the file that has the data in binned-format
binned_format_file_name = 'Binned__150ms_bins_50ms_sampled.mat';
 
% will decode the identity of which object was shown (regardless of its position)
specific_label_name_to_use = 'condition';
 
num_cv_splits = 4;
 
ds = basic_DS(binned_format_file_name, specific_label_name_to_use, num_cv_splits);

% create a feature preprocessor that z-score normalizes each neuron
 
% note that the FP objects are stored in a cell array 
% which allows multiple FP objects to be used in one analysis
 
the_feature_preprocessors{1} = zscore_normalize_FP;

% create the CL object
the_classifier = max_correlation_coefficient_CL;

% create the CV object
the_cross_validator = standard_resample_CV(ds, the_classifier, the_feature_preprocessors);
 
% set how many times the outer 'resample' loop is run
% generally we use more than 2 resample runs which will give more accurate results
% but to save time in this tutorial we are using a small number.
 
the_cross_validator.num_resample_runs = 10;

% run the decoding analysis
DECODING_RESULTS = the_cross_validator.run_cv_decoding;
 
save_file_name = 'Binned_pulvinar_physical_data_results';

save(save_file_name, 'DECODING_RESULTS');

result_names{1} = save_file_name;  
 
% create the plot results object
plot_obj = plot_standard_results_object(result_names);
 
% put a line at the time when the stimulus was shown
plot_obj.significant_event_times = 5000;
 
% display the results
plot_obj.plot_results;

% % create the plot results object
% % note that this object takes a string in its constructor not a cell array
% plot_obj = plot_standard_results_TCT_object(save_file_name);
%  
% % put a line at the time when the stimulus was shown
% plot_obj.significant_event_times = 0;
%  
% % display the results
% plot_obj.plot_results;
