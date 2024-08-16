clear all, close all

load('lfp_results2.mat', 'lfp_CatchTargRemov', 'CatchTargRemov')

A = num2cell(lfp_CatchTargRemov, 1);
cols2take = cellfun(@(x) sum(x < 0.4 & x > -0.4) == 6500, A, 'Uniformoutput', 1);
clear A

CatchTargRemov = CatchTargRemov(:, cols2take);


load('lfp_results2.mat', 'lfp_nocatch_disap', 'nocatch_disap')

B = num2cell(lfp_nocatch_disap, 1);
cols2take = cellfun(@(x) sum(x < 0.4 & x > -0.4) == 6500, B, 'Uniformoutput', 1);
clear B

nocatch_disap = nocatch_disap(:, cols2take);



load('lfp_results2.mat', 'lfp_nocatch_nodisap', 'nocatch_nodisap')

C = num2cell(lfp_nocatch_nodisap, 1);
cols2take = cellfun(@(x) sum(x < 0.4 & x > -0.4) == 6500, C, 'Uniformoutput', 1);
clear B

nocatch_nodisap = nocatch_nodisap(:, cols2take);


figure,
plot(mean(CatchTargRemov,2), 'b')
hold on
plot(mean(nocatch_disap, 2), 'g')
plot(mean(nocatch_nodisap, 2), 'r')
legend('CatchTargRemov', 'nocatch_disap', 'nocatch_nodisap')
