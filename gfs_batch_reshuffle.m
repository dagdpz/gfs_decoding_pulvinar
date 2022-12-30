clear all, close all

data_list = {'delta', 'theta', 'alpha', 'beta', 'gamma1', 'gamma2', 'spk'};
data_list = {'alpha', 'beta', 'gamma1', 'spk'};

area_list = {'LGN', 'V4', 'pulvinar'};

% template
% params(n).mkdir1 = 
% params(n).mkdir2 = [params(n).mkdir1 filesep 'shuff'];
% params(n).specific_binned_labels_names = 
% params(n).the_training_label_names = 
% params(n).the_test_label_names = 
% params(n).paradigm = 
% params(n).binned_data_file_name = [params(n).paradigm '_sampled.mat'];
% params(n).cv_splits_num = 
% params(n).save_file_name0 = [params(n).mkdir1 filesep params(n).paradigm '_results'];
% params(n).save_file_name1 = [params(n).mkdir2 filesep params(n).paradigm '_results_shuff_run_'];
% n = n + 1;

n = 1;
% DECODE FROM RT-ALIGNED DATA - GENERALIZATION
% loop through data types (all the BLPs and spikes)
for dataTypeNum = 1:length(data_list)
    
    % loop through all the areas (LGN, V4, pulvinar)
    for areaNum = 1:length(area_list)
        % pulvinar both + generalization (1 of 4: physical vs. physical)
        params(n).mkdir1 = ['results_generalization_' area_list{areaNum} '_RTaligned_matchUnits_' data_list{dataTypeNum} '_physical-physical'];
        params(n).mkdir2 = [params(n).mkdir1 filesep 'shuff'];
        params(n).specific_binned_labels_names = 'condition_disap';
        params(n).the_training_label_names = {{'disap_physical'}, {'nodisap_physical'}};
        params(n).the_test_label_names = {{'disap_physical'}, {'nodisap_physical'}};
        params(n).paradigm = ['Binned_data_' area_list{areaNum} '_RTaligned_matchUnits_both_' data_list{dataTypeNum} '_250ms_bins_50ms'];
        params(n).binned_data_file_name = [params(n).paradigm '_sampled.mat'];
        params(n).save_file_name0 = [params(n).mkdir1 filesep params(n).paradigm '_results'];
        params(n).save_file_name1 = [params(n).mkdir2 filesep params(n).paradigm '_results_shuff_run_'];
        n = n + 1;
        
        % pulvinar both + generalization (2 of 4: physical vs. ambiguous)
        params(n).mkdir1 = ['results_generalization_' area_list{areaNum} '_RTaligned_matchUnits_' data_list{dataTypeNum} '_physical-ambiguous'];
        params(n).mkdir2 = [params(n).mkdir1 filesep 'shuff'];
        params(n).specific_binned_labels_names = 'condition_disap';
        params(n).the_training_label_names = {{'disap_physical'}, {'nodisap_physical'}};
        params(n).the_test_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
        params(n).paradigm = ['Binned_data_' area_list{areaNum} '_RTaligned_matchUnits_both_' data_list{dataTypeNum} '_250ms_bins_50ms'];
        params(n).binned_data_file_name = [params(n).paradigm '_sampled.mat'];
        params(n).save_file_name0 = [params(n).mkdir1 filesep params(n).paradigm '_results'];
        params(n).save_file_name1 = [params(n).mkdir2 filesep params(n).paradigm '_results_shuff_run_'];
        n = n + 1;
        
        % pulvinar both + generalization (3 of 4: ambiguous vs. physical)
        params(n).mkdir1 = ['results_generalization_' area_list{areaNum} '_RTaligned_matchUnits_' data_list{dataTypeNum} '_ambiguous-physical'];
        params(n).mkdir2 = [params(n).mkdir1 filesep 'shuff'];
        params(n).specific_binned_labels_names = 'condition_disap';
        params(n).the_training_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
        params(n).the_test_label_names = {{'disap_physical'}, {'nodisap_physical'}};
        params(n).paradigm = ['Binned_data_' area_list{areaNum} '_RTaligned_matchUnits_both_' data_list{dataTypeNum} '_250ms_bins_50ms'];
        params(n).binned_data_file_name = [params(n).paradigm '_sampled.mat'];
        params(n).save_file_name0 = [params(n).mkdir1 filesep params(n).paradigm '_results'];
        params(n).save_file_name1 = [params(n).mkdir2 filesep params(n).paradigm '_results_shuff_run_'];
        n = n + 1;
        
        % pulvinar both + generalization (4 of 4: ambiguous vs. ambiguous)
        params(n).mkdir1 = ['results_generalization_' area_list{areaNum} '_RTaligned_matchUnits_' data_list{dataTypeNum} '_ambiguous-ambiguous'];
        params(n).mkdir2 = [params(n).mkdir1 filesep 'shuff'];
        params(n).specific_binned_labels_names = 'condition_disap';
        params(n).the_training_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
        params(n).the_test_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
        params(n).paradigm = ['Binned_data_' area_list{areaNum} '_RTaligned_matchUnits_both_' data_list{dataTypeNum} '_250ms_bins_50ms'];
        params(n).binned_data_file_name = [params(n).paradigm '_sampled.mat'];
        params(n).save_file_name0 = [params(n).mkdir1 filesep params(n).paradigm '_results'];
        params(n).save_file_name1 = [params(n).mkdir2 filesep params(n).paradigm '_results_shuff_run_'];
        n = n + 1;
    end
