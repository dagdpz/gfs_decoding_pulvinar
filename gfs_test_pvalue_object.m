clear all, close all

n = 1;
% NIH dataset ambiguous
% loop through areas
for areaType = {'LGN', 'V4', 'pulvinar'}
    for bandType = {'spk', 'alpha', 'beta', 'gamma1'} % 'gamma2'
        
        % ambiguous
        param{n}.fixStable = 1500;
        param{n}.targOn = 3000;
        param{n}.surrOn = 5000;
        ttl_str{n} = ['Binned_data_' areaType{1} '_matchUnits_ambiguous_' bandType{1} '_250ms_bins_50ms_results'];
        result_names{n} = ...
            ['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\results_' areaType{1} '_matchUnits_ambiguous_' bandType{1} '_cvsplits14\Binned_data_' areaType{1} '_matchUnits_ambiguous_' bandType{1} '_250ms_bins_50ms_results'];
        pval_dir_name{n} = ...
            ['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\results_' areaType{1} '_matchUnits_ambiguous_' bandType{1} '_cvsplits14\shuff\'];
        n = n + 1;
        
    end
end

% generalization
for areaType = {'LGN', 'V4', 'pulvinar'}
    for bandType = {'spk', 'alpha', 'beta', 'gamma1'} % 'gamma2'
        
        for trainCondition = {'physical', 'ambiguous'}
            for testCondition = {'physical', 'ambiguous'}
                
                param{n}.fixStable = 1500;
                param{n}.targOn = 3000;
                param{n}.surrOn = 5000;
                ttl_str{n} = ['Binned_data_' areaType{1} '_matchUnits_both_' bandType{1} '_250ms_bins_50ms_results'];
                result_names{n} = ...
                    ['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\results_generalization_' areaType{1} '_matchUnits_' bandType{1} '_' trainCondition{1} '-' testCondition{1} '\Binned_data_' areaType{1} '_matchUnits_both_' bandType{1} '_250ms_bins_50ms_results'];
                pval_dir_name{n} = ...
                    ['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\results_generalization_' areaType{1} '_matchUnits_' bandType{1} '_' trainCondition{1} '-' testCondition{1} '\shuff\'];
                n = n + 1;
                
            end
        end
    end
end



% Tuebingen dataset
for areaType = {'V1&2', 'V1', 'V2', 'V4'}
    for bandType = {'mua', 'alpha', 'beta', 'gamma1', 'gamma2'} % 
        
        % ambiguous
        param{n}.fixStable = 500;
        param{n}.targOn = 800;
        param{n}.surrOn = 2200;
        ttl_str{n} = ['Results_' areaType{1} '_matchUnits_ambiguous_' bandType{1} '_250ms_bins_50ms_results'];
        result_names{n} = ...
            ['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_' areaType{1} '_ambiguous_' bandType{1} '_cvsplits14\Results_' areaType{1} '_ambiguous_cvsplits14_' bandType{1} '_250ms_bins_50ms_results'];
        pval_dir_name{n} = ...
            ['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_' areaType{1} '_ambiguous_' bandType{1} '_cvsplits14\shuff\'];
        n = n + 1;
        
    end
end

% generalization
for areaType = {'V1&2', 'V1', 'V2', 'V4'}
    for bandType = {'mua', 'alpha', 'beta', 'gamma1', 'gamma2'} % 
        
        for trainCondition = {'physical', 'ambiguous'}
            for testCondition = {'physical', 'ambiguous'}
                
                param{n}.fixStable = 500;
                param{n}.targOn = 800;
                param{n}.surrOn = 2200;
                ttl_str{n} = ['Results_' areaType{1} '_matchUnits_both_' bandType{1} '_250ms_bins_50ms_results'];
                result_names{n} = ...
                    ['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_' areaType{1} '_' bandType{1} '_' trainCondition{1} '-' testCondition{1} '\Results_' areaType{1} '_both_cvsplits14_' bandType{1} '_250ms_bins_50ms_results'];
                pval_dir_name{n} = ...
                    ['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_generalization_' areaType{1} '_' bandType{1} '_' trainCondition{1} '-' testCondition{1} '\shuff\'];
                n = n + 1;
                
            end
        end
        
    end
end


% % NIH pulvinar ambiguous
% param{n}.fixStable = 1500;
% param{n}.targOn = 3000;
% param{n}.surrOn = 5000;
% ttl_str{n} = 'Binned_data_pulvinar_matchUnits_ambiguous_spk_250ms_bins_50ms_results';
% result_names{n} = ...
%     'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\results_pulvinar_matchUnits_ambiguous_spk_cvsplits14\Binned_data_pulvinar_matchUnits_ambiguous_spk_250ms_bins_50ms_results';
% pval_dir_name{n} = ...
%     'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\results_generalization_pulvinar_matchUnits_spk_ambiguous-ambiguous\shuff\';
% 
% 
% 
% 
% % V1 Tuebingen
% param{n}.fixStable = 500;
% param{n}.targOn = 800;
% param{n}.surrOn = 2200;
% ttl_str{n} = 'Binned_data_V1_ambiguous_cvsplits14_mua_250ms_bins_50ms_results';
% result_names{n} = ...
%     'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V1_ambiguous_mua_cvsplits14_1\Results_V1_ambiguous_cvsplits14_mua_250ms_bins_50ms_results';
% pval_dir_name{n} = ...
%     'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V1_ambiguous_mua_cvsplits14_1\shuff\';
% 
% n = n + 1;
% 
% % V2 Tuebingen
% param{n}.fixStable = 500;
% param{n}.targOn = 800;
% param{n}.surrOn = 2200;
% ttl_str{n} = 'Binned_data_V2_ambiguous_cvsplits14_mua_250ms_bins_50ms_results';
% result_names{n} = ...
%     'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V2_ambiguous_mua_cvsplits14_1\Results_V2_ambiguous_cvsplits14_mua_250ms_bins_50ms_results';
% pval_dir_name{n} = ...
%     'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V2_ambiguous_mua_cvsplits14_1\shuff\';
% n = n + 1;
% 
% %decoding from V4 Tuebingen
% param{n}.fixStable = 500;
% param{n}.targOn = 800;
% param{n}.surrOn = 2200;
% ttl_str{n} = 'Binned_data_V4_ambiguous_cvsplits14_mua_250ms_bins_50ms_results';
% result_names{n} = ...
%     'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V4_ambiguous_mua_cvsplits14_1\Results_V4_ambiguous_cvsplits14_mua_250ms_bins_50ms_results';
% pval_dir_name{n} = ...
%     'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\results_V4_ambiguous_mua_cvsplits14_1\shuff\';
% n = n + 1;
% 
% % NIH pulvinar physical
% param{n}.fixStable = 1500;
% param{n}.targOn = 3000;
% param{n}.surrOn = 5000;
% ttl_str{n} = 'Binned_data_pulvinar_matchUnits_both_spk_250ms_bins_50ms_results';

% n = n + 1;



% DA_crit_pos = 0.0237;
% % DA_crit_neg = -0.0223;

for iii = 81:length(result_names)
    
    % get bin times
    load(result_names{iii})
    bin_times = ...
        DECODING_RESULTS.DS_PARAMETERS.binned_site_info.binning_parameters.the_bin_start_times + ...
        DECODING_RESULTS.DS_PARAMETERS.binned_site_info.binning_parameters.the_bin_widths/2;
    
    pval_obj = pvalue_object(result_names{iii}, pval_dir_name{iii});
    pval_obj.collapse_all_times_when_estimating_pvals = 1;
    pval_obj.the_result_type = 1; % 3 to use mean decision values
    % pval_obj.real_decoding_results_lower_than_null_distribution = 1;
    
    %%Red
    pval_obj.create_pvalues_from_nulldist_files;
    
    pval_obj.p_values(pval_obj.p_values == 0) = 1 / size(pval_obj.null_distributions, 1) / size(pval_obj.null_distributions, 2);
    
    % [corr_p, h] = bonf_holm(p_values, 0.05);
    
    % %% loop through reshuffles
    %
    % ClusterStat = [];
    %
    % for ii = 1:size(pval_obj.null_distributions, 1)
    %
    %     currReshuffle = pval_obj.null_distributions(ii, :);
    %
    %     CC = bwconncomp(currReshuffle > DA_crit_pos,4);
    %
    %     clustLength = cellfun(@length, CC.PixelIdxList, 'UniformOutput', 1);
    %
    %     max_clust_id = find(clustLength == max(clustLength), 1, 'first');
    %
    %     if ~isempty(max_clust_id)
    %
    %         clustSum = sum(currReshuffle(CC.PixelIdxList{max_clust_id}));
    %
    %         ClusterStat = [ClusterStat clustSum];
    %
    %     end
    %
    % end
    
    %% plot p-values and decoding accuracy
    
%     figure,
%     plot(bin_times, pval_obj.null_distributions, 'Color', [0.5 0.5 0.5])
%     hold on
%     plot(bin_times, pval_obj.real_results, 'r', 'LineWidth', 3)
%     xline(param{iii}.fixStable)
%     xline(param{iii}.targOn)
%     xline(param{iii}.surrOn) 
%     xlabel('Time, ms')
%     ylabel('Classification Accuracy, %')
    
    newline;
    disp(result_names{iii})
    newline;

    figure,
    yyaxis left % plot p-values here
    plot(bin_times, pval_obj.p_values)
    hold on
    yline(0.05, '--', 'p = 0.05 (uncorrected)')
    p_uncorr_ids = find(pval_obj.p_values < 0.05);
    p1 = plot(bin_times(p_uncorr_ids), 10e-2, '*r');
    p_bonf_ids = find(pval_obj.p_values < 0.05/length(pval_obj.p_values));
    if ~isempty(p_bonf_ids)
        p2 = plot(bin_times(p_bonf_ids), 10e-3, '*b');
    end
	set(gca, 'YScale', 'log')
    ylabel('Log P-Value')
    
    yyaxis right % plot decoding accuracy here
    plot(bin_times, pval_obj.real_results, 'LineWidth', 3)
    xlabel('Time, ms')
    ylabel('Classification Accuracy, %')
    ylim([0 1])
    
    xline(param{iii}.fixStable)
    xline(param{iii}.targOn)
    xline(param{iii}.surrOn) 
    
    if exist('p2', 'var')
        legend([p1(1) p2(1)], {'Uncorrected', 'Bonferroni-Corrected'}, 'Location', 'SouthWest')
    else
        legend(p1(1), {'Uncorrected'}, 'Location', 'SouthWest')
    end
    
    title(ttl_str{iii}, 'Interpreter', 'none')
    
    figure(1), imagesc([0+125 3200-125], [0.3 0.31], (-1)*log10(pval_obj.p_values)), colormap(jet), caxis([0 5])
    
    clear p1 p2 DECODING_RESULTS
    
    close all
end

%%






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
plot_obj.p_values = pval_dir_name{1};

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
