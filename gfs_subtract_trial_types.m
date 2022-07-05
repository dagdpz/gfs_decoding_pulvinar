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
    B = cellfun(@transpose, binned_data, 'UniformOutput', false);
%     B = binned_data;
    
    % data normalization
    mean_bg = cellfun(@(x) mean2(x(:, backgroundIDs)), B, 'UniformOutput', false);
    std_all = cellfun(@(x) std2(x), B, 'UniformOutput', false);
    B = cellfun(@(x, y, z) (x-y)/z, B, mean_bg, std_all, 'UniformOutput', false);
    
    % disap_physical label IDs
    disap_physical_ids = cellfun(@(x) strcmp(x, 'disap_physical'), binned_labels.condition_disap, 'UniformOutput', false);
    nodisap_physical_ids = cellfun(@(x) strcmp(x, 'nodisap_physical'), binned_labels.condition_disap, 'UniformOutput', false);
    disap_ambiguous_ids = cellfun(@(x) strcmp(x, 'disap_ambiguous'), binned_labels.condition_disap, 'UniformOutput', false);
    nodisap_ambiguous_ids = cellfun(@(x) strcmp(x, 'nodisap_ambiguous'), binned_labels.condition_disap, 'UniformOutput', false);
    
    % find means by condition
    disap_physical = cellfun(@(x,y) mean(x(:, y), 2), B, disap_physical_ids, 'UniformOutput', false);
    nodisap_physical = cellfun(@(x,y) mean(x(:, y), 2), B, nodisap_physical_ids, 'UniformOutput', false);
    disap_ambiguous = cellfun(@(x,y) mean(x(:, y), 2), B, disap_ambiguous_ids, 'UniformOutput', false);
    nodisap_ambiguous = cellfun(@(x,y) mean(x(:, y), 2), B, nodisap_ambiguous_ids, 'UniformOutput', false);
    
    % concat
    disap_physical = [disap_physical{:}];
    nodisap_physical = [nodisap_physical{:}];
    disap_ambiguous = [disap_ambiguous{:}];
    nodisap_ambiguous = [nodisap_ambiguous{:}];
    
    % plot data after permutation
    [permResp, ~, ~] = permut_lnv(disap_physical', nodisap_physical');
    figure,
    p = plot_permutData(bin_centers, permResp, mean(disap_physical')', mean(nodisap_physical')');
    xline(1500)
    xline(3000)
    xline(5000) 
    legend(p, 'disap_physical', 'nodisap_physical', 'disap_physical - nodisap_physical', 'interpreter', 'none', 'Location', 'Best')
    xlabel('Time after Trial Onset, ms')
    
    % plot 
    [permResp, ~, ~] = permut_lnv(disap_ambiguous', nodisap_ambiguous');
    figure,
    p = plot_permutData(bin_centers, permResp, mean(disap_ambiguous')', mean(nodisap_ambiguous')');
    xline(1500)
    xline(3000)
    xline(5000) 
    legend(p, 'disap_ambiguous', 'nodisap_ambiguous', 'disap_ambiguous - nodisap_ambiguous', 'interpreter', 'none', 'Location', 'Best')
    xlabel('Time after Trial Onset, ms')
    
end
