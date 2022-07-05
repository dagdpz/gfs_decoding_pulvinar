clear all, close all

dataDir = 'F:\Luba\scripts\ndt_prep\allAreas_both\';

flList = dir([dataDir '*.mat']);

% load binned data
load('F:\Luba\scripts\ndt_prep\Binned_data_allAreas_both_250ms_bins_50ms_sampled.mat')

% set colors
cmap = cool(4);
cmapRaster = [0, 0, 0; cmap];

for flNum = 1:length(flList)
    
    currFile = [dataDir flList(flNum).name];
    
    load(currFile)
    
    % find corresponding data in the binned and smoothed data
    currID = cellfun(@ (x) strcmp(x, raster_site_info.info_id), binned_site_info.info_id);
    currCh = binned_site_info.channel == raster_site_info.channel;
    
    unqLabels = unique(raster_labels.condition_disap);
    
    figure,
        imagesc(raster_data)
        colormap(cmapRaster)
    
	for labNum = 1:length(unqLabels)
        
        currLabID = cellfun(@ (x) strcmp(x, unqLabels{labNum}), raster_labels.condition_disap);
        
        raster_data(currLabID, :) = raster_data(currLabID, :) * labNum * 100;
        
        figure,
        imagesc(raster_data)
        colormap(cmapRaster)
    end
    
    figure,
    set(gcf, 'Position', get(0, 'Screensize'));
    imagesc(raster_data)
    axis xy
    colormap(cmapRaster)
    set(gca, 'YTick', [])
    hold on
    
    
    
    x_times = binned_site_info.binning_parameters.the_bin_start_times + binned_site_info.binning_parameters.bin_width/2;
%     figure,
    for labNum = 1:length(unqLabels)
        
        currLab = unqLabels{labNum};
        
        currLabId = cellfun(@ (x) isequal(currLab, x), raster_labels.condition_disap, 'UniformOutput', 1);
        
        subplot(2, 4, labNum)
        imagesc(raster_data(currLabId, :))
        axis xy
        colormap gray
        set(gca, 'YTick', [])
        title(currLab)
        
        currMean = mean(binned_data{currID & currCh'}(currLabId, :), 1);
        upperEB = currMean + std(binned_data{currID & currCh'}(currLabId, :), 1);
        lowerEB = currMean - std(binned_data{currID & currCh'}(currLabId, :), 1);
        
        s(labNum) = subplot(2, 4, labNum + 4);
        
        fill([x_times fliplr(x_times) x_times(1)], [upperEB fliplr(lowerEB) upperEB(1)], cmap(labNum, :), 'FaceAlpha', .3, 'EdgeColor', 'none')
        hold on
        plot(x_times, currMean, 'Color', cmap(labNum, :), 'LineWidth', 3)
        hold off
        
        % set lower y-lim to zero
        y_lim = get(gca, 'YLim');
        y_lim(1) = 0;
        set(gca, 'YLim', y_lim);
        
        y_lim_max(labNum) = y_lim(2);
        
        if labNum == 1
            xlabel('Time after trial start, ms')
        end
    
        legend({'+/- St. Dev.', currLab}, 'Location', 'southoutside')
        
    end
    
    for ii = 1:length(s)
        
        set(s(ii), 'YLim', [0 max(y_lim_max)])
        
    end
    
    supttl = flList(flNum).name(1:end-4);
    supttl(supttl == '_') = ' ';
    sgtitle(supttl)
    
    if flNum == 1
        % Plot figures in batch mode. Faster than opening a new powerpoint object each time
        ppt = saveppt2('test1.ppt','init');

        % Create blank title page.
        saveppt2('ppt', ppt,'f',0,'t','Single Unit Responses in GFS - LGN, V4, pulvinar');
    end
    
    saveppt2('ppt', ppt, 'driver', 'meta', 'f', 1)
    
    close(1)
end

saveppt2('test1.ppt','ppt',ppt,'close');