end

% DECODE FROM SPIKE-MATCHED DATA - GENERALIZATION
% loop through data types (all the BLPs and spikes)
for dataTypeNum = 1:length(data_list)
    
    % loop through all the areas (LGN, V4, pulvinar)
    for areaNum = 1:length(area_list)
        % pulvinar both + generalization (1 of 4: physical vs. physical)
        params(n).mkdir1 = ['results_generalization_' area_list{areaNum} '_matchUnits_' data_list{dataTypeNum} '_physical-physical'];
        params(n).mkdir2 = [params(n).mkdir1 filesep 'shuff'];
        params(n).specific_binned_labels_names = 'condition_disap';
        params(n).the_training_label_names = {{'disap_physical'}, {'nodisap_physical'}};
        params(n).the_test_label_names = {{'disap_physical'}, {'nodisap_physical'}};
        params(n).paradigm = ['Binned_data_' area_list{areaNum} '_matchUnits_both_' data_list{dataTypeNum} '_250ms_bins_50ms'];
        params(n).binned_data_file_name = [params(n).paradigm '_sampled.mat'];
        params(n).save_file_name0 = [params(n).mkdir1 filesep params(n).paradigm '_results'];
        params(n).save_file_name1 = [params(n).mkdir2 filesep params(n).paradigm '_results_shuff_run_'];
        n = n + 1;
        
        % pulvinar both + generalization (2 of 4: physical vs. ambiguous)
        params(n).mkdir1 = ['results_generalization_' area_list{areaNum} '_matchUnits_' data_list{dataTypeNum} '_physical-ambiguous'];
        params(n).mkdir2 = [params(n).mkdir1 filesep 'shuff'];
        params(n).specific_binned_labels_names = 'condition_disap';
        params(n).the_training_label_names = {{'disap_physical'}, {'nodisap_physical'}};
        params(n).the_test_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
        params(n).paradigm = ['Binned_data_' area_list{areaNum} '_matchUnits_both_' data_list{dataTypeNum} '_250ms_bins_50ms'];
        params(n).binned_data_file_name = [params(n).paradigm '_sampled.mat'];
        params(n).save_file_name0 = [params(n).mkdir1 filesep params(n).paradigm '_results'];
        params(n).save_file_name1 = [params(n).mkdir2 filesep params(n).paradigm '_results_shuff_run_'];
        n = n + 1;
        
        % pulvinar both + generalization (3 of 4: ambiguous vs. physical)
        params(n).mkdir1 = ['results_generalization_' area_list{areaNum} '_matchUnits_' data_list{dataTypeNum} '_ambiguous-physical'];
        params(n).mkdir2 = [params(n).mkdir1 filesep 'shuff'];
        params(n).specific_binned_labels_names = 'condition_disap';
        params(n).the_training_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
        params(n).the_test_label_names = {{'disap_physical'}, {'nodisap_physical'}};
        params(n).paradigm = ['Binned_data_' area_list{areaNum} '_matchUnits_both_' data_list{dataTypeNum} '_250ms_bins_50ms'];
        params(n).binned_data_file_name = [params(n).paradigm '_sampled.mat'];
        params(n).save_file_name0 = [params(n).mkdir1 filesep params(n).paradigm '_results'];
        params(n).save_file_name1 = [params(n).mkdir2 filesep params(n).paradigm '_results_shuff_run_'];
        n = n + 1;
        
        % pulvinar both + generalization (4 of 4: ambiguous vs. ambiguous)
        params(n).mkdir1 = ['results_generalization_' area_list{areaNum} '_matchUnits_' data_list{dataTypeNum} '_ambiguous-ambiguous'];
        params(n).mkdir2 = [params(n).mkdir1 filesep 'shuff'];
        params(n).specific_binned_labels_names = 'condition_disap';
        params(n).the_training_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
        params(n).the_test_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
        params(n).paradigm = ['Binned_data_' area_list{areaNum} '_matchUnits_both_' data_list{dataTypeNum} '_250ms_bins_50ms'];
        params(n).binned_data_file_name = [params(n).paradigm '_sampled.mat'];
        params(n).save_file_name0 = [params(n).mkdir1 filesep params(n).paradigm '_results'];
        params(n).save_file_name1 = [params(n).mkdir2 filesep params(n).paradigm '_results_shuff_run_'];
        n = n + 1;
    end
