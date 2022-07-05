function ANOVAprestim_plot%(binned_data, binned_labels, binned_site_info);

savename = 'test1.ppt';

load('F:\Luba\scripts\ndt_prep\Binned_data_pulvinar_both_250ms_bins_50ms_sampled.mat')

binned_data = cellfun(@ (x) 1000*x, binned_data, 'Uniformoutput', 0);

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
    disap_physical_median = median(disap_physical);
    nodisap_physical_median = median(nodisap_physical);
    
    % calc Q1
    disap_physical_q1 = quantile(disap_physical, 0.25);
    nodisap_physical_q1 = quantile(nodisap_physical, 0.25);
    
    % calc Q3
    disap_physical_q3 = quantile(disap_physical, 0.75);
    nodisap_physical_q3 = quantile(nodisap_physical, 0.75);
    
    % calc outlier thresholds: +/- 1.5*IQR
    disap_physical_lTreshold = disap_physical_q1 - 1.5*iqr(disap_physical);
    nodisap_physical_lTreshold = disap_physical_q1 - 1.5*iqr(disap_physical);
    
    disap_physical_uTreshold = disap_physical_q3 + 1.5*iqr(disap_physical);
    nodisap_physical_uTreshold = disap_physical_q3 + 1.5*iqr(nodisap_physical);
    
    figure(1)
    % disap_physical
    hold on
    plot(1, disap_physical_median, 'r.', 'MarkerSize', 40)
    plot([0.9 1.1], [disap_physical_q1 disap_physical_q1], 'b')
    plot([0.9 1.1], [disap_physical_q3 disap_physical_q3], 'b')
    plot([0.9 1.1], [disap_physical_lTreshold disap_physical_lTreshold], 'g')
    plot([0.9 1.1], [disap_physical_uTreshold disap_physical_uTreshold], 'g')
    plot(1, disap_physical, 'k.', 'MarkerSize', 10)
    
    % nodisap_physical
    hold on
    plot(2, nodisap_physical_median, 'r.', 'MarkerSize', 40)
    plot([1.9 2.1], [nodisap_physical_q1 nodisap_physical_q1], 'b')
    plot([1.9 2.1], [nodisap_physical_q3 nodisap_physical_q3], 'b')
    plot([1.9 2.1], [disap_physical_lTreshold disap_physical_lTreshold], 'g')
    plot([1.9 2.1], [disap_physical_uTreshold disap_physical_uTreshold], 'g')
    plot(2, nodisap_physical, 'k.', 'MarkerSize', 10)
    
    set(gca, 'XTick', [1 2])
    set(gca, 'XTickLabel', {['disap: N = ' num2str(length(disap_physical))], ['nodisap: N = ' num2str(length(nodisap_physical))]})
    
    xlim([0 3])
    
    title([binned_site_info.info_id{neuNum} ' Mean Firing Rates within 1750-2750 ms'], 'interpreter', 'none')
    
    if neuNum == 1
        % Plot figures in batch mode. Faster than opening a new powerpoint object each time
        ppt = saveppt2(savename, 'init');

        % Create blank title page.
        saveppt2('ppt', ppt, 'f', 0, 't', 'Background firing rates', 'driver', 'meta');
    end
    
    saveppt2('ppt', ppt, 'f', 1)
    
    close(1)

end

saveppt2(savename, 'ppt', ppt, 'close');

%sites_to_take = find(p >= 0.05);

%sites_not_to_take = find(p < 0.05);
%[cor_p, h] = bonf_holm(p, 0.05);
