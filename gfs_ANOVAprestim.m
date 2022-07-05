function sites_to_take = ANOVAprestim%(binned_data, binned_labels, binned_site_info);

load('F:\Luba\scripts\ndt_prep\Binned_data_pulvinar_both_250ms_bins_50ms_sampled.mat')
% load(binfile);

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
    
    p(neuNum) = anova1([disap_physical' nodisap_physical'], ...
        [zeros(length(disap_physical), 1)' ones(length(nodisap_physical), 1)'], ...
        'off');
    
end

sites_to_take = find(p >= 0.05);

sites_not_to_take = find(p < 0.05);
%[cor_p, h] = bonf_holm(p, 0.05);
