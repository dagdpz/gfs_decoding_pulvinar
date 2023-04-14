clear all, close all

fileList = ...
    {'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\results_pulvinar_matchUnits_ambiguous_spk_cvsplits14\Binned_data_pulvinar_matchUnits_ambiguous_spk_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\results_pulvinar_matchUnits_ambiguous_alpha_cvsplits14\Binned_data_pulvinar_matchUnits_ambiguous_alpha_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\results_pulvinar_matchUnits_ambiguous_beta_cvsplits14\Binned_data_pulvinar_matchUnits_ambiguous_beta_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\results_pulvinar_matchUnits_ambiguous_gamma1_cvsplits14\Binned_data_pulvinar_matchUnits_ambiguous_gamma1_250ms_bins_50ms_results', ...
    'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\results_pulvinar_matchUnits_ambiguous_gamma2_cvsplits14\Binned_data_pulvinar_matchUnits_ambiguous_gamma2_250ms_bins_50ms_results'}; % mua, alpha, beta, gamma1, gamma2

decoding_accuracies = [];

for flNum = 1:length(fileList)
    
    load(fileList{flNum}, 'DECODING_RESULTS')
    
    decoding_accuracies(:, flNum) = diag(DECODING_RESULTS.ZERO_ONE_LOSS_RESULTS.mean_decoding_results);
    
    clear DECODING_RESULTS
    
end

% imshow(decoding_accuracies', 'Interpolation', 'linear')
% colormap jet
% caxis([0.5 1])

imagesc(decoding_accuracies')
colormap jet
colorbar, caxis([0.5 1])
set(gca, 'YTick', [1:5])
set(gca, 'YTickLabel', {'spk', 'alpha', 'beta', 'gamma1', 'gamma2'})