end

% DECODE FROM SPIKE-MATCHED DATA - AMBIGUOUS
% loop through data types (spikes and all the BLPs)
for dataTypeNum = 1:length(data_list)
    
    % loop through all the areas (LGN, V4, pulvinar)
    for areaNum = 1:length(area_list)
        params(n).mkdir1 = ['results_' area_list{areaNum} '_matchUnits_ambiguous_' data_list{dataTypeNum} '_cvsplits14'];
        params(n).mkdir2 = [params(n).mkdir1 filesep 'shuff'];
        params(n).specific_binned_labels_names = 'disap_nodisap';
        params(n).paradigm = ['Binned_data_' area_list{areaNum} '_matchUnits_ambiguous_' data_list{dataTypeNum} '_250ms_bins_50ms'];
        params(n).binned_data_file_name = [params(n).paradigm '_sampled.mat'];
        params(n).cv_splits_num = 14;
        params(n).save_file_name0 = [params(n).mkdir1 filesep params(n).paradigm '_results'];
        params(n).save_file_name1 = [params(n).mkdir2 filesep params(n).paradigm '_results_shuff_run_'];
        n = n + 1;
    end
end

% DECODE FROM NO-MATCH DATA - AMBIGUOUS
% loop through data types (all the BLPs, no spikes this time)
for dataTypeNum = 1:length(data_list) - 1
    
    % loop through all the areas (LGN, V4, pulvinar)
    for areaNum = 1:length(area_list)
        
        params(n).mkdir1 = ['results_' area_list{areaNum} '_noMatchUnits_ambiguous_' data_list{dataTypeNum} '_cvsplits14'];
        params(n).mkdir2 = [params(n).mkdir1 filesep 'shuff'];
        params(n).specific_binned_labels_names = 'disap_nodisap';
        params(n).paradigm = ['Binned_data_' area_list{areaNum} '_noMatchUnits_ambiguous_' data_list{dataTypeNum} '_250ms_bins_50ms'];
        params(n).binned_data_file_name = [params(n).paradigm '_sampled.mat'];
        params(n).cv_splits_num = 14;
        params(n).save_file_name0 = [params(n).mkdir1 filesep params(n).paradigm '_results'];
        params(n).save_file_name1 = [params(n).mkdir2 filesep params(n).paradigm '_results_shuff_run_'];
        n = n + 1;
        
    end
end

