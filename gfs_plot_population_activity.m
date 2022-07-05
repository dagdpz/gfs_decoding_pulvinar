clear all, close all

flList = dir('Binned_data_*.mat');

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
    
    % concat neuronal data
    B = cellfun(@transpose, binned_data, 'UniformOutput', false);
    
    % data normalization
    mean_bg = cellfun(@(x) mean2(x(backgroundIDs, :)), B, 'UniformOutput', false);
    std_all = cellfun(@(x) std2(x), B, 'UniformOutput', false);
    B = cellfun(@(x, y, z) (x-y)/z, B, mean_bg, std_all, 'UniformOutput', false);
    
%     % zscore neuronal data
%     [B, x, y] = cellfun(@zscore, B, 'UniformOutput', false);
    
    B = [B{:}];
    
%     % arbitrary units --> spikes/s
%     B = 1000*B;
    
%     % normalize by deviding by the mean background
%     mean_bg = mean(B(backgroundIDs, :));
%     B = bsxfun(@rdivide, B, mean_bg);
    
    % concat labels
    L = cellfun(@transpose, binned_labels.condition_disap, 'UniformOutput', false);
    L = [L{:}];
    
    unqLabels = unique(L);
    
    xTimes = binned_site_info.binning_parameters.the_bin_start_times + ...
        binned_site_info.binning_parameters.the_bin_widths/2;
    
    figure,
    
    hold on
    
    for labNum = 1:length(unqLabels)
        
        currLab = unqLabels{labNum};
        
        currLabId = cellfun(@ (x) isequal(currLab, x), L, 'UniformOutput', 1);
        
        currMean = mean(B(:, currLabId), 2);
        
        plot(xTimes, currMean, 'LineWidth', 3)
        
    end
    
    xline(1500)
    xline(3000)
    xline(5000)
    
    % set lower y-lim to zero
    y_lim = get(gca, 'YLim');
    y_lim(1) = 0;
    set(gca, 'YLim', y_lim);
    
    hold off
    ttl = flList(flNum).name(1:end-4);
    ttl(ttl == '_') = ' ';
    title(ttl)
    legend(unqLabels, 'Location', 'Best', 'interpreter', 'none')
    
    xlabel('Time, ms')
    %ylabel('Firing Rate, spikes/s')
    
    axis tight
    box on
    
    close all
end
