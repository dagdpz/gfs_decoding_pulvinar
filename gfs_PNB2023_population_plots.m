clear all, close all

n = 1;
params(n).fileNames = ...
    {'Binned_data_LGN_matchUnits_both_spk_250ms_bins_50ms_sampled', ...
    'Binned_data_V4_matchUnits_both_spk_250ms_bins_50ms_sampled', ...
    'Binned_data_pulvinar_matchUnits_both_spk_250ms_bins_50ms_sampled'};
params(n).dataFolder = ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\';
params(n).labels = {'disap_physical', 'nodisap_physical', 'disap_ambiguous', 'nodisap_ambiguous'};
params(n).areas = {'LGN', 'V4', 'pulvinar'};
params(n).timing = [1500 3000 5000 6500];
n = n + 1;

params(n).fileNames = ...
    {'Binned_data_V1_both_cvsplits14_mua_250ms_bins_50ms_sampled', ...
    'Binned_data_V2_both_cvsplits14_mua_250ms_bins_50ms_sampled', ...
    'Binned_data_V4_both_cvsplits14_mua_250ms_bins_50ms_sampled'};
params(n).dataFolder = ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\';
params(n).labels = {'disap_physical', 'nodisap_physical', 'disap_ambiguous', 'nodisap_ambiguous'};
params(n).areas = {'V1', 'V2', 'V4'};
params(n).timing = [500 800 2200 3200];

% set colors
cmap = cool(4);

figure,
set(gcf, 'Position', [1 41 1920 963])

for setNum = 1:length(params)
    
    for flNum = 1:length(params(setNum).fileNames)
        
        currFileName = [params(setNum).dataFolder params(setNum).fileNames{flNum}];
        
        % load binned data
        load(currFileName, 'binned_data', 'binned_labels', 'binned_site_info')
        
        x_times = binned_site_info.binning_parameters.the_bin_start_times + binned_site_info.binning_parameters.bin_width/2;
        
        % normalize data
        bin_centers = binned_site_info.binning_parameters.the_bin_start_times - ...
            binned_site_info.binning_parameters.bin_width/2;
        
        backgroundIDs = bin_centers <= params(setNum).timing(2) - binned_site_info.binning_parameters.bin_width/2 & ...
            bin_centers >= params(setNum).timing(1) + binned_site_info.binning_parameters.bin_width/2;
        
        binned_data = cellfun(@single, binned_data, 'UniformOutput', false);
        
        % transpose neuronal data
        binned_data = cellfun(@transpose, binned_data, 'UniformOutput', false);
        
        % data normalization
        mean_bg = cellfun(@(x) mean2(x(backgroundIDs, :)), binned_data, 'UniformOutput', false);
        normalized_data = cellfun(@(x, y) (x-y), binned_data, mean_bg, 'UniformOutput', false);
        
        for labNum = 1:4
            
            currLab = params(setNum).labels{labNum};
            currLabId = cellfun(@ (x) cellfun(@ (y) isequal(y, currLab), x, 'UniformOutput', 1), binned_labels.condition_disap, 'UniformOutput', 0);
            currData = cellfun(@ (x, y) x(:,y), normalized_data, currLabId, 'UniformOutput', 0);
            currUnitMeans = cellfun(@ (x) mean(x, 2), currData, 'UniformOutput', 0);
            signal_means.(currLab) = mean([currUnitMeans{:}], 2);
            
            % +/- standard error of the mean
            currSte = std([currUnitMeans{:}], [], 2) / size([currUnitMeans{:}], 2);
            upperEB.(currLab) = signal_means.(currLab) + currSte;
            lowerEB.(currLab) = signal_means.(currLab) - currSte;
            
        end
        
        subplot(2, 3, 3*(setNum - 1) + flNum)
        hold on
        
        for labNum = 1:4
            currLab = params(setNum).labels{labNum};
            f(labNum) = fill([x_times fliplr(x_times) x_times(1)], [upperEB.(currLab); flipud(lowerEB.(currLab)); upperEB.(currLab)(1)], cmap(labNum, :), 'FaceAlpha', .25, 'EdgeColor', 'none');
            p(labNum) = plot(x_times, signal_means.(currLab), 'Color', cmap(labNum, :), 'LineWidth', 2);
        end
        
        box on
        
        xline(params(setNum).timing(1))
        xline(params(setNum).timing(2))
        xline(params(setNum).timing(3))
        title(params(setNum).areas{flNum})
        
        xlim([0 params(setNum).timing(4)])
        
        if flNum == 1
            legend(p, {'Physical Removal', 'Physical Persistence', 'Perceptual Suppression', 'Perceptual Disappearance'}, 'Location', 'Best')
            xlabel('Time after trial start, ms')
            ylabel('Spiking Frequency, Hz')
        end
        
    end

end
