clear all, close all
% Check data analysis steps

datafile = 'Binned_data_pulvinar_both_250ms_bins_50ms_sampled.mat';

load(datafile);

currSession = cellfun(@(x) strcmp(x, '050606_elvis_gfs2-04'), binned_site_info.info_id, 'Uniformoutput', 1);
currSession = find(currSession);

bin_centers = ...
    binned_site_info.binning_parameters.the_bin_start_times + ...
    binned_site_info.binning_parameters.the_bin_widths/2;

for flNum = currSession
    
    currData = binned_data{flNum};
    
    unqLabels = unique(binned_labels.condition_disap{flNum});
    
    lab1 = cellfun(@(x) strcmp(x, unqLabels{1}), binned_labels.condition_disap{flNum}, 'Uniformoutput', 1);
    lab2 = cellfun(@(x) strcmp(x, unqLabels{2}), binned_labels.condition_disap{flNum}, 'Uniformoutput', 1);
    lab3 = cellfun(@(x) strcmp(x, unqLabels{3}), binned_labels.condition_disap{flNum}, 'Uniformoutput', 1);
    lab4 = cellfun(@(x) strcmp(x, unqLabels{4}), binned_labels.condition_disap{flNum}, 'Uniformoutput', 1);
    
    c1 = mean(binned_data{flNum}(lab1, :));
    c2 = mean(binned_data{flNum}(lab2, :));
    c3 = mean(binned_data{flNum}(lab3, :));
    c4 = mean(binned_data{flNum}(lab4, :));
    
    figure,
    plot(bin_centers, [c1; c2; c3; c4])
    xline([1500 3000 5000])
    xlim([0 6500])
    title(['050606_elvis_gfs2-04 ch ' num2str(binned_site_info.channel(flNum))], 'interpreter', 'none')
    legend(unqLabels, 'Location', 'Best', 'interpreter', 'none')
end

