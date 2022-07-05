function neurons = neurons2take
% This function imports binned data for pulvinar and generates output with
% indices of neurons with baseline FR below 100 Hz and with FR_disap /
% FR_nodisap close to one

load('F:\Luba\scripts\ndt_prep\Binned_data_pulvinar_both_250ms_bins_50ms_sampled.mat')

bin_centers = binned_site_info.binning_parameters.the_bin_start_times - ...
    binned_site_info.binning_parameters.the_bin_widths/2;

currTimeIds = bin_centers > 1500 & bin_centers < 3000;

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

st_dev = cellfun(@(x) std2(x(currTimeIds, :)), binned_data);

constant_background = st_dev < median(st_dev) + 1.5*iqr(st_dev);

FRdisap_by_FRnodisap = ...
    (disap_physical_median - nodisap_physical_median) ./ ...
    (disap_physical_median + nodisap_physical_median);

below100 = disap_physical_median < 100;
equalFR = ...
    FRdisap_by_FRnodisap > nanmedian(FRdisap_by_FRnodisap) - 1.5*iqr(FRdisap_by_FRnodisap) & ...
    FRdisap_by_FRnodisap < nanmedian(FRdisap_by_FRnodisap) + 1.5*iqr(FRdisap_by_FRnodisap);

neurons = below100 & equalFR & constant_background';
