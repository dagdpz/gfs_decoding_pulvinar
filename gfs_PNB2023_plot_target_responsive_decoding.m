clear all, close all

n = 1;
params(n).fileNames = ...
    {{'results_LGN_ambiguous_response0_spk', ...
    'results_LGN_ambiguous_response1_spk'}, ...
    ...
    {'results_V4_ambiguous_response0_spk', ...
    'results_V4_ambiguous_response1_spk'}, ...
    ...
    {'results_pulvinar_ambiguous_response0_spk', ...
    'results_pulvinar_ambiguous_response1_spk'}};
params(n).dataFolder = ...
    'Y:\Projects\GFS_pulvinar_decoding\PNB2023_data\GFS_NIH\';
params(n).labels = {{'Target-Unresponsive: 16 units', 'Target-Responsive: 39 units'}, ...
    ...
    {'Target-Unresponsive: units 29', 'Target-Responsive: 60 units'}, ...
    ...
    {'Target-Unresponsive: 118 units', 'Target-Responsive: 105 units'}};
params(n).areas = {'LGN', 'V4', 'pulvinar'};
params(n).cellNums = {[39 16], [60 29], [105 118]};
params(n).timing = [1500 3000 5000 6500];
n = n + 1;

params(n).fileNames = ...
    {{'results_V1&2_ambiguous_response0_mua', ...
    'results_V1&2_ambiguous_response1_mua'}, ...
    ...
    {'results_V4_ambiguous_response0_mua', ...
    'results_V4_ambiguous_response1_mua'}};
params(n).dataFolder = ...
    'Y:\Projects\GFS_pulvinar_decoding\PNB2023_data\GFS_Tuebingen\';
params(n).labels = {{'Target-Unresponsive: 19 units', 'Target-Responsive: 78 units'}, ...
    {'Target-Unresponsive: 19 units', 'Target-Responsive: 43 units'}};
params(n).areas = {'V1&2', 'V4'};
params(n).cellNums = {[19 78], [19 43]}; % first cell-unresponsive, second - # of cell-responsive
params(n).timing = [500 800 2200 3200];

% set colors
% cmap = cool(4);
cmap = [0.4 0.4 0.4;
        1 0 0];

for setNum = 1:2
    
    figure,
    if setNum == 1
        set(gcf, 'Position', [1 419 1918 577])
    elseif setNum == 2
        set(gcf, 'Position', [1 419 1333 577])
    end
    
    for areaNum = 1:length(params(setNum).fileNames)
        
        subplot(1, length(params(setNum).fileNames), areaNum)
        
        for respNum = 1:2
        
            filename = dir([params(setNum).dataFolder params(setNum).fileNames{areaNum}{respNum} filesep '*mat']);
            
            load([filename.folder filesep filename.name], 'DECODING_RESULTS')
            
            x_times = ...
                DECODING_RESULTS.DS_PARAMETERS.binned_site_info.binning_parameters.the_bin_start_times + ...
                DECODING_RESULTS.DS_PARAMETERS.binned_site_info.binning_parameters.the_bin_widths/2;
            
            currDecodingAccuracy = diag(DECODING_RESULTS.ZERO_ONE_LOSS_RESULTS.mean_decoding_results);
            currStd = diag(DECODING_RESULTS.ZERO_ONE_LOSS_RESULTS.stdev.over_resamples);
            currLowEB = currDecodingAccuracy - currStd/2;
            currHighEB = currDecodingAccuracy + currStd/2;
            
            p(respNum) = plot(x_times, currDecodingAccuracy, 'Color', cmap(respNum, :), 'LineWidth', 2);
            hold on
            fill([x_times fliplr(x_times) x_times(1)], [currHighEB; flipud(currLowEB); currHighEB(1)], cmap(respNum, :), 'FaceAlpha', .25, 'EdgeColor', 'none');
            
            title(params(setNum).areas{areaNum})
            
        end
        
        xline(params(setNum).timing(1), 'Label', 'Stable Fixation', 'LabelHorizontalAlignment', 'center', 'LabelVerticalAlignment', 'top')
        xline(params(setNum).timing(2), 'Label', 'Target Onset', 'LabelHorizontalAlignment', 'center', 'LabelVerticalAlignment', 'top')
        xline(params(setNum).timing(3), 'Label', 'Surround Onset', 'LabelHorizontalAlignment', 'center', 'LabelVerticalAlignment', 'top')
        xlim([0 params(setNum).timing(4)])
        yline(0.5)
        ylim([0.3 1])
        
        legend(p, params(setNum).labels{areaNum}, 'Location', 'best')
        
        if areaNum == 1
            
            xlabel('Time after trial start, ms')
            ylabel('Decoding Accuracy')
            
        end
        
    end
end
