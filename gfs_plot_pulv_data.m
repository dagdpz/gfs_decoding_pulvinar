% the first attempt to analyze Melanie's data from NIH. Tried to perform
% Pfurtscheller, Lopes da Silva, 1999 analysis using LFPs from all the
% trials filtered in alpha range.

clear all, close all

load('C:\Users\LVasileva\Documents\data\allLFPinclude\20151005_SPKLFP_010606_elvis_gfs1_04.mat')

% take 
all_lfp = LFPSEL.all(:, 1, :);
all_lfp = permute(all_lfp, [1 3 2]);

% SInf = getSesInfo_sorted_lats_J('010606_elvis_gfs1_04')

figure, plot(all_lfp)
hold on
plot(mean(all_lfp, 2), 'w', 'LineWidth', 5)
ylim([-.5 .5])
title('Mean LFP over all the trials')

%% filtering in alpha range

% filter data in alpha range
A = num2cell(all_lfp, 1); % split all_lfp into rows
colFilt = cellfun(@(x) bandFiltFilt(x, 'Sampling Frequency', 1000, 'Low Cut', 8, 'High Cut', 14), A, 'Uniformoutput', 0);
B = [colFilt{:}];

figure, plot(B)
hold on
plot(mean(B, 2), 'w', 'LineWidth', 5)

% calc alpha power
colPower = cellfun(@(x) x.^2, colFilt, 'UniformOutput', 0);
C = [colPower{:}];

figure, plot(mean(C, 2), 'k', 'LineWidth', 3)
ylim([0 .001])

%% 

