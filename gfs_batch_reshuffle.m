clear all, close all

% pulvinar both + generalization (1 of 4: physical vs. physical)
params(1).mkdir1 = 'results_generalization_pulvinar_physical-physical';
params(1).mkdir2 = [params(1).mkdir1 filesep 'shuff'];
params(1).specific_binned_labels_names = 'condition_disap';
params(1).the_training_label_names = {{'disap_physical'}, {'nodisap_physical'}};
params(1).the_test_label_names = {{'disap_physical'}, {'nodisap_physical'}};
params(1).paradigm = 'Binned_data_pulvinar_both_250ms_bins_50ms';
params(1).binned_data_file_name = [params(1).paradigm '_sampled.mat'];
params(1).save_file_name0 = [params(1).mkdir1 filesep params(1).paradigm '_results'];
params(1).save_file_name1 = [params(1).mkdir2 filesep params(1).paradigm '_results_shuff_run_'];

% pulvinar both + generalization (2 of 4: physical vs. ambiguous)
params(2).mkdir1 = 'results_generalization_pulvinar_physical-ambiguous';
params(2).mkdir2 = [params(2).mkdir1 filesep 'shuff'];
params(2).specific_binned_labels_names = 'condition_disap';
params(2).the_training_label_names = {{'disap_physical'}, {'nodisap_physical'}};
params(2).the_test_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
params(2).paradigm = 'Binned_data_pulvinar_both_250ms_bins_50ms';
params(2).binned_data_file_name = [params(2).paradigm '_sampled.mat'];
params(2).save_file_name0 = [params(2).mkdir1 filesep params(2).paradigm '_results'];
params(2).save_file_name1 = [params(2).mkdir2 filesep params(2).paradigm '_results_shuff_run_'];

% pulvinar both + generalization (3 of 4: ambiguous vs. physical)
params(3).mkdir1 = 'results_generalization_pulvinar_ambiguous-physical';
params(3).mkdir2 = [params(3).mkdir1 filesep 'shuff'];
params(3).specific_binned_labels_names = 'condition_disap';
params(3).the_training_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
params(3).the_test_label_names = {{'disap_physical'}, {'nodisap_physical'}};
params(3).paradigm = 'Binned_data_pulvinar_both_250ms_bins_50ms';
params(3).binned_data_file_name = [params(3).paradigm '_sampled.mat'];
params(3).save_file_name0 = [params(3).mkdir1 filesep params(3).paradigm '_results'];
params(3).save_file_name1 = [params(3).mkdir2 filesep params(3).paradigm '_results_shuff_run_'];

% pulvinar both + generalization (4 of 4: ambiguous vs. ambiguous)
params(4).mkdir1 = 'results_generalization_pulvinar_ambiguous-ambiguous';
params(4).mkdir2 = [params(4).mkdir1 filesep 'shuff'];
params(4).specific_binned_labels_names = 'condition_disap';
params(4).the_training_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
params(4).the_test_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
params(4).paradigm = 'Binned_data_pulvinar_both_250ms_bins_50ms';
params(4).binned_data_file_name = [params(4).paradigm '_sampled.mat'];
params(4).save_file_name0 = [params(4).mkdir1 filesep params(4).paradigm '_results'];
params(4).save_file_name1 = [params(4).mkdir2 filesep params(4).paradigm '_results_shuff_run_'];

% LGN both + generalization (1 of 4: physical vs. physical)
params(5).mkdir1 = 'results_generalization_LGN_physical-physical';
params(5).mkdir2 = [params(5).mkdir1 filesep 'shuff'];
params(5).specific_binned_labels_names = 'condition_disap';
params(5).the_training_label_names = {{'disap_physical'}, {'nodisap_physical'}};
params(5).the_test_label_names = {{'disap_physical'}, {'nodisap_physical'}};
params(5).paradigm = 'Binned_data_LGN_both_250ms_bins_50ms';
params(5).binned_data_file_name = [params(5).paradigm '_sampled.mat'];
params(5).save_file_name0 = [params(5).mkdir1 filesep params(5).paradigm '_results'];
params(5).save_file_name1 = [params(5).mkdir2 filesep params(5).paradigm '_results_shuff_run_'];

% LGN both + generalization (2 of 4: physical vs. ambiguous)
params(6).mkdir1 = 'results_generalization_LGN_physical-ambiguous';
params(6).mkdir2 = [params(6).mkdir1 filesep 'shuff'];
params(6).specific_binned_labels_names = 'condition_disap';
params(6).the_training_label_names = {{'disap_physical'}, {'nodisap_physical'}};
params(6).the_test_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
params(6).paradigm = 'Binned_data_LGN_both_250ms_bins_50ms';
params(6).binned_data_file_name = [params(6).paradigm '_sampled.mat'];
params(6).save_file_name0 = [params(6).mkdir1 filesep params(6).paradigm '_results'];
params(6).save_file_name1 = [params(6).mkdir2 filesep params(6).paradigm '_results_shuff_run_'];

