clear all, close all

n = 1;
params(n).fileNames = ...
    {'results_LGN_matchUnits_ambiguous_spk_cvsplits14', ...
    'results_V4_matchUnits_ambiguous_spk_cvsplits14', ...
    'results_pulvinar_matchUnits_ambiguous_spk_cvsplits14'};
params(n).dataFolder = ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\';
params(n).labels = {'Tr - physical, Te - physical', 'Tr - physical, Te - ambiguous', 'Tr - ambiguous, Te - physical', 'Tr - ambiguous, Te - ambiguous'};
params(n).areas = {'LGN', 'V4', 'pulvinar'};
params(n).timing = [1500 3000 5000 6500];
params(n).lineStyle = {'-', '-', '-', '-'};
params(n).cellNum = [55 89 223];
n = n + 1;

params(n).fileNames = ...
    {'results_V1&2_ambiguous_mua_cvsplits14', ...
    'results_V4_ambiguous_mua_cvsplits14'};
params(n).dataFolder = ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\';
params(n).labels = {'Tr - physical, Te - physical', 'Tr - physical, Te - ambiguous', 'Tr - ambiguous, Te - physical', 'Tr - ambiguous, Te - ambiguous'};
params(n).areas = {'V1&2', 'V4'};
params(n).timing = [500 800 2200 3200];
params(n).lineStyle = {'-', '-', '-', '-'};
params(n).cellNum = [97 62];

cmap = [0 0 0;
    0.53 0.22 0.13;
    0.13 0.37 0.49;
    0.97 0.41 0.25];

cmap = ...
[0.4167    0.2604    0.1658;
0.4167    0.2604    0.1658;
0.4167    0.2604    0.1658;
0.4167    0.2604    0.1658];

for setNum = 1:2
    
    figure,
    if setNum == 1
        set(gcf, 'Position', [1 419 1919 577])
    elseif setNum == 2
        set(gcf, 'Position', [91 157 1226 577])
    end
    
    for areaNum = 1:length(params(setNum).fileNames)
        
        subplot(1, length(params(setNum).fileNames), areaNum)
        
        filename = dir([params(setNum).dataFolder params(setNum).fileNames{areaNum} filesep '*mat']);
        
        load([filename.folder filesep filename.name], 'DECODING_RESULTS')
        
        x_times = ...
            DECODING_RESULTS.DS_PARAMETERS.binned_site_info.binning_parameters.the_bin_start_times + ...
            DECODING_RESULTS.DS_PARAMETERS.binned_site_info.binning_parameters.the_bin_widths/2;
        
        pval_obj = pvalue_object([filename.folder filesep filename.name], [filename.folder filesep 'shuff' filesep]);
        pval_obj.collapse_all_times_when_estimating_pvals = 1;
        pval_obj.the_result_type = 1; % 3 to use mean decision values
    
        %%Red
        pval_obj.create_pvalues_from_nulldist_files;
    
        pval_obj.p_values(pval_obj.p_values == 0) = 1 / pval_obj.num_points_in_null_distribution;
        
        currDecodingAccuracy = diag(DECODING_RESULTS.ZERO_ONE_LOSS_RESULTS.mean_decoding_results);
        currStd = diag(DECODING_RESULTS.ZERO_ONE_LOSS_RESULTS.stdev.over_resamples);
        currLowEB = currDecodingAccuracy - currStd/2;
        currHighEB = currDecodingAccuracy + currStd/2;
        
        p(areaNum) = plot(x_times, currDecodingAccuracy, 'Color', cmap(areaNum, :), 'LineWidth', 2, 'LineStyle', params(setNum).lineStyle{areaNum});
        hold on
        fill([x_times fliplr(x_times) x_times(1)], [currHighEB; flipud(currLowEB); currHighEB(1)], cmap(areaNum, :), 'FaceAlpha', .25, 'EdgeColor', 'none');
        
        xline(params(setNum).timing(1), 'Label', 'Stable Fixation', 'LabelHorizontalAlignment', 'center', 'LabelVerticalAlignment', 'top')
        xline(params(setNum).timing(2), 'Label', 'Target Onset', 'LabelHorizontalAlignment', 'center', 'LabelVerticalAlignment', 'top')
        xline(params(setNum).timing(3), 'Label', 'Surround Onset', 'LabelHorizontalAlignment', 'center', 'LabelVerticalAlignment', 'top')
        yline(0.5)
        title([params(setNum).areas{areaNum} ': ' num2str(params(setNum).cellNum(areaNum)) ' units'])
        xlim([0 params(setNum).timing(3)+200])
        ylim([0.3 1])
        
%         imagesc([0+126 params(setNum).timing(4)-125], [0.3 0.31], (-1)*log10(pval_obj.p_values)), 
        imagesc([0+126 params(setNum).timing(4)-125], [0.4 0.41], pval_obj.p_values)
        set(gca,'ColorScale','log')
        colormap(flipud(jet))
%         caxis([0 1/10])
        
        if areaNum == 1
            
%             legend(p, params(n).labels, 'Location', 'best')
            xlabel('Time after trial start, ms')
            ylabel('Decoding Accuracy')
            
        elseif areaNum == 3 || (areaNum == 2 && setNum == 2)
            
            colorbar
            
        end
        
    end
end







