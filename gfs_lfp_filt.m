function [out] = lfp_filt(lfp, low_cut, high_cut)

A = num2cell(lfp, 1); % split all_lfp into rows
A = cellfun(@(x) bandFiltFilt(x, 'Sampling Frequency', 1000, 'Low Cut', low_cut, 'High Cut', high_cut), A, 'Uniformoutput', 0);

out = [A{:}];

end
