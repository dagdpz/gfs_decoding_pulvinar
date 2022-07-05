clear all, close all

%load('F:\Luba\scripts\ndt_prep\Binned_data_pulvinar_both_250ms_bins_50ms_sampled.mat')
% load('F:\Luba\scripts\ndt_prep\Binned_data_LGN_both_250ms_bins_50ms_sampled.mat')
load('F:\Luba\scripts\ndt_prep\Binned_data_V4_both_250ms_bins_50ms_sampled.mat')

% calculate bin centers for plotting
bin_centers = binned_site_info.binning_parameters.the_bin_start_times + ...
    binned_site_info.binning_parameters.the_bin_widths/2;

% background time
backgroundIDs = bin_centers <= 2750 & bin_centers >= 1750;

% target time
target_timecourse = bin_centers <= 4000 & bin_centers >= 3000+250;

% GFS response
gfs_timecourse = bin_centers <= 6000 & bin_centers >= 5000+250;

binned_data = cellfun(@ (x) 1000*x, binned_data, 'Uniformoutput', 0);

% choose needed neurons
%binned_data = binned_data(neurons2take);
%binned_labels.disap_nodisap = binned_labels.disap_nodisap(neurons2take);
%binned_labels.condition = binned_labels.condition(neurons2take);
%binned_labels.condition_disap = binned_labels.condition_disap(neurons2take);

% data normalization
mean_bg = cellfun(@(x) mean2(x(:, backgroundIDs)), binned_data, 'UniformOutput', false);
std_all = cellfun(@(x) std2(x), binned_data, 'UniformOutput', false);
binned_data = cellfun(@(x, y, z) (x-y)/z, binned_data, mean_bg, std_all, 'UniformOutput', false);

disap_physical_median = zeros(length(binned_data), 1);
nodisap_physical_median = zeros(length(binned_data), 1);

for neuNum = 1:length(binned_data)
    
    % figure out unique conditions that we have
    unqConditions = unique(binned_labels.condition_disap{neuNum});
    
    % figure out indices for specific confitions
    disap_physical_ids = ...
        cellfun(@ (x) strcmp(x, 'disap_physical'), ...
        binned_labels.condition_disap{neuNum});
    
    nodisap_physical_ids = ...
        cellfun(@ (x) strcmp(x, 'nodisap_physical'), ...
        binned_labels.condition_disap{neuNum});
    
    disap_ambiguous_ids = ...
        cellfun(@ (x) strcmp(x, 'disap_ambiguous'), ...
        binned_labels.condition_disap{neuNum});
    
    nodisap_ambiguous_ids = ...
        cellfun(@ (x) strcmp(x, 'nodisap_ambiguous'), ...
        binned_labels.condition_disap{neuNum});
    
    % calculate average responses on target
    target.disap_physical(neuNum) = ...
        mean2(binned_data{neuNum}(disap_physical_ids, target_timecourse)) - ...
        mean2(binned_data{neuNum}(disap_physical_ids, backgroundIDs));
    target.nodisap_physical(neuNum) = ...
        mean2(binned_data{neuNum}(nodisap_physical_ids, target_timecourse)) - ...
        mean2(binned_data{neuNum}(disap_physical_ids, backgroundIDs));
    target.disap_ambiguous(neuNum) = ...
        mean2(binned_data{neuNum}(disap_ambiguous_ids, target_timecourse)) - ...
        mean2(binned_data{neuNum}(disap_physical_ids, backgroundIDs));
    target.nodisap_ambiguous(neuNum) = ...
        mean2(binned_data{neuNum}(nodisap_ambiguous_ids, target_timecourse)) - ...
        mean2(binned_data{neuNum}(disap_physical_ids, backgroundIDs));
    
    % calculate averga reponses after surround onset
    gfs.disap_physical(neuNum) = ...
        mean2(binned_data{neuNum}(disap_physical_ids, gfs_timecourse)) - ...
        mean2(binned_data{neuNum}(disap_physical_ids, backgroundIDs));
    gfs.nodisap_physical(neuNum) = ...
        mean2(binned_data{neuNum}(nodisap_physical_ids, gfs_timecourse)) - ...
        mean2(binned_data{neuNum}(disap_physical_ids, backgroundIDs));
    gfs.disap_ambiguous(neuNum) = ...
        mean2(binned_data{neuNum}(disap_ambiguous_ids, gfs_timecourse)) - ...
        mean2(binned_data{neuNum}(disap_physical_ids, backgroundIDs));
    gfs.nodisap_ambiguous(neuNum) = ...
        mean2(binned_data{neuNum}(nodisap_ambiguous_ids, gfs_timecourse)) - ...
        mean2(binned_data{neuNum}(disap_physical_ids, backgroundIDs));
    
