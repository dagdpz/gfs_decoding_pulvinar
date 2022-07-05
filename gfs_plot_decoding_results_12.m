clear all, close all

% look for files with decoding results
flList = dir('Results_*.mat');

datalist(1).filename = 'results_LGN_ambiguous\Binned_data_LGN_ambiguous_250ms_bins_50ms_results.mat';
datalist(1).pvalues = 'results_LGN_ambiguous\shuff\';


datalist(2).filename = 'results_generalization_LGN_ambiguous-ambiguous\Binned_data_LGN_both_250ms_bins_50ms_results.mat';
datalist(2).pvalues = 'results_generalization_LGN_ambiguous-ambiguous\shuff\';

datalist(3).filename = 'results_generalization_LGN_ambiguous-physical\Binned_data_LGN_both_250ms_bins_50ms_results.mat';
datalist(3).pvalues = 'results_generalization_LGN_ambiguous-physical\shuff\';

datalist(4).filename = 'results_generalization_LGN_physical-ambiguous\Binned_data_LGN_both_250ms_bins_50ms_results.mat';
datalist(4).pvalues = 'results_generalization_LGN_physical-ambiguous\shuff\';

datalist(5).filename = 'results_generalization_LGN_physical-physical\Binned_data_LGN_both_250ms_bins_50ms_results.mat';
datalist(5).pvalues = 'results_generalization_LGN_physical-physical\shuff\';


datalist(6).filename = 'results_LGN_eye\Binned_data_LGN_eye_250ms_bins_50ms_results.mat';
datalist(6).pvalues = 'results_LGN_eye\shuff\';

datalist(7).filename = 'results_pulvinar_ambiguous\Binned_data_pulvinar_ambiguous_250ms_bins_50ms_results.mat';
datalist(7).pvalues = 'results_pulvinar_ambiguous\shuff\';


datalist(8).filename = 'results_generalization_pulvinar_ambiguous-ambiguous\Binned_data_pulvinar_both_250ms_bins_50ms_results.mat';
datalist(8).pvalues = 'results_generalization_pulvinar_ambiguous-ambiguous\shuff\';

datalist(9).filename = 'results_generalization_pulvinar_ambiguous-physical\Binned_data_pulvinar_both_250ms_bins_50ms_results.mat';
datalist(9).pvalues = 'results_generalization_pulvinar_ambiguous-physical\shuff\';

datalist(10).filename = 'results_generalization_pulvinar_physical-ambiguous\Binned_data_pulvinar_both_250ms_bins_50ms_results.mat';
datalist(10).pvalues = 'results_generalization_pulvinar_physical-ambiguous\shuff\';

datalist(11).filename = 'results_generalization_pulvinar_physical-physical\Binned_data_pulvinar_both_250ms_bins_50ms_results.mat';
datalist(11).pvalues = 'results_generalization_pulvinar_physical-physical\shuff\';


datalist(12).filename = 'results_pulvinar_eye\Binned_data_pulvinar_eye_250ms_bins_50ms_results.mat';
datalist(12).pvalues = 'results_pulvinar_eye\shuff\';

datalist(13).filename = 'results_V4_ambiguous\Binned_data_V4_ambiguous_250ms_bins_50ms_results.mat';
datalist(13).pvalues = 'results_V4_ambiguous\shuff\';


datalist(14).filename = 'results_generalization_V4_ambiguous-ambiguous\Binned_data_V4_both_250ms_bins_50ms_results.mat';
datalist(14).pvalues = 'results_generalization_V4_ambiguous-ambiguous\shuff\';

datalist(15).filename = 'results_generalization_V4_ambiguous-physical\Binned_data_V4_both_250ms_bins_50ms_results.mat';
datalist(15).pvalues = 'results_generalization_V4_ambiguous-physical\shuff\';

datalist(16).filename = 'results_generalization_V4_physical-ambiguous\Binned_data_V4_both_250ms_bins_50ms_results.mat';
datalist(16).pvalues = 'results_generalization_V4_physical-ambiguous\shuff\';

datalist(17).filename = 'results_generalization_V4_physical-physical\Binned_data_V4_both_250ms_bins_50ms_results.mat';
datalist(17).pvalues = 'results_generalization_V4_physical-physical\shuff\';