% LGN both + generalization (3 of 4: ambiguous vs. physical)
params(7).mkdir1 = 'results_generalization_LGN_ambiguous-physical';
params(7).mkdir2 = [params(7).mkdir1 filesep 'shuff'];
params(7).specific_binned_labels_names = 'condition_disap';
params(7).the_training_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
params(7).the_test_label_names = {{'disap_physical'}, {'nodisap_physical'}};
params(7).paradigm = 'Binned_data_LGN_both_250ms_bins_50ms';
params(7).binned_data_file_name = [params(7).paradigm '_sampled.mat'];
params(7).save_file_name0 = [params(7).mkdir1 filesep params(7).paradigm '_results'];
params(7).save_file_name1 = [params(7).mkdir2 filesep params(7).paradigm '_results_shuff_run_'];

% LGN both + generalization (4 of 4: ambiguous vs. ambiguous)
params(8).mkdir1 = 'results_generalization_LGN_ambiguous-ambiguous';
params(8).mkdir2 = [params(8).mkdir1 filesep 'shuff'];
params(8).specific_binned_labels_names = 'condition_disap';
params(8).the_training_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
params(8).the_test_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
params(8).paradigm = 'Binned_data_LGN_both_250ms_bins_50ms';
params(8).binned_data_file_name = [params(8).paradigm '_sampled.mat'];
params(8).save_file_name0 = [params(8).mkdir1 filesep params(8).paradigm '_results'];
params(8).save_file_name1 = [params(8).mkdir2 filesep params(8).paradigm '_results_shuff_run_'];


% V4 both + generalization (1 of 4: physical vs. physical)
params(9).mkdir1 = 'results_generalization_V4_physical-physical';
params(9).mkdir2 = [params(9).mkdir1 filesep 'shuff'];
params(9).specific_binned_labels_names = 'condition_disap';
params(9).the_training_label_names = {{'disap_physical'}, {'nodisap_physical'}};
params(9).the_test_label_names = {{'disap_physical'}, {'nodisap_physical'}};
params(9).paradigm = 'Binned_data_V4_both_250ms_bins_50ms';
params(9).binned_data_file_name = [params(9).paradigm '_sampled.mat'];
params(9).save_file_name0 = [params(9).mkdir1 filesep params(9).paradigm '_results'];
params(9).save_file_name1 = [params(9).mkdir2 filesep params(9).paradigm '_results_shuff_run_'];

% V4 both + generalization (2 of 4: physical vs. ambiguous)
params(10).mkdir1 = 'results_generalization_V4_physical-ambiguous';
params(10).mkdir2 = [params(10).mkdir1 filesep 'shuff'];
params(10).specific_binned_labels_names = 'condition_disap';
params(10).the_training_label_names = {{'disap_physical'}, {'nodisap_physical'}};
params(10).the_test_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
params(10).paradigm = 'Binned_data_V4_both_250ms_bins_50ms';
params(10).binned_data_file_name = [params(10).paradigm '_sampled.mat'];
params(10).save_file_name0 = [params(10).mkdir1 filesep params(10).paradigm '_results'];
params(10).save_file_name1 = [params(10).mkdir2 filesep params(10).paradigm '_results_shuff_run_'];

% V4 both + generalization (3 of 4: ambiguous vs. physical)
params(11).mkdir1 = 'results_generalization_V4_ambiguous-physical';
params(11).mkdir2 = [params(11).mkdir1 filesep 'shuff'];
params(11).specific_binned_labels_names = 'condition_disap';
params(11).the_training_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
params(11).the_test_label_names = {{'disap_physical'}, {'nodisap_physical'}};
params(11).paradigm = 'Binned_data_V4_both_250ms_bins_50ms';
params(11).binned_data_file_name = [params(11).paradigm '_sampled.mat'];
params(11).save_file_name0 = [params(11).mkdir1 filesep params(11).paradigm '_results'];
params(11).save_file_name1 = [params(11).mkdir2 filesep params(11).paradigm '_results_shuff_run_'];

