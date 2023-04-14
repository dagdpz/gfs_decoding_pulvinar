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

%% SPIKES: plot RT-aligned data vs. the initial data

areas = {'pulvinar', 'V4', 'LGN'};

decoding_types = {'physical-physical', 'physical-ambiguous', 'ambiguous-physical', 'ambiguous-ambiguous'};

for areaNum = 1:length(areas)
    
    disp(['Plotting data for ' areas{areaNum}])
    
    for ii = 1:length(decoding_types)
        
        result_names = ...
            {['results_generalization_' areas{areaNum} '_matchUnits_spk_' decoding_types{ii} '\Binned_data_' areas{areaNum} '_matchUnits_both_spk_250ms_bins_50ms_results'], ...
            ['results_generalization_' areas{areaNum} '_RTaligned_matchUnits_spk_' decoding_types{ii} '\Binned_data_' areas{areaNum} '_RTaligned_matchUnits_both_spk_250ms_bins_50ms_results']};
        
        plot_obj = plot_standard_results_object(result_names);
        
        pval_dir_name = ...
            {['results_generalization_' areas{areaNum} '_matchUnits_spk_' decoding_types{ii} '\shuff\'], ...
            ['results_generalization_' areas{areaNum} '_RTaligned_matchUnits_spk_' decoding_types{ii} '\shuff\']};
        
        plot_obj.p_values = pval_dir_name;
        
        plot_obj.legend_names = {'original', 'RT-aligned'};
        
        plot_obj.collapse_all_times_when_estimating_pvals = 0;
        
        subplot(2,2,ii)
        plot_obj.plot_results;
        
        ylim([0 100])
        xline(1500)
        xline(3000)
        xline(5000)
        line([5350 5350], [0 100], 'Color', 'red', 'LineStyle', '--')
        
        l = legend('Location', 'Best');
        l.String(3:end) = [];
        
        title(decoding_types{ii})
        
        box on
        
    end
    
end

%% ALPHA: plot RT-aligned data vs. the initial data

areas = {'pulvinar', 'V4', 'LGN'};

decoding_types = {'physical-physical', 'physical-ambiguous', 'ambiguous-physical', 'ambiguous-ambiguous'};

for areaNum = 1:length(areas)
    
    disp(['Plotting data for ' areas{areaNum}])
    
    for ii = 1:length(decoding_types)
        
        result_names = ...
            {['results_generalization_' areas{areaNum} '_matchUnits_alpha_' decoding_types{ii} '\Binned_data_' areas{areaNum} '_matchUnits_both_alpha_250ms_bins_50ms_results'], ...
            ['results_generalization_' areas{areaNum} '_RTaligned_matchUnits_alpha_' decoding_types{ii} '\Binned_data_' areas{areaNum} '_RTaligned_matchUnits_both_alpha_250ms_bins_50ms_results']};
        
        plot_obj = plot_standard_results_object(result_names);
        
        pval_dir_name = ...
            {['results_generalization_' areas{areaNum} '_matchUnits_alpha_' decoding_types{ii} '\shuff\'], ...
            ['results_generalization_' areas{areaNum} '_RTaligned_matchUnits_alpha_' decoding_types{ii} '\shuff\']};
        
        plot_obj.p_values = pval_dir_name;
        
        plot_obj.legend_names = {'original', 'RT-aligned'};
        
        plot_obj.collapse_all_times_when_estimating_pvals = 0;
        
        subplot(2,2,ii)
        plot_obj.plot_results;
        
        ylim([0 100])
        xline(1500)
        xline(3000)
        xline(5000)
        line([5350 5350], [0 100], 'Color', 'red', 'LineStyle', '--')
        
        l = legend('Location', 'Best');
        l.String(3:end) = [];
        
        title(decoding_types{ii})
        
        box on
        
    end
    
end


%% BETA: plot RT-aligned data vs. the initial data

areas = {'pulvinar', 'V4', 'LGN'};

decoding_types = {'physical-physical', 'physical-ambiguous', 'ambiguous-physical', 'ambiguous-ambiguous'};

for areaNum = 1:length(areas)
    
    disp(['Plotting data for ' areas{areaNum}])
    
    for ii = 1:length(decoding_types)
        
        result_names = ...
            {['results_generalization_' areas{areaNum} '_matchUnits_beta_' decoding_types{ii} '\Binned_data_' areas{areaNum} '_matchUnits_both_beta_250ms_bins_50ms_results'], ...
            ['results_generalization_' areas{areaNum} '_RTaligned_matchUnits_beta_' decoding_types{ii} '\Binned_data_' areas{areaNum} '_RTaligned_matchUnits_both_beta_250ms_bins_50ms_results']};
        
        plot_obj = plot_standard_results_object(result_names);
        
        pval_dir_name = ...
            {['results_generalization_' areas{areaNum} '_matchUnits_beta_' decoding_types{ii} '\shuff\'], ...
            ['results_generalization_' areas{areaNum} '_RTaligned_matchUnits_beta_' decoding_types{ii} '\shuff\']};
        
        plot_obj.p_values = pval_dir_name;
        
        plot_obj.legend_names = {'original', 'RT-aligned'};
        
        plot_obj.collapse_all_times_when_estimating_pvals = 0;
        
        subplot(2,2,ii)
        plot_obj.plot_results;
        
        ylim([0 100])
        xline(1500)
        xline(3000)
        xline(5000)
        line([5350 5350], [0 100], 'Color', 'red', 'LineStyle', '--')
        
        l = legend('Location', 'Best');
        l.String(3:end) = [];
        
        title(decoding_types{ii})
        
        box on
        
    end
    
end

%% GAMMA1: plot RT-aligned data vs. the initial data

areas = {'pulvinar', 'V4', 'LGN'};

decoding_types = {'physical-physical', 'physical-ambiguous', 'ambiguous-physical', 'ambiguous-ambiguous'};

for areaNum = 2:length(areas)
    
    disp(['Plotting data for ' areas{areaNum}])
    
    for ii = 1:length(decoding_types)
        
        result_names = ...
            {['results_generalization_' areas{areaNum} '_matchUnits_gamma1_' decoding_types{ii} '\Binned_data_' areas{areaNum} '_matchUnits_both_gamma1_250ms_bins_50ms_results'], ...
            ['results_generalization_' areas{areaNum} '_RTaligned_matchUnits_gamma1_' decoding_types{ii} '\Binned_data_' areas{areaNum} '_RTaligned_matchUnits_both_gamma1_250ms_bins_50ms_results']};
        
        plot_obj = plot_standard_results_object(result_names);
        
        pval_dir_name = ...
            {['results_generalization_' areas{areaNum} '_matchUnits_gamma1_' decoding_types{ii} '\shuff\'], ...
            ['results_generalization_' areas{areaNum} '_RTaligned_matchUnits_gamma1_' decoding_types{ii} '\shuff\']};
        
        plot_obj.p_values = pval_dir_name;
        
        plot_obj.legend_names = {'original', 'RT-aligned'};
        
        plot_obj.collapse_all_times_when_estimating_pvals = 0;
        
        subplot(2,2,ii)
        plot_obj.plot_results;
        
        ylim([0 100])
        xline(1500)
        xline(3000)
        xline(5000)
        line([5350 5350], [0 100], 'Color', 'red', 'LineStyle', '--')
        
        l = legend('Location', 'Best');
        l.String(3:end) = [];
        
        title(decoding_types{ii})
        
        box on
        
    end
    
end

%% reproduce decoding from pulvinar ambiguous

result_names = ...
    {'results_pulvinar_matchUnits_ambiguous_spk_cvsplits14_1\Binned_data_pulvinar_matchUnits_ambiguous_spk_250ms_bins_50ms_results', ...
    'results_pulvinar_matchUnits_ambiguous_spk_cvsplits14_2\Binned_data_pulvinar_matchUnits_ambiguous_spk_250ms_bins_50ms_results', ...
    'results_pulvinar_matchUnits_ambiguous_spk_cvsplits14_3\Binned_data_pulvinar_matchUnits_ambiguous_spk_250ms_bins_50ms_results'};

plot_obj = plot_standard_results_object(result_names);

pval_dir_name = ...
    {'results_pulvinar_matchUnits_ambiguous_spk_cvsplits14_1\shuff\', ...
    'results_pulvinar_matchUnits_ambiguous_spk_cvsplits14_2\shuff\', ...
    'results_pulvinar_matchUnits_ambiguous_spk_cvsplits14_3\shuff\'};

plot_obj.p_values = pval_dir_name;

plot_obj.legend_names = {'Decoding #1', 'Decoding #2', 'Decoding #3'};

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

%% plot Tuebingen ambiguous data

result_names = ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V1_ambiguous_mua_cvsplits14_1\Results_V1_ambiguous_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V2_ambiguous_mua_cvsplits14_1\Results_V2_ambiguous_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V4_ambiguous_mua_cvsplits14_1\Results_V4_ambiguous_cvsplits14_mua_250ms_bins_50ms_results'};

plot_obj = plot_standard_results_object(result_names);

pval_dir_name = ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V1_ambiguous_mua_cvsplits14_1\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V2_ambiguous_mua_cvsplits14_1\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V4_ambiguous_mua_cvsplits14_1\shuff\'};

plot_obj.p_values = pval_dir_name;

plot_obj.legend_names = {'V1', 'V2', 'V4'};

plot_obj.collapse_all_times_when_estimating_pvals = 0;

figure,
plot_obj.plot_results;

ylim([0 100])
xline(800)
xline(2400)

l = legend('Location', 'Best');
l.String(4:end) = [];

box on

%% plot Tuebingen V1 data results

result_names = ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_physical-physical\Binned_data_V1_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_physical-ambiguous\Binned_data_V1_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_ambiguous-physical\Binned_data_V1_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_ambiguous-ambiguous\Binned_data_V1_both_cvsplits14_mua_250ms_bins_50ms_results'};

plot_obj = plot_standard_results_object(result_names);

pval_dir_name = ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_physical-physical\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_physical-ambiguous\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_ambiguous-physical\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_ambiguous-ambiguous\shuff\'};

plot_obj.p_values = pval_dir_name;

plot_obj.legend_names = ...
    {'physical-physical', 'physical-ambiguous', ...
    'ambiguous-physical', 'ambiguous-ambiguous'};

plot_obj.collapse_all_times_when_estimating_pvals = 0;

figure,
plot_obj.plot_results;

ylim([0 100])
xline(800)
xline(2400)

l = legend('Location', 'Best');
l.String(5:end) = [];

box on

%% plot Tuebingen V2 data results

result_names = ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_physical-physical\Binned_data_V2_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_physical-ambiguous\Binned_data_V2_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_ambiguous-physical\Binned_data_V2_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_ambiguous-ambiguous\Binned_data_V2_both_cvsplits14_mua_250ms_bins_50ms_results'};

plot_obj = plot_standard_results_object(result_names);

pval_dir_name = ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_physical-physical\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_physical-ambiguous\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_ambiguous-physical\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_ambiguous-ambiguous\shuff\'};

plot_obj.p_values = pval_dir_name;

plot_obj.legend_names = ...
    {'physical-physical', 'physical-ambiguous', ...
    'ambiguous-physical', 'ambiguous-ambiguous'};

plot_obj.collapse_all_times_when_estimating_pvals = 0;

figure,
plot_obj.plot_results;

ylim([0 100])
xline(800)
xline(2400)

l = legend('Location', 'Best');
l.String(5:end) = [];

box on

%% plot Tuebingen V4 data results

result_names = ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_physical-physical\Binned_data_V4_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_physical-ambiguous\Binned_data_V4_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_ambiguous-physical\Binned_data_V4_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_ambiguous-ambiguous\Binned_data_V4_both_cvsplits14_mua_250ms_bins_50ms_results'};

plot_obj = plot_standard_results_object(result_names);

pval_dir_name = ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_physical-physical\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_physical-ambiguous\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_ambiguous-physical\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_ambiguous-ambiguous\shuff\'};

plot_obj.p_values = pval_dir_name;

plot_obj.legend_names = ...
    {'physical-physical', 'physical-ambiguous', ...
    'ambiguous-physical', 'ambiguous-ambiguous'};

plot_obj.collapse_all_times_when_estimating_pvals = 0;

figure,
plot_obj.plot_results;

ylim([0 100])
xline(800)
xline(2400)

l = legend('Location', 'Best');
l.String(5:end) = [];

box on

%% plot Tuebingen data V1, V2, V4 data results

result_names = ...
    {{'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_physical-physical\Binned_data_V1_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_physical-physical\Binned_data_V2_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_physical-physical\Binned_data_V4_both_cvsplits14_mua_250ms_bins_50ms_results'}, ...
    ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_physical-ambiguous\Binned_data_V1_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_physical-ambiguous\Binned_data_V2_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_physical-ambiguous\Binned_data_V4_both_cvsplits14_mua_250ms_bins_50ms_results'}, ...
    ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_ambiguous-physical\Binned_data_V1_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_ambiguous-physical\Binned_data_V2_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_ambiguous-physical\Binned_data_V4_both_cvsplits14_mua_250ms_bins_50ms_results'}, ...
    ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_ambiguous-ambiguous\Binned_data_V1_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_ambiguous-ambiguous\Binned_data_V2_both_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_ambiguous-ambiguous\Binned_data_V4_both_cvsplits14_mua_250ms_bins_50ms_results'}};

pval_dir_name = ...
    {{'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_physical-physical\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_physical-physical\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_physical-physical\shuff\'}, ...
    ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_physical-ambiguous\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_physical-ambiguous\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_physical-ambiguous\shuff\'}, ...
    ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_ambiguous-physical\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_ambiguous-physical\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_ambiguous-physical\shuff\'}, ...
    ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V1_mua_ambiguous-ambiguous\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V2_mua_ambiguous-ambiguous\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_V4_mua_ambiguous-ambiguous\shuff\'}};

figure,
for splotNum = 1:4
    
    plot_obj = plot_standard_results_object(result_names{splotNum});
    
    plot_obj.p_values = pval_dir_name{splotNum};
    
    plot_obj.legend_names = {'V1', 'V2', 'V4'};
    
    subplot(2, 2, splotNum)
    
    plot_obj.collapse_all_times_when_estimating_pvals = 0;
    
    plot_obj.plot_results;
    
    ylim([0 100])
    xline(800)
    xline(2400)
    
    l = legend('Location', 'Best');
    l.String(4:end) = [];
    
    box on
    
end

%% plot repetitive decoding from V4 Tuebingen

result_names = ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V4_ambiguous_mua_cvsplits14_1\Binned_data_V4_ambiguous_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V4_ambiguous_mua_cvsplits14_2\Binned_data_V4_ambiguous_cvsplits14_mua_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V4_ambiguous_mua_cvsplits14_3\Binned_data_V4_ambiguous_cvsplits14_mua_250ms_bins_50ms_results'};

plot_obj = plot_standard_results_object(result_names);

pval_dir_name = ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V4_ambiguous_mua_cvsplits14_1\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V4_ambiguous_mua_cvsplits14_2\shuff\', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V4_ambiguous_mua_cvsplits14_3\shuff\'};

plot_obj.p_values = pval_dir_name;

plot_obj.legend_names = {'Decoding #1', 'Decoding #2', 'Decoding #3'};

plot_obj.collapse_all_times_when_estimating_pvals = 0;

figure,
plot_obj.plot_results;

ylim([0 100])
xline(800)
xline(2400)

l = legend('Location', 'Best');
l.String(4:end) = [];

box on

%% plot decoding from target-responsive and non-responsive sites (Tuebingen)

for areaId = {'V1&2', 'V1', 'V2', 'V4'}
    
    for bandId = {'mua', 'alpha', 'beta', 'gamma1', 'gamma2'}

        result_names = ...
            {['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_' areaId{:} '_ambiguous_response1_' bandId{:} '\Results_' areaId{:} '_ambiguous_response1_' bandId{:} '_250ms_bins_50ms_results'], ...
            ['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_' areaId{:} '_ambiguous_response0_' bandId{:} '\Results_' areaId{:} '_ambiguous_response0_' bandId{:} '_250ms_bins_50ms_results']};
        
        plot_obj = plot_standard_results_object(result_names);
        
        pval_dir_name = ...
            {['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_' areaId{:} '_ambiguous_response1_alpha\shuff\'], ...
            ['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_' areaId{:} '_ambiguous_response0_alpha\shuff\']};
        
        plot_obj.p_values = pval_dir_name;
        
        plot_obj.legend_names = {'Target-Responsive', 'Target-Unresponsive'};
        
        plot_obj.collapse_all_times_when_estimating_pvals = 0;
        
        figure,
        plot_obj.plot_results;
        
        ylim([0 100])
        xline(500)
        xline(800)
        xline(2200)
        
        l = legend('Location', 'Best');
        l.String(length(result_names) + 1:end) = [];
        
        title([areaId{:} ' ' bandId{:}])
        
        box on

        close all
    end
    
end

%% 