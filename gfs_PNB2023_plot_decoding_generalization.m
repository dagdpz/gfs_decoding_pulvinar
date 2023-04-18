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

% set colors
cmap = cool(4);

for setNum = 1:2
    
    figure,
    set(gcf, 'Position', [1 419 1919 577])
    
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
            
            p(decNum) = plot(x_times, currDecodingAccuracy, 'Color', cmap(decNum, :), 'LineWidth', 2);
            hold on
            fill([x_times fliplr(x_times) x_times(1)], [currHighEB; flipud(currLowEB); currHighEB(1)], cmap(decNum, :), 'FaceAlpha', .25, 'EdgeColor', 'none');
            
        end
        
        xline(params(setNum).timing(1))
        xline(params(setNum).timing(2))
        xline(params(setNum).timing(3))
        yline(0.5)
        title(params(setNum).areas{areaNum})
        ylim([0 1])
        
        if areaNum == 1
            
            legend(p, params(n).labels, 'Location', 'best')
            xlabel('Time after trial start, ms')
            ylabel('Decoding Accuracy')
            
        end
        
    end
end

