clear all, close all

preTarget.start = 2001;
preTarget.end = 3000;

preSurround.start = 4001;
preSurround.end = 5000;

afterSurround.start = 5301;
afterSurround.end = 6300;

load('Results_pulvinar_ambiguous_250ms_bins_50ms_sampled.mat')

mean_accuracy.pulvinar = ...
    diag(DECODING_RESULTS.NORMALIZED_RANK_RESULTS.mean_decoding_results, 0);
clear DECODING_RESULTS

load('Results_V4_ambiguous_250ms_bins_50ms_sampled.mat')

mean_accuracy.V4 = ...
    diag(DECODING_RESULTS.NORMALIZED_RANK_RESULTS.mean_decoding_results, 0);
clear DECODING_RESULTS

load('Results_LGN_ambiguous_250ms_bins_50ms_sampled.mat')

mean_accuracy.LGN = ...
    diag(DECODING_RESULTS.NORMALIZED_RANK_RESULTS.mean_decoding_results, 0);

bin_centers = ...
    DECODING_RESULTS.DS_PARAMETERS.binned_site_info.binning_parameters.the_bin_start_times + ...
    DECODING_RESULTS.DS_PARAMETERS.binned_site_info.binning_parameters.the_bin_widths/2;
clear DECODING_RESULTS

preTarget.id = bin_centers > preTarget.start & bin_centers < preTarget.end;
preSurround.id = bin_centers > preSurround.start & bin_centers < preSurround.end;
afterSurround.id = bin_centers > afterSurround.start & bin_centers < afterSurround.end;

% pretarget data
preTarget.data.pulvinar = mean_accuracy.pulvinar(preTarget.id);
preTarget.data.V4 = mean_accuracy.V4(preTarget.id);
preTarget.data.LGN = mean_accuracy.LGN(preTarget.id);

preTarget.data.mean_pulvinar = mean(preTarget.data.pulvinar);
preTarget.data.mean_V4 = mean(preTarget.data.V4);
preTarget.data.mean_LGN = mean(preTarget.data.LGN);

preTarget.data.std_pulvinar = std(preTarget.data.pulvinar);
preTarget.data.std_V4 = std(preTarget.data.V4);
preTarget.data.std_LGN = std(preTarget.data.LGN);

% presurround data
preSurround.data.pulvinar = mean_accuracy.pulvinar(preSurround.id);
preSurround.data.V4 = mean_accuracy.V4(preSurround.id);
preSurround.data.LGN = mean_accuracy.LGN(preSurround.id);

preSurround.data.mean_pulvinar = mean(preSurround.data.pulvinar);
preSurround.data.mean_V4 = mean(preSurround.data.V4);
preSurround.data.mean_LGN = mean(preSurround.data.LGN);

preSurround.data.std_pulvinar = std(preSurround.data.pulvinar);
preSurround.data.std_V4 = std(preSurround.data.V4);
preSurround.data.std_LGN = std(preSurround.data.LGN);

% aftersurround data
afterSurround.data.pulvinar = mean_accuracy.pulvinar(afterSurround.id);
afterSurround.data.V4 = mean_accuracy.V4(afterSurround.id);
afterSurround.data.LGN = mean_accuracy.LGN(afterSurround.id);

afterSurround.data.mean_pulvinar = mean(afterSurround.data.pulvinar);
afterSurround.data.mean_V4 = mean(afterSurround.data.V4);
afterSurround.data.mean_LGN = mean(afterSurround.data.LGN);

afterSurround.data.std_pulvinar = std(afterSurround.data.pulvinar);
afterSurround.data.std_V4 = std(afterSurround.data.V4);
afterSurround.data.std_LGN = std(afterSurround.data.LGN);

data = [preTarget.data.mean_LGN, preTarget.data.mean_V4, preTarget.data.mean_pulvinar; ...
    preSurround.data.mean_LGN, preSurround.data.mean_V4, preSurround.data.mean_pulvinar; ...
    afterSurround.data.mean_LGN, afterSurround.data.mean_V4, afterSurround.data.mean_pulvinar];

err = [preTarget.data.std_LGN, preTarget.data.std_V4, preTarget.data.std_pulvinar; ...
    preSurround.data.std_LGN, preSurround.data.std_V4, preSurround.data.std_pulvinar; ...
    afterSurround.data.std_LGN, afterSurround.data.std_V4, afterSurround.data.std_pulvinar];

figure
b = bar(data);
hold on

ngroups = 3;
nbars = 3;
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, data(:,i), err(:,i), 'k.');
end
hold off

xlabel('Period of Time')
ylabel('Decoding Accuracy')
ylim([0 1])
set(gca, 'XTickLabel', {'Pre-Stimulus', 'Pre-Surround', 'After-Surround'})
legend('LGN', 'V4', 'pulvinar', '+/- 1 St.Dev.', 'Location', 'best')
