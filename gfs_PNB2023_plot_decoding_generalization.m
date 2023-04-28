clear all, close all

n = 1;
params(n).fileNames = ...
    {{'results_generalization_LGN_matchUnits_spk_physical-physical', ...
    'results_generalization_LGN_matchUnits_spk_physical-ambiguous', ...
    'results_generalization_LGN_matchUnits_spk_ambiguous-physical', ...
    'results_generalization_LGN_matchUnits_spk_ambiguous-ambiguous'}, ...
    ...
    {'results_generalization_V4_matchUnits_spk_physical-physical', ...
    'results_generalization_V4_matchUnits_spk_physical-ambiguous', ...
    'results_generalization_V4_matchUnits_spk_ambiguous-physical', ...
    'results_generalization_V4_matchUnits_spk_ambiguous-ambiguous'}, ...
    ...
    {'results_generalization_pulvinar_matchUnits_spk_physical-physical', ...
    'results_generalization_pulvinar_matchUnits_spk_physical-ambiguous', ...
    'results_generalization_pulvinar_matchUnits_spk_ambiguous-physical', ...
    'results_generalization_pulvinar_matchUnits_spk_ambiguous-ambiguous'}};
params(n).dataFolder = ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\';
params(n).labels = {'Tr - physical, Te - physical', 'Tr - physical, Te - ambiguous', 'Tr - ambiguous, Te - physical', 'Tr - ambiguous, Te - ambiguous'};
params(n).areas = {'LGN', 'V4', 'pulvinar'};
params(n).timing = [1500 3000 5000 6500];
params(n).lineStyle = {'-', ':', ':', '-'};
params(n).cellNum = [40 28 92];
n = n + 1;

params(n).fileNames = ...
    {{'results_generalization_V1&2_mua_physical-physical', ...
    'results_generalization_V1&2_mua_physical-ambiguous', ...
    'results_generalization_V1&2_mua_ambiguous-physical', ...
    'results_generalization_V1&2_mua_ambiguous-ambiguous'}, ...
    ...
    {'results_generalization_V4_mua_physical-physical', ...
    'results_generalization_V4_mua_physical-ambiguous', ...
    'results_generalization_V4_mua_ambiguous-physical', ...
    'results_generalization_V4_mua_ambiguous-ambiguous'}};
params(n).dataFolder = ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\';
params(n).labels = {'Tr - physical, Te - physical', 'Tr - physical, Te - ambiguous', 'Tr - ambiguous, Te - physical', 'Tr - ambiguous, Te - ambiguous'};
params(n).areas = {'V1&2', 'V4'};
params(n).timing = [500 800 2200 3200];
params(n).lineStyle = {'-', ':', ':', '-'};
params(n).cellNum = [35 56];

% set colors
cmap = copper(4);
cmap = [0 0 0;
    0.53 0.22 0.13;
    0.13 0.37 0.49;
    0.97 0.41 0.25];

for setNum = 1:2
    
    figure,
    if setNum == 1
        set(gcf, 'Position', [1 419 1919 577])
    elseif setNum == 2
        set(gcf, 'Position', [91 157 1226 577])
    end
    
    for areaNum = 1:length(params(setNum).fileNames)
        
        subplot(1, length(params(setNum).fileNames), areaNum)
        
        for decNum = 1:4
        
            filename = dir([params(setNum).dataFolder params(setNum).fileNames{areaNum}{decNum} filesep '*mat']);
            
            load([filename.folder filesep filename.name], 'DECODING_RESULTS')
            
            x_times = ...
                DECODING_RESULTS.DS_PARAMETERS.binned_site_info.binning_parameters.the_bin_start_times + ...
                DECODING_RESULTS.DS_PARAMETERS.binned_site_info.binning_parameters.the_bin_widths/2;
            
            currDecodingAccuracy = diag(DECODING_RESULTS.ZERO_ONE_LOSS_RESULTS.mean_decoding_results);
            currStd = diag(DECODING_RESULTS.ZERO_ONE_LOSS_RESULTS.stdev.over_resamples);
            currLowEB = currDecodingAccuracy - currStd/2;
            currHighEB = currDecodingAccuracy + currStd/2;
            
            p(decNum) = plot(x_times, currDecodingAccuracy, 'Color', cmap(decNum, :), 'LineWidth', 2, 'LineStyle', params(setNum).lineStyle{decNum});
            hold on
            fill([x_times fliplr(x_times) x_times(1)], [currHighEB; flipud(currLowEB); currHighEB(1)], cmap(decNum, :), 'FaceAlpha', .25, 'EdgeColor', 'none');
            
        end
        
        xline(params(setNum).timing(1), 'Label', 'Stable Fixation', 'LabelHorizontalAlignment', 'center', 'LabelVerticalAlignment', 'top')
        xline(params(setNum).timing(2), 'Label', 'Target Onset', 'LabelHorizontalAlignment', 'center', 'LabelVerticalAlignment', 'top')
        xline(params(setNum).timing(3), 'Label', 'Surround Onset', 'LabelHorizontalAlignment', 'center', 'LabelVerticalAlignment', 'top')
        yline(0.5)
        if setNum == 1
            title([params(setNum).areas{areaNum} ': ' num2str(params(setNum).cellNum(areaNum)) ' units'])
            xlim([params(setNum).timing(3) - 200 params(setNum).timing(4) - 500])
        elseif setNum == 2
            title([params(setNum).areas{areaNum} ': ' num2str(params(setNum).cellNum(areaNum)) ' sites'])
            xlim([params(setNum).timing(3) - 200 params(setNum).timing(4) - 200])
        end
        ylim([0.3 1])
        
        if areaNum == 3
            legend(p, params(n).labels, 'Location', 'best')
        end
        
        if areaNum == 1
            xlabel('Time after trial start, ms')
            ylabel('Decoding Accuracy')
        end
    end
end

