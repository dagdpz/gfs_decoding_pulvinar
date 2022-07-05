clear all, close all

load('F:\Luba\scripts\ndt_prep\Binned_data_pulvinar_both_250ms_bins_50ms_sampled.mat')

binned_data = cellfun(@ (x) 1000*x, binned_data, 'Uniformoutput', 0);

disap_physical_median = zeros(length(binned_data), 1);
nodisap_physical_median = zeros(length(binned_data), 1);

for neuNum = 1:length(binned_data)
    
    bin_centers = binned_site_info.binning_parameters.the_bin_start_times + ...
        binned_site_info.binning_parameters.the_bin_widths/2;
    
    unqConditions = unique(binned_labels.condition_disap{neuNum});
    
    disap_physical_ids = ...
        cellfun(@ (x) strcmp(x, 'disap_physical'), binned_labels.condition_disap{neuNum});
    
    nodisap_physical_ids = ...
        cellfun(@ (x) strcmp(x, 'nodisap_physical'), binned_labels.condition_disap{neuNum});
    
    disap_physical = binned_data{neuNum}(disap_physical_ids, ...
        bin_centers <= 2750 & bin_centers >= 1750);
    
    nodisap_physical = binned_data{neuNum}(nodisap_physical_ids, ...
        bin_centers <= 2750 & bin_centers >= 1750);
    
    disap_physical = mean(disap_physical, 2);
    
    nodisap_physical = mean(nodisap_physical, 2);
    
    % calc median
    disap_physical_median(neuNum) = median(disap_physical);
    nodisap_physical_median(neuNum) = median(nodisap_physical);
    
end

figure, scatter(disap_physical_median, nodisap_physical_median, '.')
axis square
hold on
plot([0 700], [0 700], 'r')
box on
xlabel('Firing Rate in Disap Trials, spikes/s')
ylabel('Firing Rate in NoDisap Trials, spikes/s')
title('Baseline Firing Rates in Physical Condition (GFS)')
