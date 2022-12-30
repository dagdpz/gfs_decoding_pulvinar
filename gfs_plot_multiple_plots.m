clear all, close all
% This script is a template to plot multiple decoding time courses with 
% significance in the same axes.
% You can create new sections for your plots and use them separately.
% For unput use NDT result files:
% result_names - requires a mat file with decoding results
% pval_dir_name - requires a path to decoding results from reshuffled data

%% plot decoding results from alpha-band in LGN, V4, pulvinar
result_names = ...
    {'Results_LGN_ambiguous_alpha_250ms_bins_50ms_sampled', ...
    'Results_V4_ambiguous_alpha_250ms_bins_50ms_sampled', ...
    'Results_pulvinar_ambiguous_alpha_250ms_bins_50ms_sampled'};

plot_obj = plot_standard_results_object(result_names);

pval_dir_name = ...
    {'results_LGN_ambiguous_alpha\shuff\', ...
    'results_V4_ambiguous_alpha\shuff\', ...
    'results_pulvinar_ambiguous_alpha\shuff\'};

plot_obj.p_values = pval_dir_name;

plot_obj.legend_names = {'LGN', 'V4', 'pulvinar'};

plot_obj.collapse_all_times_when_estimating_pvals = 0;

figure,
plot_obj.plot_results;

ylim([0 100])
xline(1500)
xline(3000)
xline(5000)

l = legend('Location', 'Best');
l.String(4:end) = [];

box on


%% plot decoding results from beta-band in LGN, V4, pulvinar
result_names = ...
    {'Results_LGN_ambiguous_beta_250ms_bins_50ms_sampled', ...
    'Results_V4_ambiguous_beta_250ms_bins_50ms_sampled', ...
    'Results_pulvinar_ambiguous_beta_250ms_bins_50ms_sampled'};

plot_obj = plot_standard_results_object(result_names);

pval_dir_name = {'results_LGN_ambiguous_beta\shuff\', ...
    'results_V4_ambiguous_beta\shuff\', ...
    'results_pulvinar_ambiguous_beta\shuff\'};

plot_obj.p_values = pval_dir_name;

plot_obj.legend_names = {'LGN', 'V4', 'pulvinar'};

plot_obj.collapse_all_times_when_estimating_pvals = 0;

figure,
plot_obj.plot_results;

ylim([0 100])
xline(1500)
xline(3000)
xline(5000)

l = legend('Location', 'Best');
l.String(4:end) = [];

box on


%% plot decoding results from alpha-band in LGN, V4, pulvinar - BLP channels are matched with unit channels
result_names = ...
    {'results_LGN_matchUnits_ambiguous_alpha_cvsplits14\Binned_data_LGN_matchUnits_ambiguous_alpha_250ms_bins_50ms_results', ...
    'results_V4_matchUnits_ambiguous_alpha_cvsplits14\Binned_data_V4_matchUnits_ambiguous_alpha_250ms_bins_50ms_results', ...
    'results_pulvinar_matchUnits_ambiguous_alpha_cvsplits14\Binned_data_pulvinar_matchUnits_ambiguous_alpha_250ms_bins_50ms_results'};

plot_obj = plot_standard_results_object(result_names);

pval_dir_name = ...
    {'results_LGN_matchUnits_ambiguous_alpha_cvsplits14\shuff\', ...
    'results_V4_matchUnits_ambiguous_alpha_cvsplits14\shuff\', ...
    'results_pulvinar_matchUnits_ambiguous_alpha_cvsplits14\shuff\'};

plot_obj.p_values = pval_dir_name;

plot_obj.legend_names = {'LGN', 'V4', 'pulvinar'};

plot_obj.collapse_all_times_when_estimating_pvals = 0;

figure,
plot_obj.plot_results;

ylim([0 100])
xline(1500)
xline(3000)
xline(5000)

l = legend('Location', 'Best');
l.String(4:end) = [];

box on


%% plot decoding results from beta-band in LGN, V4, pulvinar - BLP channels are matched with unit channels
result_names = ...
    {'results_LGN_matchUnits_ambiguous_beta_cvsplits14\Binned_data_LGN_matchUnits_ambiguous_beta_250ms_bins_50ms_results', ...
    'results_V4_matchUnits_ambiguous_beta_cvsplits14\Binned_data_V4_matchUnits_ambiguous_beta_250ms_bins_50ms_results', ...
    'results_pulvinar_matchUnits_ambiguous_beta_cvsplits14\Binned_data_pulvinar_matchUnits_ambiguous_beta_250ms_bins_50ms_results'};

plot_obj = plot_standard_results_object(result_names);

pval_dir_name = ...
    {'results_LGN_matchUnits_ambiguous_beta_cvsplits14\shuff\', ...
    'results_V4_matchUnits_ambiguous_beta_cvsplits14\shuff\', ...
    'results_pulvinar_matchUnits_ambiguous_beta_cvsplits14\shuff\'};

plot_obj.p_values = pval_dir_name;

plot_obj.legend_names = {'LGN', 'V4', 'pulvinar'};

plot_obj.collapse_all_times_when_estimating_pvals = 0;

figure,
plot_obj.plot_results;

ylim([0 100])
xline(1500)
xline(3000)
xline(5000)

l = legend('Location', 'Best');
l.String(4:end) = [];

box on

%% plot decoding results from gamma1-band in LGN, V4, pulvinar - BLP channels are matched with unit channels
result_names = ...
    {'results_LGN_matchUnits_ambiguous_gamma1_cvsplits14\Binned_data_LGN_matchUnits_ambiguous_gamma1_250ms_bins_50ms_results', ...
    'results_V4_matchUnits_ambiguous_gamma1_cvsplits14\Binned_data_V4_matchUnits_ambiguous_gamma1_250ms_bins_50ms_results', ...
    'results_pulvinar_matchUnits_ambiguous_gamma1_cvsplits14\Binned_data_pulvinar_matchUnits_ambiguous_gamma1_250ms_bins_50ms_results'};

plot_obj = plot_standard_results_object(result_names);

pval_dir_name = ...
    {'results_LGN_matchUnits_ambiguous_gamma1_cvsplits14\shuff\', ...
    'results_V4_matchUnits_ambiguous_gamma1_cvsplits14\shuff\', ...
    'results_pulvinar_matchUnits_ambiguous_gamma1_cvsplits14\shuff\'};

plot_obj.p_values = pval_dir_name;

plot_obj.legend_names = {'LGN', 'V4', 'pulvinar'};

plot_obj.collapse_all_times_when_estimating_pvals = 0;

figure,
plot_obj.plot_results;

ylim([0 100])
xline(1500)
xline(3000)
xline(5000)

l = legend('Location', 'Best');
l.String(4:end) = [];

box on

%% plot decoding results from gamma2-band in LGN, V4, pulvinar - BLP channels are matched with unit channels
result_names = ...
    {'results_LGN_matchUnits_ambiguous_gamma2_cvsplits14\Binned_data_LGN_matchUnits_ambiguous_gamma2_250ms_bins_50ms_results', ...
    'results_V4_matchUnits_ambiguous_gamma2_cvsplits14\Binned_data_V4_matchUnits_ambiguous_gamma2_250ms_bins_50ms_results', ...
    'results_pulvinar_matchUnits_ambiguous_gamma2_cvsplits14\Binned_data_pulvinar_matchUnits_ambiguous_gamma2_250ms_bins_50ms_results'};

plot_obj = plot_standard_results_object(result_names);

pval_dir_name = ...
    {'results_LGN_matchUnits_ambiguous_gamma2_cvsplits14\shuff\', ...
    'results_V4_matchUnits_ambiguous_gamma2_cvsplits14\shuff\', ...
    'results_pulvinar_matchUnits_ambiguous_gamma2_cvsplits14\shuff\'};

plot_obj.p_values = pval_dir_name;

plot_obj.legend_names = {'LGN', 'V4', 'pulvinar'};

plot_obj.collapse_all_times_when_estimating_pvals = 0;

figure,
plot_obj.plot_results;

ylim([0 100])
xline(1500)
xline(3000)
xline(5000)

l = legend('Location', 'Best');
l.String(4:end) = [];

box on

%% LGN ALPHA: plot RT-aligned data vs. the initial data - physical-physical

result_names = ...
    {'results_LGN_matchUnits_ambiguous_alpha_cvsplits14\Binned_data_LGN_matchUnits_ambiguous_alpha_250ms_bins_50ms_results', ...
    'results_generalization_LGN_RTaligned_matchUnits_alpha_physical-physical\Binned_data_LGN_RTaligned_matchUnits_both_alpha_250ms_bins_50ms_results'};

plot_obj = plot_standard_results_object(result_names);

pval_dir_name = ...
    {'results_LGN_matchUnits_ambiguous_alpha_cvsplits14\shuff\', ...
    'results_generalization_LGN_RTaligned_matchUnits_alpha_physical-physical\shuff\'};

plot_obj.p_values = pval_dir_name;

plot_obj.legend_names = {'original', 'RT-aligned'};

plot_obj.collapse_all_times_when_estimating_pvals = 0;

figure,
plot_obj.plot_results;

ylim([0 100])
xline(1500)
xline(3000)
xline(5000)

l = legend('Location', 'Best');
l.String(3:end) = [];

title('Physical: RT-aligned vs. original')

box on