% V4 both + generalization (4 of 4: ambiguous vs. ambiguous)
params(12).mkdir1 = 'results_generalization_V4_ambiguous-ambiguous';
params(12).mkdir2 = [params(12).mkdir1 filesep 'shuff'];
params(12).specific_binned_labels_names = 'condition_disap';
params(12).the_training_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
params(12).the_test_label_names = {{'disap_ambiguous'}, {'nodisap_ambiguous'}};
params(12).paradigm = 'Binned_data_V4_both_250ms_bins_50ms';
params(12).binned_data_file_name = [params(12).paradigm '_sampled.mat'];
params(12).save_file_name0 = [params(12).mkdir1 filesep params(12).paradigm '_results'];
params(12).save_file_name1 = [params(12).mkdir2 filesep params(12).paradigm '_results_shuff_run_'];

% pulvinar ambiguous
params(13).mkdir1 = 'results_pulvinar_ambiguous';
params(13).mkdir2 = [params(13).mkdir1 '/shuff'];
params(13).specific_binned_labels_names = 'disap_nodisap';
params(13).paradigm = 'Binned_data_pulvinar_ambiguous_250ms_bins_50ms';
params(13).binned_data_file_name = [params(13).paradigm '_sampled.mat'];
params(13).save_file_name0 = [params(13).mkdir1 '/' params(13).paradigm '_results'];
params(13).save_file_name1 = [params(13).mkdir2 '/' params(13).paradigm '_results_shuff_run_'];

% V4 ambiguous
params(14).mkdir1 = 'results_V4_ambiguous';
params(14).mkdir2 = [params(14).mkdir1 '/shuff'];
params(14).specific_binned_labels_names = 'disap_nodisap';
params(14).paradigm = 'Binned_data_V4_ambiguous_250ms_bins_50ms';
params(14).binned_data_file_name = [params(14).paradigm '_sampled.mat'];
params(14).save_file_name0 = [params(14).mkdir1 '/' params(14).paradigm '_results'];
params(14).save_file_name1 = [params(14).mkdir2 '/' params(14).paradigm '_results_shuff_run_'];

% LGN ambiguous
params(15).mkdir1 = 'results_LGN_ambiguous';
params(15).mkdir2 = [params(15).mkdir1 '/shuff'];
params(15).specific_binned_labels_names = 'disap_nodisap';
params(15).paradigm = 'Binned_data_LGN_ambiguous_250ms_bins_50ms';
params(15).binned_data_file_name = [params(15).paradigm '_sampled.mat'];
params(15).save_file_name0 = [params(15).mkdir1 '/' params(15).paradigm '_results'];
params(15).save_file_name1 = [params(15).mkdir2 '/' params(15).paradigm '_results_shuff_run_'];

% pulvinar ambiguous
params(16).mkdir1 = 'results_pulvinar_ambiguous';
params(16).mkdir2 = [params(16).mkdir1 '/shuff'];
params(16).specific_binned_labels_names = 'disap_nodisap';
params(16).paradigm = 'Binned_data_pulvinar_ambiguous_250ms_bins_50ms';
params(16).binned_data_file_name = [params(16).paradigm '_sampled.mat'];
params(16).save_file_name0 = [params(16).mkdir1 '/' params(16).paradigm '_results'];
params(16).save_file_name1 = [params(16).mkdir2 '/' params(16).paradigm '_results_shuff_run_'];

% pulvinar both, eyemodi = 1
params(17).mkdir1 = 'results_pulvinar_both1';
params(17).mkdir2 = [params(17).mkdir1 '/shuff'];
params(17).specific_binned_labels_names = 'disap_nodisap';
params(17).paradigm = 'Binned_data_pulvinar_both1_250ms_bins_50ms';
params(17).binned_data_file_name = [params(17).paradigm '_sampled.mat'];
params(17).save_file_name0 = [params(17).mkdir1 '/' params(17).paradigm '_results'];
params(17).save_file_name1 = [params(17).mkdir2 '/' params(17).paradigm '_results_shuff_run_'];

% V4 ambiguous
params(18).mkdir1 = 'results_V4_ambiguous';
params(18).mkdir2 = [params(18).mkdir1 '/shuff'];
params(18).specific_binned_labels_names = 'disap_nodisap';
params(18).paradigm = 'Binned_data_V4_ambiguous_250ms_bins_50ms';
params(18).binned_data_file_name = [params(18).paradigm '_sampled.mat'];
params(18).save_file_name0 = [params(18).mkdir1 '/' params(18).paradigm '_results'];
params(18).save_file_name1 = [params(18).mkdir2 '/' params(18).paradigm '_results_shuff_run_'];

