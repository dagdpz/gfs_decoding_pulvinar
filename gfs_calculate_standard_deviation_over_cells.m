clear all, close all

flList = dir('Binned_data_*.mat');

for flNum = [31]%1:length(flList) % [28, 31, 34]
    
    load(flList(flNum).name)
    
    bin_centers = binned_site_info.binning_parameters.the_bin_start_times + ...
        binned_site_info.binning_parameters.the_bin_widths/2;
    
    backgroundIDs = bin_centers <= 2750 & bin_centers >= 1750;
    
    binned_data = binned_data(neurons2take);
    
    binned_labels.disap_nodisap = binned_labels.disap_nodisap(neurons2take);
    binned_labels.condition = binned_labels.condition(neurons2take);
    binned_labels.condition_disap = binned_labels.condition_disap(neurons2take);
    
%     % transpose neuronal data
%     B = cellfun(@transpose, binned_data, 'UniformOutput', false);
    B = binned_data;

    % data normalization
    mean_bg = cellfun(@(x) mean2(x(:, backgroundIDs)), B, 'UniformOutput', false);
    std_all = cellfun(@(x) std2(x), B, 'UniformOutput', false);
    B = cellfun(@(x, y, z) (x-y)/z, B, mean_bg, std_all, 'UniformOutput', false);
    
    B = cellfun(@mean, B, 'UniformOutput', false);
    B = cellfun(@transpose, B, 'UniformOutput', false);
    B = [B{:}];
    
    % calculate standard dev
    stdev = std(B, [], 2);
    M = mean(B, 2);
    upperM = M + stdev;
    lowerM = M - stdev;
    
    figure,
    
    fill([bin_centers fliplr(bin_centers) bin_centers(1)], 3*[upperM' fliplr(lowerM') upperM(1)], 'b', 'FaceAlpha', .15, 'EdgeColor', 'none')
    hold on
    plot(bin_centers, B)
    plot(bin_centers, M, 'w', 'LineWidth', 3)
    
    xlabel('Time after Trial Onset, ms')
    
    
    figure,
    fill([bin_centers fliplr(bin_centers) bin_centers(1)], [upperM' fliplr(lowerM') upperM(1)], 'b', 'FaceAlpha', .15, 'EdgeColor', 'none')
    hold on
    plot(bin_centers, M, 'b', 'LineWidth', 1.5)
    
    xlabel('Time after Trial Onset, ms')
end