%     disap_physical = binned_data{neuNum}(disap_physical_ids, ...
%         bin_centers <= 2750 & bin_centers >= 1750);
%     
%     nodisap_physical = binned_data{neuNum}(nodisap_physical_ids, ...
%         bin_centers <= 2750 & bin_centers >= 1750);
%     
%     disap_physical = mean(disap_physical, 2);
%     
%     nodisap_physical = mean(nodisap_physical, 2);
%     
%     % calc median
%     disap_physical_median(neuNum) = median(disap_physical);
%     nodisap_physical_median(neuNum) = median(nodisap_physical);
    
end

% plot responses to target
% 1
figure
h = scatterhist(target.disap_physical, target.nodisap_physical, ...
    'Direction', 'out', 'Kernel', 'overlay', 'Marker', '.');
hold(h(1), 'on')
p(1) = plot([-2 2], [-2 2], 'r', 'Parent', h(1));
slope = median(target.disap_physical ./ target.nodisap_physical);
p(2) = plot([-2 2], slope*[-2 2], 'b', 'Parent', h(1));
title('Physical: disap vs. nodisap')
xlim([-2 2])
ylim([-2 2])
xlabel('disap_physical', 'interpreter', 'none')
ylabel('nodisap_physical', 'interpreter', 'none')
axis square
legend(p, 'Slope = 1', ['Slope = ' num2str(slope)], 'Location', 'Best')
box on

% 2
figure
h = scatterhist(target.disap_ambiguous, target.nodisap_ambiguous, ...
    'Direction', 'out', 'Kernel', 'overlay', 'Marker', '.');
hold(h(1), 'on')
p(1) = plot([-2 2], [-2 2], 'r', 'Parent', h(1));
slope = median(target.disap_ambiguous ./ target.nodisap_ambiguous);
p(2) = plot([-2 2], slope*[-2 2], 'b', 'Parent', h(1));
title('Ambiguous: disap vs. nodisap')
xlim([-2 2])
ylim([-2 2])
xlabel('disap_ambiguous', 'interpreter', 'none')
ylabel('nodisap_ambiguous', 'interpreter', 'none')
axis square
legend(p, 'Slope = 1', ['Slope = ' num2str(slope)], 'Location', 'Best')
box on

% 3
figure
h = scatterhist(target.disap_physical, target.disap_ambiguous, ...
    'Direction', 'out', 'Kernel', 'overlay', 'Marker', '.');
hold(h(1), 'on')
p(1) = plot([-2 2], [-2 2], 'r', 'Parent', h(1));
slope = median(target.disap_physical ./ target.disap_ambiguous);
p(2) = plot([-2 2], slope*[-2 2], 'b', 'Parent', h(1));
title('Disap: physical vs. ambiguous')
xlim([-2 2])
ylim([-2 2])
xlabel('disap_physical', 'interpreter', 'none')
ylabel('disap_ambiguous', 'interpreter', 'none')
axis square
legend(p, 'Slope = 1', ['Slope = ' num2str(slope)], 'Location', 'Best')
box on

% 4
figure
h = scatterhist(target.nodisap_physical, target.nodisap_ambiguous, ...
    'Direction', 'out', 'Kernel', 'overlay', 'Marker', '.');
