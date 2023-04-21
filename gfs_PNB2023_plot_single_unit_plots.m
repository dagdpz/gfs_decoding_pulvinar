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
params(n).cellIds = {'290707_barney_gfs2-04', '190606_elvis_gfs2-04', '140607_barney_gfs2-04'}; % V4 - 140706_elvis_gfs1-04
params(n).channel = [11 37 9]; % V4 - 36
params(n).timing = [1500 3000 5000 6500];
params(n).multiplier = 1000;
params(n).ylabel = 'Spiking Frequency, Hz';
params(n).ylim = [0 90];
params(n).lineStyle = {':', '-', '--', '-'};
n = n + 1;

params(n).fileNames = ...
    {'Binned_data_V1_both_cvsplits14_mua_250ms_bins_50ms_sampled', ...
    'Binned_data_V2_both_cvsplits14_mua_250ms_bins_50ms_sampled', ...
    'Binned_data_V4_both_cvsplits14_mua_250ms_bins_50ms_sampled'};
params(n).dataFolder = ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\';
params(n).labels = {'disap_physical', 'nodisap_physical', 'disap_ambiguous', 'nodisap_ambiguous'};
params(n).areas = {'V1', 'V2', 'V4'};
params(n).cellIds = {'210304_dali_gfs1', '200304_dali_gfs1', '040404_wally_gfs_2prot'};
params(n).channel = [11 6 12];
params(n).timing = [500 800 2200 3200];
params(n).multiplier = 1;
params(n).ylabel = 'MUA power, a.u.';
params(n).ylim = [0 7];
params(n).lineStyle = {':', '-', '--', '-'};

cmap = [0 0 0;
    0.5 0.5 0.5;
    0.25 0.73 0.97;
    0.97 0.41 0.25];

figure,
set(gcf, 'Position', [1 41 1920 963])
set(gcf, 'PaperOrientation', 'portrait')

for setNum = 1:2
    
    for flNum = 1:length(params(setNum).fileNames)
        
        currFile = [params(setNum).dataFolder params(setNum).fileNames{flNum}];
        
        load(currFile)
        x_times = binned_site_info.binning_parameters.the_bin_start_times + binned_site_info.binning_parameters.bin_width/2;
        binned_data = cellfun(@ (x) params(setNum).multiplier*x, binned_data, 'UniformOutput', false);
        
        % choose the needed unit
        currID = cellfun(@ (x) ~isempty(strfind(x, params(setNum).cellIds{flNum})), binned_site_info.info_id);
        currCh = binned_site_info.channel == params(setNum).channel(flNum);
        currUnitNum = find(currID' & currCh);
        
        % plot raster data
        for labNum = 1:length(params(setNum).labels)
            
            currLab = params(setNum).labels{labNum};
            
            currLabId = cellfun(@ (x) isequal(currLab, x), binned_labels.condition_disap{currUnitNum}, 'UniformOutput', 1);
            
            currData = binned_data{currUnitNum}(currLabId, :);
            currMean(:, labNum) = mean(currData, 1);
            
            %             % +/- standard deviation
            %             upperEB = currMean(:, labNum) + std(currData, [], 1)';
            %             lowerEB = currMean(:, labNum) - std(currData, [], 1)';
            
            % +/- standard error of the mean
            upperEB_ste(:, labNum) = currMean(:, labNum) + std(currData, [], 1)'/sqrt(size(currData, 1));
            lowerEB_ste(:, labNum) = currMean(:, labNum) - std(currData, [], 1)'/sqrt(size(currData, 1));
            
        end
        
        subplot(2, 3, 3*(setNum - 1) + flNum)
        hold on
        for labNum = 1:4
            f(labNum) = ...
                fill([x_times fliplr(x_times) x_times(1)], [upperEB_ste(:, labNum); flipud(lowerEB_ste(:, labNum)); upperEB_ste(1, labNum)], cmap(labNum, :), 'FaceAlpha', .2, 'EdgeColor', 'none');
            p(labNum) = ...
                plot(x_times, currMean(:, labNum), 'Color', cmap(labNum, :), 'LineWidth', 2, 'LineStyle', params(setNum).lineStyle{labNum});
        end
        
        xline(params(setNum).timing(1))
        xline(params(setNum).timing(2))
        xline(params(setNum).timing(3))
        
        % set y-lims
        set(gca, 'YLim', params(setNum).ylim);
        
%         grid on
        
%         y_lim_max(labNum) = y_lim(2);
        
        if flNum == 1
            legend(p, {'Physical Removal', 'Physical Persistence', 'Perceptual Suppression', 'Perceptual Persistence'}, 'Location', 'Best')
            xlabel('Time after trial start, ms')
            ylabel(params(setNum).ylabel)
        end
        
        xlim([0 params(setNum).timing(4)])
        
        title({params(setNum).areas{flNum}, [params(setNum).cellIds{flNum} ' ch' num2str(params(setNum).channel(flNum))]}, 'interpreter', 'none')
        
        box on
    end
    
    clear currData currMean upperEB_ste lowerEB_ste
    
end

set(findall(gcf,'-property','FontSize'),'FontSize',16)

% savename = 'Y:\Posters Presentations Talks\2023_PNM\Luba\single_units.pdf';
% print(1, '-fillpage', '-dpdf', 'PaperOrientation', 'landscape', savename)
