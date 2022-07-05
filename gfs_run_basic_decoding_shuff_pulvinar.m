function run_basic_decoding_shuff_pulvinar(shuff_num, params)
 
% the following parameters are hard coded but could be input arguments to this function
num_cv_splits = 14;     % use 14 cross-validation splits 
binned_data_file_name = params.binned_data_file_name; % use the data that was previously binned 

% create the basic objects needed for decoding
if strcmp(params.specific_binned_labels_names, 'condition_disap')
    % prepare for a generalization decoding
    ds = generalization_DS(binned_data_file_name, params.specific_binned_labels_names, num_cv_splits, ...
        params.the_training_label_names, params.the_test_label_names);
else
    % use basic decoding
    ds = basic_DS(binned_data_file_name, params.specific_binned_labels_names,  num_cv_splits); % create the basic datasource object
end

the_feature_preprocessors{1} = zscore_normalize_FP;  % create a feature preprocess that z-score normalizes each feature
the_classifier = max_correlation_coefficient_CL;  % select a classifier

if shuff_num == 0
	
    'Currently running regular decoding results'
	
	% if running the regular results, create the regular cross-validator
	the_cross_validator = standard_resample_CV(ds, the_classifier, the_feature_preprocessors);  
	
	% the name of where to save the results for regular (non-shuffled) decoding results as before
	save_file_name = params.save_file_name0;
    
    the_cross_validator.test_only_at_training_times = 0;
    
else
	
    'Currently running shuffled label decoding results (data for the null distribution)'
	
    ds.randomly_shuffle_labels_before_running = 1;  % randomly shuffled the labels before running
	
    % create the cross validator as before
    the_cross_validator = standard_resample_CV(ds, the_classifier, the_feature_preprocessors);  
	
    the_cross_validator.num_resample_runs = 50;  % only do 10 resample runs to save time
	
    % don't show progress to reduce visual clutter while the code is running
    the_cross_validator.display_progress.zero_one_loss = 0;  
    the_cross_validator.display_progress.resample_run_time = 0;
	
    % save the results with the appropriate name to the shuff_results/ directory
    save_file_name = [params.save_file_name1 num2str(shuff_num, '%03d')];
    
    % we will also greatly speed up the run-time of the analysis by not creating a full TCT matrix 
    % (i.e., we are only training and testing the classifier on the same time bin)
    the_cross_validator.test_only_at_training_times = 1;
    
end  

% run the decoding analysis and save the results
DECODING_RESULTS = the_cross_validator.run_cv_decoding; 

% save the results
save(save_file_name, 'DECODING_RESULTS'); 

end
