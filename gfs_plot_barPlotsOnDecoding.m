clear all, close all

%% plot response vs. noResponse normalized rank results

respDir = 'F:\Luba\scripts\ndt_prep\results_pulvinar_response\shuff\';
noRespDir = 'F:\Luba\scripts\ndt_prep\results_pulvinar_noResponse\shuff\';

load('F:\Luba\scripts\ndt_prep\results_pulvinar_response\Binned_data_pulvinar_response_250ms_bins_50ms_results.mat')
barValues(1) = DECODING_RESULTS.NORMALIZED_RANK_RESULTS.mean_decoding_results(114);
xTimes = ...
    DECODING_RESULTS.DS_PARAMETERS.binned_site_info.binning_parameters.the_bin_start_times - ...
    DECODING_RESULTS.DS_PARAMETERS.binned_site_info.binning_parameters.the_bin_widths/2;

respList = dir([respDir '*.mat']);

ci_resp = zeros(length(respList), 1);
for respNum = 1:length(respList)
    
    load([respDir respList(respNum).name])
    
    ci_resp(respNum) = DECODING_RESULTS.NORMALIZED_RANK_RESULTS.mean_decoding_results(114);
    
end

ci_resp_min = min(ci_resp);
ci_resp_max = max(ci_resp);

load('F:\Luba\scripts\ndt_prep\results_pulvinar_noResponse\Binned_data_pulvinar_noResponse_250ms_bins_50ms_results.mat')
barValues(2) = DECODING_RESULTS.NORMALIZED_RANK_RESULTS.mean_decoding_results(114);

noRespList = dir([noRespDir '*.mat']);

ci_noresp = zeros(length(noRespList), 1);
for noRespNum = 1:length(noRespList)
    
    load([noRespDir noRespList(noRespNum).name])
    
    ci_noresp(noRespNum) = DECODING_RESULTS.NORMALIZED_RANK_RESULTS.mean_decoding_results(114);
    
end

ci_noresp_min = min(ci_noresp);
ci_noresp_max = max(ci_noresp);

figure
plot([1 2], [ci_resp ci_noresp], 'bo')
xlim([0 3])
ylim([0 1])
hold on
plot([1 2], barValues, 'r*')
plot([0 4], [0.5 0.5], 'k')
set(gca, 'XTick', [1 2], 'XTickLabel', {'responsive', 'non-responsive'})
ylabel('Decoding accuracy')


%% plot decoding from ambiguous condition eyemodi = [0 1] (LGN, V4, pulvinar)

load('F:\Luba\scripts\ndt_prep\results_LGN_ambiguous\Binned_data_LGN_ambiguous_250ms_bins_50ms_results.mat')
LGN = DECODING_RESULTS;

load('F:\Luba\scripts\ndt_prep\results_V4_ambiguous\Binned_data_V4_ambiguous_250ms_bins_50ms_results.mat')
V4 = DECODING_RESULTS;

load('F:\Luba\scripts\ndt_prep\results_pulvinar_ambiguous\Binned_data_pulvinar_ambiguous_250ms_bins_50ms_results.mat')
pulvinar = DECODING_RESULTS;






