clear all, close all

%decoding from V4 Tuebingen
% result_names = ...
%     'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V4_ambiguous_mua_cvsplits14_1\Binned_data_V4_ambiguous_cvsplits14_mua_250ms_bins_50ms_results';
% 
% pval_dir_name = ...
%     'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V4_ambiguous_mua_cvsplits14_1\shuff\';

% result_names = ...
%     'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V1_ambiguous_mua_cvsplits14_1\Binned_data_V1_ambiguous_cvsplits14_mua_250ms_bins_50ms_results';
% 
% pval_dir_name = ...
%     'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V1_ambiguous_mua_cvsplits14_1\shuff\';

result_names = ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\results_generalization_pulvinar_matchUnits_spk_physical-physical\Binned_data_pulvinar_matchUnits_both_spk_250ms_bins_50ms_results';

pval_dir_name = ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\results_generalization_pulvinar_matchUnits_spk_physical-physical\shuff\';

pval_obj = pvalue_object(result_names, pval_dir_name);
pval_obj.collapse_all_times_when_estimating_pvals = 1;
pval_obj.the_result_type = 3; % to use mean decision values
% pval_obj.real_decoding_results_lower_than_null_distribution = 1;

%%
[p_values, null_distributions, PVALUE_PARAMS] = pval_obj.create_pvalues_from_nulldist_files;
% [corr_p, h] = bonf_holm(p_values, 0.05);

%% plot p-values and decoding accuracy

figure,
yyaxis left % plot p-values here
plot(pval_obj.p_values)
hold on
yline(0.05, '--', 'p = 0.05 (uncorrected)')
% yline(0.05/60, '--', 'p = 8.3e-04 (Bonf)')
plot(find(pval_obj.p_values < 0.05), 0.5, '*r')
% plot(find(corr_p < 0.05), 0.55, '*k')
plot(find(pval_obj.p_values < 0.05/60), 0.6, '*b')
ylabel('P-Value')

yyaxis right % plot decoding accuracy here
plot(pval_obj.real_results)
ylabel('Decision Values')


%%

sum(pval_obj.real_results([2     3     4     5     6]))

ans =     3.2507

sum(pval_obj.real_results([11]))

ans =     0.6079

sum(pval_obj.real_results([16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36    37]))

ans =    14.5771

sum(pval_obj.real_results([42    43    44    45 46    47    48    49    50    51    52    53    54    55    56    57    58    59    60]))

ans =    15.3979



%%
plot_obj.p_values = pval_dir_name;

plot_obj.legend_names = {'Decoding #1'};

plot_obj.collapse_all_times_when_estimating_pvals = 0;

figure,
plot_obj.plot_results;

ylim([0 100])
xline(800)
xline(2400)

l = legend('Location', 'Best');
l.String(4:end) = [];

box on
