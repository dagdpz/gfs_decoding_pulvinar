clear all, close all

flList = dir('Binned_data_*.mat');

savename = ['single_units_' datestr(date) '.ppt'];

for flNum = [31]%1:length(flList) % [28, 31, 34]
    
    load(flList(flNum).name)
    
    bin_centers = binned_site_info.binning_parameters.the_bin_start_times + ...
        binned_site_info.binning_parameters.the_bin_widths/2;
    
    backgroundIDs = bin_centers <= 2750 & bin_centers >= 1750;
    
    binned_data = binned_data(neurons2take);
    
    %     binned_labels.disap_nodisap = binned_labels.disap_nodisap(ANOVAprestim);
    %     binned_labels.condition = binned_labels.condition(ANOVAprestim);
    %     binned_labels.condition_disap = binned_labels.condition_disap(ANOVAprestim);
    
    binned_labels.disap_nodisap = binned_labels.disap_nodisap(neurons2take);
    binned_labels.condition = binned_labels.condition(neurons2take);
    binned_labels.condition_disap = binned_labels.condition_disap(neurons2take);
    
    % transpose neuronal data
    B = cellfun(@transpose, binned_data, 'UniformOutput', false);
    binned_data = cellfun(@transpose, binned_data, 'UniformOutput', false);
    
    % data normalization
    mean_bg = cellfun(@(x) mean2(x(backgroundIDs, :)), B, 'UniformOutput', false);
    std_all = cellfun(@(x) std2(x), B, 'UniformOutput', false);
    B = cellfun(@(x, y, z) (x-y)/z, B, mean_bg, std_all, 'UniformOutput', false);
    
    for cellNum = 1:length(binned_data)
        
        unqLabels = unique(binned_labels.condition_disap{cellNum});
        
        xTimes = binned_site_info.binning_parameters.the_bin_start_times + ...
            binned_site_info.binning_parameters.the_bin_widths/2;
        
        figure,
        
        subplot(1, 2, 1)
        
        hold on
        
        for labNum = 1:length(unqLabels)
            
            currLab = unqLabels{labNum};
            
            currLabId = cellfun(@ (x) isequal(currLab, x), binned_labels.condition_disap{cellNum}, 'UniformOutput', 1);
            
            currMean = mean(binned_data{cellNum}(:, currLabId), 2);
            
            plot(xTimes, currMean', 'LineWidth', 3)
            
        end
        
        xline([1500, 3000, 5000])
        
        % set lower y-lim to zero
        y_lim = get(gca, 'YLim');
        y_lim(1) = 0;
        set(gca, 'YLim', y_lim);
        
        hold off
        ttl = [binned_site_info.info_id{cellNum} ' ch' num2str(binned_site_info.channel(cellNum))];
        title(ttl, 'interpreter', 'none')
        legend(unqLabels, 'Location', 'Best', 'interpreter', 'none')
        
        xlabel('Time, ms')
        %ylabel('Firing Rate, spikes/s')
        
        axis tight
        box on
        
        subplot(1, 2, 2)
        
        hold on
        
        for labNum = 1:length(unqLabels)
            
            currLab = unqLabels{labNum};
            
            currLabId = cellfun(@ (x) isequal(currLab, x), binned_labels.condition_disap{cellNum}, 'UniformOutput', 1);
            
            currMean = mean(B{cellNum}(:, currLabId), 2);
            
            plot(xTimes, currMean', 'LineWidth', 3)
            
        end
        
        xline([1500, 3000, 5000])
        
        % set lower y-lim to zero
        y_lim = get(gca, 'YLim');
        y_lim(1) = 0;
        set(gca, 'YLim', y_lim);
        
        hold off
        ttl = [binned_site_info.info_id{cellNum} ' ch' num2str(binned_site_info.channel(cellNum))];
        title(ttl, 'interpreter', 'none')
        legend(unqLabels, 'Location', 'Best', 'interpreter', 'none')
        
        xlabel('Time, ms')
        %ylabel('Firing Rate, spikes/s')
        
        axis tight
        box on
        
        if cellNum == 1
            % Plot figures in batch mode. Faster than opening a new powerpoint object each time
            ppt = saveppt2(savename, 'init');

            % Create blank title page.
            saveppt2('ppt', ppt,'f',0,'t','Normalized Single Unit Responses in GFS - pulvinar', 'driver', 'meta');
        end
    
    saveppt2('ppt', ppt, 'f', 1)
    
    close(1)
        
    end
    
end

saveppt2(savename, 'ppt', ppt, 'close');
