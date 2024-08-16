function [lfp_pfsi] = pfurtscheller_daSilva(lfp, low_cut, high_cut)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

A = num2cell(lfp, 1); % split all_lfp into rows
A = cellfun(@(x) bandFiltFilt(x, 'Sampling Frequency', 1000, 'Low Cut', low_cut, 'High Cut', high_cut), A, 'Uniformoutput', 0);

% calc alpha power
A = cellfun(@(x) x.^2, A, 'UniformOutput', 0);
lfp_pfsi = [A{:}];

end