% LGN ambiguous
params(19).mkdir1 = 'results_LGN_ambiguous';
params(19).mkdir2 = [params(19).mkdir1 '/shuff'];
params(19).specific_binned_labels_names = 'disap_nodisap';
params(19).paradigm = 'Binned_data_LGN_ambiguous_250ms_bins_50ms';
params(19).binned_data_file_name = [params(19).paradigm '_sampled.mat'];
params(19).save_file_name0 = [params(19).mkdir1 '/' params(19).paradigm '_results'];
params(19).save_file_name1 = [params(19).mkdir2 '/' params(19).paradigm '_results_shuff_run_'];

% pulvinar eye
params(20).mkdir1 = 'results_pulvinar_eye';
params(20).mkdir2 = [params(20).mkdir1 '/shuff'];
params(20).specific_binned_labels_names = 'disap_nodisap';
params(20).paradigm = 'Binned_data_pulvinar_eye_250ms_bins_50ms';
params(20).binned_data_file_name = [params(20).paradigm '_sampled.mat'];
params(20).save_file_name0 = [params(20).mkdir1 '/' params(20).paradigm '_results'];
params(20).save_file_name1 = [params(20).mkdir2 '/' params(20).paradigm '_results_shuff_run_'];

% V4 eye
params(21).mkdir1 = 'results_V4_eye';
params(21).mkdir2 = [params(21).mkdir1 '/shuff'];
params(21).specific_binned_labels_names = 'disap_nodisap';
params(21).paradigm = 'Binned_data_V4_eye_250ms_bins_50ms';
params(21).binned_data_file_name = [params(21).paradigm '_sampled.mat'];
params(21).save_file_name0 = [params(21).mkdir1 '/' params(21).paradigm '_results'];
params(21).save_file_name1 = [params(21).mkdir2 '/' params(21).paradigm '_results_shuff_run_'];

% LGN eye
params(22).mkdir1 = 'results_LGN_eye';
params(22).mkdir2 = [params(22).mkdir1 '/shuff'];
params(22).specific_binned_labels_names = 'disap_nodisap';
params(22).paradigm = 'Binned_data_LGN_eye_250ms_bins_50ms';
params(22).binned_data_file_name = [params(22).paradigm '_sampled.mat'];
params(22).save_file_name0 = [params(22).mkdir1 '/' params(22).paradigm '_results'];
params(22).save_file_name1 = [params(22).mkdir2 '/' params(22).paradigm '_results_shuff_run_'];

% pulvinar target responsive
params(23).mkdir1 = 'results_pulvinar_response';
params(23).mkdir2 = [params(23).mkdir1 '/shuff'];
params(23).specific_binned_labels_names = 'disap_nodisap';
params(23).paradigm = 'Binned_data_pulvinar_response_250ms_bins_50ms';
params(23).binned_data_file_name = [params(23).paradigm '_sampled.mat'];
params(23).save_file_name0 = [params(23).mkdir1 '/' params(23).paradigm '_results'];
params(23).save_file_name1 = [params(23).mkdir2 '/' params(23).paradigm '_results_shuff_run_'];

% pulvinar target non-responsive
params(24).mkdir1 = 'results_pulvinar_noResponse';
params(24).mkdir2 = [params(24).mkdir1 '/shuff'];
params(24).specific_binned_labels_names = 'disap_nodisap';
params(24).paradigm = 'Binned_data_pulvinar_noResponse_250ms_bins_50ms';
params(24).binned_data_file_name = [params(24).paradigm '_sampled.mat'];
params(24).save_file_name0 = [params(24).mkdir1 '/' params(24).paradigm '_results'];
params(24).save_file_name1 = [params(24).mkdir2 '/' params(24).paradigm '_results_shuff_run_'];

% below are half/half datasets for the pulvinar
% pulvinar half1_1 
params(25).mkdir1 = 'results_pulvinar_ambiguous_half1_1';
params(25).mkdir2 = [params(25).mkdir1 '/shuff'];
params(25).specific_binned_labels_names = 'disap_nodisap';
params(25).paradigm = 'Binned_data_pulvinar_ambiguous_half1_1_250ms_bins_50ms';
params(25).binned_data_file_name = [params(25).paradigm '_sampled.mat'];
params(25).save_file_name0 = [params(25).mkdir1 '/' params(25).paradigm '_results'];
params(25).save_file_name1 = [params(25).mkdir2 '/' params(25).paradigm '_results_shuff_run_'];