hold(h(1), 'on')
p(1) = plot([-2 2], [-2 2], 'r', 'Parent', h(1));
slope = median(target.nodisap_physical ./ target.nodisap_ambiguous);
p(2) = plot([-2 2], slope*[-2 2], 'b', 'Parent', h(1));
title('Nodisap: physical vs. ambiguous')
xlim([-2 2])
ylim([-2 2])
xlabel('nodisap_physical', 'interpreter', 'none')
ylabel('nodisap_ambiguous', 'interpreter', 'none')
axis square
legend(p, 'Slope = 1', ['Slope = ' num2str(slope)], 'Location', 'Best')
box on

% plot responses to gfs
% 5
figure
h = scatterhist(gfs.disap_physical, gfs.nodisap_physical, ...
    'Direction', 'out', 'Kernel', 'overlay', 'Marker', '.');
hold(h(1), 'on')
p(1) = plot([-2 2], [-2 2], 'r', 'Parent', h(1));
slope = median(gfs.disap_physical ./ gfs.nodisap_physical);
p(2) = plot([-2 2], slope*[-2 2], 'b', 'Parent', h(1));
title('Physical: disap vs. nodisap')
xlim([-2 2])
ylim([-2 2])
xlabel('disap_physical', 'interpreter', 'none')
ylabel('nodisap_physical', 'interpreter', 'none')
axis square
legend(p, 'Slope = 1', ['Slope = ' num2str(slope)], 'Location', 'Best')
box on

% 6
figure
h = scatterhist(gfs.disap_ambiguous, gfs.nodisap_ambiguous, ...
    'Direction', 'out', 'Kernel', 'overlay', 'Marker', '.');
hold(h(1), 'on')
p(1) = plot([-2 2], [-2 2], 'r', 'Parent', h(1));
slope = median(gfs.disap_ambiguous ./ gfs.nodisap_ambiguous);
p(2) = plot([-2 2], slope*[-2 2], 'b', 'Parent', h(1));
title('Ambiguous: disap vs. nodisap')
xlim([-2 2])
ylim([-2 2])
xlabel('disap_ambiguous', 'interpreter', 'none')
ylabel('nodisap_ambiguous', 'interpreter', 'none')
axis square
legend(p, 'Slope = 1', ['Slope = ' num2str(slope)], 'Location', 'Best')
box on

% 7
figure
h = scatterhist(gfs.disap_physical, gfs.disap_ambiguous, ...
    'Direction', 'out', 'Kernel', 'overlay', 'Marker', '.');
hold(h(1), 'on')
p(1) = plot([-2 2], [-2 2], 'r', 'Parent', h(1));
slope = median(gfs.disap_physical ./ gfs.disap_ambiguous);
p(2) = plot([-2 2], slope*[-2 2], 'b', 'Parent', h(1));
title('Disap: physical vs. ambiguous')
xlim([-2 2])
ylim([-2 2])
xlabel('disap_physical', 'interpreter', 'none')
ylabel('disap_ambiguous', 'interpreter', 'none')
axis square
legend(p, 'Slope = 1', ['Slope = ' num2str(slope)], 'Location', 'Best')
box on

% 8
figure
h = scatterhist(gfs.nodisap_physical, gfs.nodisap_ambiguous, ...
    'Direction', 'out', 'Kernel', 'overlay', 'Marker', '.');
hold(h(1), 'on')
p(1) = plot([-2 2], [-2 2], 'r', 'Parent', h(1));
slope = median(gfs.nodisap_physical ./ gfs.nodisap_ambiguous);
p(2) = plot([-2 2], slope*[-2 2], 'b', 'Parent', h(1));
title('Nodisap: physical vs. ambiguous')
xlim([-2 2])
ylim([-2 2])
xlabel('nodisap_physical', 'interpreter', 'none')
ylabel('nodisap_ambiguous', 'interpreter', 'none')
axis square
legend(p, 'Slope = 1', ['Slope = ' num2str(slope)], 'Location', 'Best')
box on