datalist(18).filename = 'results_V4_eye\Binned_data_V4_eye_250ms_bins_50ms_results.mat';
datalist(18).pvalues = 'results_V4_eye\shuff\';


datalist(19).filename = 'results_pulvinar_response\Binned_data_pulvinar_response_250ms_bins_50ms_results.mat';
datalist(19).pvalues = 'results_pulvinar_response\shuff\';

datalist(20).filename = 'results_pulvinar_noResponse\Binned_data_pulvinar_noResponse_250ms_bins_50ms_results.mat';
datalist(20).pvalues = 'results_pulvinar_noResponse\shuff\';


datalist(21).filename = 'results_pulvinar_both1\Binned_data_pulvinar_both1_250ms_bins_50ms_results.mat';
datalist(21).pvalues = 'results_pulvinar_both1\shuff\';

% plot ambiguous data decoded in halves
datalist(22).filename = 'results_pulvinar_ambiguous_half1_1\Binned_data_pulvinar_ambiguous_half1_1_250ms_bins_50ms_results.mat';
datalist(22).pvalues = 'results_pulvinar_ambiguous_half1_1\shuff\';

datalist(23).filename = 'results_pulvinar_ambiguous_half1_2\Binned_data_pulvinar_ambiguous_half1_2_250ms_bins_50ms_results.mat';
datalist(23).pvalues = 'results_pulvinar_ambiguous_half1_2\shuff\';

datalist(24).filename = 'results_pulvinar_ambiguous_half2_1\Binned_data_pulvinar_ambiguous_half2_1_250ms_bins_50ms_results.mat';
datalist(24).pvalues = 'results_pulvinar_ambiguous_half2_1\shuff\';

datalist(25).filename = 'results_pulvinar_ambiguous_half2_2\Binned_data_pulvinar_ambiguous_half2_2_250ms_bins_50ms_results.mat';
datalist(25).pvalues = 'results_pulvinar_ambiguous_half2_2\shuff\';

% plot ambiguous data 214 decoded in halves
datalist(26).filename = 'results_pulvinar_ambiguous214_half1_1\Binned_data_pulvinar_ambiguous214_half1_1_250ms_bins_50ms_results.mat';
datalist(26).pvalues = 'results_pulvinar_ambiguous214_half1_1\shuff\';

datalist(27).filename = 'results_pulvinar_ambiguous214_half1_2\Binned_data_pulvinar_ambiguous214_half1_2_250ms_bins_50ms_results.mat';
datalist(27).pvalues = 'results_pulvinar_ambiguous214_half1_2\shuff\';

datalist(28).filename = 'results_pulvinar_ambiguous214_half2_1\Binned_data_pulvinar_ambiguous214_half2_1_250ms_bins_50ms_results.mat';
datalist(28).pvalues = 'results_pulvinar_ambiguous214_half2_1\shuff\';

datalist(29).filename = 'results_pulvinar_ambiguous214_half2_2\Binned_data_pulvinar_ambiguous214_half2_2_250ms_bins_50ms_results.mat';
datalist(29).pvalues = 'results_pulvinar_ambiguous214_half2_2\shuff\';

% loop through files with decoding results

for flNum = 26:length(datalist)
    
    disp(['Plotting ' datalist(flNum).filename ' results'])
    
    figure,
    result_names{1} = datalist(flNum).filename;
    plot_obj = plot_standard_results_object(result_names);
    pval_dir_name{1} = datalist(flNum).pvalues;
    plot_obj.p_values = pval_dir_name;
    plot_obj.collapse_all_times_when_estimating_pvals = 0;
    plot_obj.plot_results;
    
    ylim([0 100])
    
    xline([1500, 3000, 5000]) % fixation acquired, target onset, surround onset
    box on
    legend('off')
%     figure
%     % create the plot results object
%     % note that this object takes a string in its constructor not a cell array
%     plot_obj = plot_standard_results_TCT_object(save_file_name);
%     
%     % put a line at the time when the stimulus was shown
%     plot_obj.significant_event_times = [1500, 3000, 5000];
%     
%     % display the results
%     plot_obj.plot_results;
%     ylim([0 100])
%     caxis([0 100])
    
    close all
    
end