% pulvinar half2_1 
params(26).mkdir1 = 'results_pulvinar_ambiguous_half2_1';
params(26).mkdir2 = [params(26).mkdir1 '/shuff'];
params(26).specific_binned_labels_names = 'disap_nodisap';
params(26).paradigm = 'Binned_data_pulvinar_ambiguous_half2_1_250ms_bins_50ms';
params(26).binned_data_file_name = [params(26).paradigm '_sampled.mat'];
params(26).save_file_name0 = [params(26).mkdir1 '/' params(26).paradigm '_results'];
params(26).save_file_name1 = [params(26).mkdir2 '/' params(26).paradigm '_results_shuff_run_'];

% pulvinar half1_2 
params(27).mkdir1 = 'results_pulvinar_ambiguous_half1_2';
params(27).mkdir2 = [params(27).mkdir1 '/shuff'];
params(27).specific_binned_labels_names = 'disap_nodisap';
params(27).paradigm = 'Binned_data_pulvinar_ambiguous_half1_2_250ms_bins_50ms';
params(27).binned_data_file_name = [params(27).paradigm '_sampled.mat'];
params(27).save_file_name0 = [params(27).mkdir1 '/' params(27).paradigm '_results'];
params(27).save_file_name1 = [params(27).mkdir2 '/' params(27).paradigm '_results_shuff_run_'];

% pulvinar half2_2 
params(28).mkdir1 = 'results_pulvinar_ambiguous_half2_2';
params(28).mkdir2 = [params(28).mkdir1 '/shuff'];
params(28).specific_binned_labels_names = 'disap_nodisap';
params(28).paradigm = 'Binned_data_pulvinar_ambiguous_half2_2_250ms_bins_50ms';
params(28).binned_data_file_name = [params(28).paradigm '_sampled.mat'];
params(28).save_file_name0 = [params(28).mkdir1 '/' params(28).paradigm '_results'];
params(28).save_file_name1 = [params(28).mkdir2 '/' params(28).paradigm '_results_shuff_run_'];

% below are half/half datasets for the pulvinar 214 neurons
% pulvinar half1_1 
params(29).mkdir1 = 'results_pulvinar_ambiguous214_half1_1';
params(29).mkdir2 = [params(29).mkdir1 '/shuff'];
params(29).specific_binned_labels_names = 'disap_nodisap';
params(29).paradigm = 'Binned_data_pulvinar_ambiguous214_half1_1_250ms_bins_50ms';
params(29).binned_data_file_name = [params(29).paradigm '_sampled.mat'];
params(29).save_file_name0 = [params(29).mkdir1 '/' params(29).paradigm '_results'];
params(29).save_file_name1 = [params(29).mkdir2 '/' params(29).paradigm '_results_shuff_run_'];

% pulvinar half2_1 
params(30).mkdir1 = 'results_pulvinar_ambiguous214_half2_1';
params(30).mkdir2 = [params(30).mkdir1 '/shuff'];
params(30).specific_binned_labels_names = 'disap_nodisap';
params(30).paradigm = 'Binned_data_pulvinar_ambiguous214_half2_1_250ms_bins_50ms';
params(30).binned_data_file_name = [params(30).paradigm '_sampled.mat'];
params(30).save_file_name0 = [params(30).mkdir1 '/' params(30).paradigm '_results'];
params(30).save_file_name1 = [params(30).mkdir2 '/' params(30).paradigm '_results_shuff_run_'];

% pulvinar half1_2 
params(31).mkdir1 = 'results_pulvinar_ambiguous214_half1_2';
params(31).mkdir2 = [params(31).mkdir1 '/shuff'];
params(31).specific_binned_labels_names = 'disap_nodisap';
params(31).paradigm = 'Binned_data_pulvinar_ambiguous214_half1_2_250ms_bins_50ms';
params(31).binned_data_file_name = [params(31).paradigm '_sampled.mat'];
params(31).save_file_name0 = [params(31).mkdir1 '/' params(31).paradigm '_results'];
params(31).save_file_name1 = [params(31).mkdir2 '/' params(31).paradigm '_results_shuff_run_'];

% pulvinar half2_2 
params(32).mkdir1 = 'results_pulvinar_ambiguous214_half2_2';
params(32).mkdir2 = [params(32).mkdir1 '/shuff'];
params(32).specific_binned_labels_names = 'disap_nodisap';
params(32).paradigm = 'Binned_data_pulvinar_ambiguous214_half2_2_250ms_bins_50ms';
params(32).binned_data_file_name = [params(32).paradigm '_sampled.mat'];
params(32).save_file_name0 = [params(32).mkdir1 '/' params(32).paradigm '_results'];
params(32).save_file_name1 = [params(32).mkdir2 '/' params(32).paradigm '_results_shuff_run_'];

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
            
        run_basic_decoding_shuff_pulvinar(i, params(parNum));
    end
    
end
