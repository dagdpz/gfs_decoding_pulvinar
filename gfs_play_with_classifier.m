clear all, close all

binned_format_file_name = 'Binned_data_pulvinar_physical_250ms_bins_50ms_sampled.mat';

load(binned_format_file_name)

% will decode the condition
specific_label_name_to_use = 'disap_nodisap';

% % figure out number of repetitions of each stimulus
% for k = 1:65
%     inds_of_sites_with_at_least_k_repeats = find_sites_with_k_label_repetitions(binned_labels.disap_nodisap, k);
%     num_sites_with_k_repeats(k) = length(inds_of_sites_with_at_least_k_repeats);
% end
% 
% a = diff(num_sites_with_k_repeats);
% num_cv_splits = find(a ~= 0, 1, 'first'); % equals to minimal number of stimulus repetitions
% disp(['Number of maximum cv splits is ' num2str(num_cv_splits)])

ds = basic_DS(binned_format_file_name, specific_label_name_to_use, 14); % make 14 cv splits
%ds.sites_to_use = neurons2take;

[XTr_all_time_cv YTr_all XTe_all_time_cv YTe_all] = get_data(ds);



% create a feature preprocessor that z-score normalizes each neuron

% note that the FP objects are stored in a cell array
% which allows multiple FP objects to be used in one analysis

the_feature_preprocessors{1} = zscore_normalize_FP;
%     the_feature_preprocessors{2} = select_or_exclude_top_k_features_FP;
%     the_feature_preprocessors{2}.num_features_to_use = 25;

% create the CL object
the_classifier = max_correlation_coefficient_CL;

% create the CV object
the_cross_validator = standard_resample_CV(ds, the_classifier, the_feature_preprocessors);

% we will also greatly speed up the run-time of the analysis by not creating a full TCT matrix
% (i.e., we are only training and testing the classifier on the same time bin)
the_cross_validator.test_only_at_training_times = 1;

% set how many times the outer 'resample' loop is run
% generally we use more than 2 resample runs which will give more accurate results
% but to save time in this tutorial we are using a small number.

the_cross_validator.num_resample_runs = 50;

% run the decoding analysis
DECODING_RESULTS = the_cross_validator.run_cv_decoding;

save_file_name = ['Results_excluded' binnedFiles(flNum).name(12:end)];

save(save_file_name, 'DECODING_RESULTS');