% pulvinar both, eyemodi = 1
% params(17).mkdir1 = 'results_pulvinar_both1';
% params(17).mkdir2 = [params(17).mkdir1 '/shuff'];
% params(17).specific_binned_labels_names = 'disap_nodisap';
% params(17).paradigm = 'Binned_data_pulvinar_both1_250ms_bins_50ms';
% params(17).binned_data_file_name = [params(17).paradigm '_sampled.mat'];
% params(17).save_file_name0 = [params(17).mkdir1 '/' params(17).paradigm '_results'];
% params(17).save_file_name1 = [params(17).mkdir2 '/' params(17).paradigm '_results_shuff_run_'];
% n = n + 1;
% 
% pulvinar eye
% params(20).mkdir1 = 'results_pulvinar_eye';
% params(20).mkdir2 = [params(20).mkdir1 '/shuff'];
% params(20).specific_binned_labels_names = 'disap_nodisap';
% params(20).paradigm = 'Binned_data_pulvinar_eye_250ms_bins_50ms';
% params(20).binned_data_file_name = [params(20).paradigm '_sampled.mat'];
% params(20).save_file_name0 = [params(20).mkdir1 '/' params(20).paradigm '_results'];
% params(20).save_file_name1 = [params(20).mkdir2 '/' params(20).paradigm '_results_shuff_run_'];
% n = n + 1;
% 
% V4 eye
% params(21).mkdir1 = 'results_V4_eye';
% params(21).mkdir2 = [params(21).mkdir1 '/shuff'];
% params(21).specific_binned_labels_names = 'disap_nodisap';
% params(21).paradigm = 'Binned_data_V4_eye_250ms_bins_50ms';
% params(21).binned_data_file_name = [params(21).paradigm '_sampled.mat'];
% params(21).save_file_name0 = [params(21).mkdir1 '/' params(21).paradigm '_results'];
% params(21).save_file_name1 = [params(21).mkdir2 '/' params(21).paradigm '_results_shuff_run_'];
% n = n + 1;
% 
% LGN eye
% params(22).mkdir1 = 'results_LGN_eye';
% params(22).mkdir2 = [params(22).mkdir1 '/shuff'];
% params(22).specific_binned_labels_names = 'disap_nodisap';
% params(22).paradigm = 'Binned_data_LGN_eye_250ms_bins_50ms';
% params(22).binned_data_file_name = [params(22).paradigm '_sampled.mat'];
% params(22).save_file_name0 = [params(22).mkdir1 '/' params(22).paradigm '_results'];
% params(22).save_file_name1 = [params(22).mkdir2 '/' params(22).paradigm '_results_shuff_run_'];
% n = n + 1;
% 
% pulvinar target responsive
% params(23).mkdir1 = 'results_pulvinar_response';
% params(23).mkdir2 = [params(23).mkdir1 '/shuff'];
% params(23).specific_binned_labels_names = 'disap_nodisap';
% params(23).paradigm = 'Binned_data_pulvinar_response_250ms_bins_50ms';
% params(23).binned_data_file_name = [params(23).paradigm '_sampled.mat'];
% params(23).save_file_name0 = [params(23).mkdir1 '/' params(23).paradigm '_results'];
% params(23).save_file_name1 = [params(23).mkdir2 '/' params(23).paradigm '_results_shuff_run_'];
% n = n + 1;
% 
% pulvinar target non-responsive
% params(24).mkdir1 = 'results_pulvinar_noResponse';
% params(24).mkdir2 = [params(24).mkdir1 '/shuff'];
% params(24).specific_binned_labels_names = 'disap_nodisap';
% params(24).paradigm = 'Binned_data_pulvinar_noResponse_250ms_bins_50ms';
% params(24).binned_data_file_name = [params(24).paradigm '_sampled.mat'];
% params(24).save_file_name0 = [params(24).mkdir1 '/' params(24).paradigm '_results'];
% params(24).save_file_name1 = [params(24).mkdir2 '/' params(24).paradigm '_results_shuff_run_'];
% n = n + 1;
% 
% below are half/half datasets for the pulvinar
% pulvinar half1_1 
% params(25).mkdir1 = 'results_pulvinar_ambiguous_half1_1';
% params(25).mkdir2 = [params(25).mkdir1 '/shuff'];
% params(25).specific_binned_labels_names = 'disap_nodisap';
% params(25).paradigm = 'Binned_data_pulvinar_ambiguous_half1_1_250ms_bins_50ms';
% params(25).binned_data_file_name = [params(25).paradigm '_sampled.mat'];
% params(25).save_file_name0 = [params(25).mkdir1 '/' params(25).paradigm '_results'];
% params(25).save_file_name1 = [params(25).mkdir2 '/' params(25).paradigm '_results_shuff_run_'];
% n = n + 1;
% 
% pulvinar half2_1 
% params(26).mkdir1 = 'results_pulvinar_ambiguous_half2_1';
% params(26).mkdir2 = [params(26).mkdir1 '/shuff'];
% params(26).specific_binned_labels_names = 'disap_nodisap';
% params(26).paradigm = 'Binned_data_pulvinar_ambiguous_half2_1_250ms_bins_50ms';
% params(26).binned_data_file_name = [params(26).paradigm '_sampled.mat'];
% params(26).save_file_name0 = [params(26).mkdir1 '/' params(26).paradigm '_results'];
% params(26).save_file_name1 = [params(26).mkdir2 '/' params(26).paradigm '_results_shuff_run_'];
% n = n + 1;
% 
% pulvinar half1_2 
% params(27).mkdir1 = 'results_pulvinar_ambiguous_half1_2';
% params(27).mkdir2 = [params(27).mkdir1 '/shuff'];
% params(27).specific_binned_labels_names = 'disap_nodisap';
% params(27).paradigm = 'Binned_data_pulvinar_ambiguous_half1_2_250ms_bins_50ms';
% params(27).binned_data_file_name = [params(27).paradigm '_sampled.mat'];
% params(27).save_file_name0 = [params(27).mkdir1 '/' params(27).paradigm '_results'];
% params(27).save_file_name1 = [params(27).mkdir2 '/' params(27).paradigm '_results_shuff_run_'];
% n = n + 1;
% 
% pulvinar half2_2 
% params(28).mkdir1 = 'results_pulvinar_ambiguous_half2_2';
% params(28).mkdir2 = [params(28).mkdir1 '/shuff'];
% params(28).specific_binned_labels_names = 'disap_nodisap';
% params(28).paradigm = 'Binned_data_pulvinar_ambiguous_half2_2_250ms_bins_50ms';
% params(28).binned_data_file_name = [params(28).paradigm '_sampled.mat'];
% params(28).save_file_name0 = [params(28).mkdir1 '/' params(28).paradigm '_results'];
% params(28).save_file_name1 = [params(28).mkdir2 '/' params(28).paradigm '_results_shuff_run_'];
% n = n + 1;
% 
% below are half/half datasets for the pulvinar 214 neurons
% pulvinar half1_1 
% params(29).mkdir1 = 'results_pulvinar_ambiguous214_half1_1';
% params(29).mkdir2 = [params(29).mkdir1 '/shuff'];
% params(29).specific_binned_labels_names = 'disap_nodisap';
% params(29).paradigm = 'Binned_data_pulvinar_ambiguous214_half1_1_250ms_bins_50ms';
% params(29).binned_data_file_name = [params(29).paradigm '_sampled.mat'];
% params(29).save_file_name0 = [params(29).mkdir1 '/' params(29).paradigm '_results'];
% params(29).save_file_name1 = [params(29).mkdir2 '/' params(29).paradigm '_results_shuff_run_'];
% n = n + 1;
% 
% pulvinar half2_1 
% params(30).mkdir1 = 'results_pulvinar_ambiguous214_half2_1';
% params(30).mkdir2 = [params(30).mkdir1 '/shuff'];
% params(30).specific_binned_labels_names = 'disap_nodisap';
% params(30).paradigm = 'Binned_data_pulvinar_ambiguous214_half2_1_250ms_bins_50ms';
% params(30).binned_data_file_name = [params(30).paradigm '_sampled.mat'];
% params(30).save_file_name0 = [params(30).mkdir1 '/' params(30).paradigm '_results'];
% params(30).save_file_name1 = [params(30).mkdir2 '/' params(30).paradigm '_results_shuff_run_'];
% n = n + 1;
% 
% pulvinar half1_2 
% params(31).mkdir1 = 'results_pulvinar_ambiguous214_half1_2';
% params(31).mkdir2 = [params(31).mkdir1 '/shuff'];
% params(31).specific_binned_labels_names = 'disap_nodisap';
% params(31).paradigm = 'Binned_data_pulvinar_ambiguous214_half1_2_250ms_bins_50ms';
% params(31).binned_data_file_name = [params(31).paradigm '_sampled.mat'];
% params(31).save_file_name0 = [params(31).mkdir1 '/' params(31).paradigm '_results'];
% params(31).save_file_name1 = [params(31).mkdir2 '/' params(31).paradigm '_results_shuff_run_'];
% n = n + 1;
% 
% pulvinar half2_2 
% params(32).mkdir1 = 'results_pulvinar_ambiguous214_half2_2';
% params(32).mkdir2 = [params(32).mkdir1 '/shuff'];
% params(32).specific_binned_labels_names = 'disap_nodisap';
% params(32).paradigm = 'Binned_data_pulvinar_ambiguous214_half2_2_250ms_bins_50ms';
% params(32).binned_data_file_name = [params(32).paradigm '_sampled.mat'];
% params(32).save_file_name0 = [params(32).mkdir1 '/' params(32).paradigm '_results'];
% params(32).save_file_name1 = [params(32).mkdir2 '/' params(32).paradigm '_results_shuff_run_'];
% n = n + 1;



for parNum = 1:length(params)
    
    mkdir(params(parNum).mkdir1)
    mkdir(params(parNum).mkdir2)
    
    for i = 0:500
        i
        if i == 0
            save_file_name = [params(parNum).save_file_name0 '.mat'];
        else
            save_file_name = [params(parNum).save_file_name1 num2str(i, '%03d') '.mat'];
        end
        
        if exist(save_file_name, 'file') == 2
            continue
        end
        
        disp(['Decoding from ' params(parNum).paradigm])
        gfs_run_basic_decoding_shuff_pulvinar(i, params(parNum));
    end
    
end
