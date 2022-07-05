clear all, close all

fileList = ... % pulvinar data
    {{'F:\Luba\scripts\ndt_prep\results_generalization_pulvinar_ambiguous-ambiguous\Binned_data_pulvinar_both_250ms_bins_50ms_results.mat', ...
    'F:\Luba\scripts\ndt_prep\results_generalization_pulvinar_ambiguous-physical\Binned_data_pulvinar_both_250ms_bins_50ms_results.mat', ...
    'F:\Luba\scripts\ndt_prep\results_generalization_pulvinar_physical-ambiguous\Binned_data_pulvinar_both_250ms_bins_50ms_results.mat', ...
    'F:\Luba\scripts\ndt_prep\results_generalization_pulvinar_physical-physical\Binned_data_pulvinar_both_250ms_bins_50ms_results.mat'}, ...
    ... % LGN data
    {'F:\Luba\scripts\ndt_prep\results_generalization_LGN_ambiguous-ambiguous\Binned_data_LGN_both_250ms_bins_50ms_results.mat', ...
    'F:\Luba\scripts\ndt_prep\results_generalization_LGN_ambiguous-physical\Binned_data_LGN_both_250ms_bins_50ms_results.mat', ...
    'F:\Luba\scripts\ndt_prep\results_generalization_LGN_physical-ambiguous\Binned_data_LGN_both_250ms_bins_50ms_results.mat', ...
    'F:\Luba\scripts\ndt_prep\results_generalization_LGN_physical-physical\Binned_data_LGN_both_250ms_bins_50ms_results.mat'}, ...
    ... % V4 data
    {'F:\Luba\scripts\ndt_prep\results_generalization_V4_ambiguous-ambiguous\Binned_data_V4_both_250ms_bins_50ms_results.mat', ...
    'F:\Luba\scripts\ndt_prep\results_generalization_V4_ambiguous-physical\Binned_data_V4_both_250ms_bins_50ms_results.mat', ...
    'F:\Luba\scripts\ndt_prep\results_generalization_V4_physical-ambiguous\Binned_data_V4_both_250ms_bins_50ms_results.mat', ...
    'F:\Luba\scripts\ndt_prep\results_generalization_V4_physical-physical\Binned_data_V4_both_250ms_bins_50ms_results.mat'}};

for areaNum = 1:length(fileList)
    
    % load ambiguous-ambiguous
    load(fileList{areaNum}{1})
    
    bin_centers = ...
        DECODING_RESULTS.DS_PARAMETERS.binned_site_info.binning_parameters.the_bin_start_times + ...
        DECODING_RESULTS.DS_PARAMETERS.binned_site_info.binning_parameters.the_bin_widths/2;
    
    ambiguous_ambiguous = DECODING_RESULTS.NORMALIZED_RANK_RESULTS.mean_decoding_results;
    
    clear DECODING_RESULTS
    
    % load ambiguous-physical
    load(fileList{areaNum}{2})
    
    ambiguous_physical = DECODING_RESULTS.NORMALIZED_RANK_RESULTS.mean_decoding_results;
    
    clear DECODING_RESULTS
    
    % load physical-ambiguous
    load(fileList{areaNum}{3})
    
    physical_ambiguous = DECODING_RESULTS.NORMALIZED_RANK_RESULTS.mean_decoding_results;
    
    clear DECODING_RESULTS
    
    
    % load physical-physical
    load(fileList{areaNum}{4})
    
    physical_physical = DECODING_RESULTS.NORMALIZED_RANK_RESULTS.mean_decoding_results;
    
    clear DECODING_RESULTS
    
    figure,
    set(gcf, 'Position', [435 150 1100 942])
    subplot(2, 2, 1)
    imagesc(physical_physical)
    axis xy image
    colormap(jet)
    colorbar
    caxis([0.5 1])
    title('Train Physical - Test Physical')
    set(gca, 'XTick', [28.5 58.5 98.5], 'YTick', [28.5 58.5 98.5])
    xline([28.5 58.5 98.5], 'w')
    yline([28.5 58.5 98.5], 'w')
    set(gca, 'XTickLabel', [1500 3000 5000], 'YTickLabel', [1500 3000 5000])
    xlabel('Time after trial onset, ms')
    ylabel('Time after trial onset, ms')
    
    subplot(2, 2, 2)
    imagesc(physical_ambiguous)
    axis xy image
    colormap(jet)
    caxis([0.5 1])
    title('Train Physical - Test Ambiguous')
    set(gca, 'XTick', [28.5 58.5 98.5], 'YTick', [28.5 58.5 98.5])
    xline([28.5 58.5 98.5], 'w')
    yline([28.5 58.5 98.5], 'w')
    set(gca, 'XTickLabel', [1500 3000 5000], 'YTickLabel', [1500 3000 5000])
    
    subplot(2, 2, 3)
    imagesc(ambiguous_physical)
    axis xy image
    colormap(jet)
    caxis([0.5 1])
    title('Train Ambiguous - Test Physical')
    set(gca, 'XTick', [28.5 58.5 98.5], 'YTick', [28.5 58.5 98.5])
    xline([28.5 58.5 98.5], 'w')
    yline([28.5 58.5 98.5], 'w')
    set(gca, 'XTickLabel', [1500 3000 5000], 'YTickLabel', [1500 3000 5000])
    
    subplot(2, 2, 4)
    imagesc(ambiguous_ambiguous)
    axis xy image
    colormap(jet)
    caxis([0.5 1])
    title('Train Ambiguous - Test Ambiguous')
    set(gca, 'XTick', [28.5 58.5 98.5], 'YTick', [28.5 58.5 98.5])
    xline([28.5 58.5 98.5], 'w')
    yline([28.5 58.5 98.5], 'w')
    set(gca, 'XTickLabel', [1500 3000 5000], 'YTickLabel', [1500 3000 5000])
    
    clear ambiguous_ambiguous ambiguous_physical physical_ambiguous physical_physical
    
end
