clear all, close all

data_dir = 'F:\Luba\scripts\lfp_data\';

savedir = '.\lfp_plots\';

flList = dir([data_dir '*.mat']);

for flNum = 1:length(flList)
    
    load([data_dir flList(flNum).name], 'CatchTargRemov', 'TargBotheyes', ...
        'nocatch_disap', 'nocatch_nodisap')
    
    undScrId = find(flList(flNum).name == '_', 2, 'last');
    session_id = flList(flNum).name(5:undScrId(1)-1);
    
    SInf = getSesInfo_sorted_lats_J(session_id);
    
    chId = strfind(flList(flNum).name, 'ch');
    chNum_char = flList(flNum).name(chId-3:chId-2);
    chNum_num = str2double(chNum_char);
    
    % physical disap
    M_phys_disap = mean(CatchTargRemov, 2);
    S_phys_disap = std(CatchTargRemov, [], 2);
    
    % physical nodisap
    M_phys_nodisap = mean(TargBotheyes, 2);
    S_phys_nodisap = std(TargBotheyes, [], 2);
    
    % ambiguous disap
    M_ambiguous_disap = mean(nocatch_disap, 2);
    S_ambiguous_disap = std(nocatch_disap, [], 2);
    
    % ambiguous nodisap
    M_ambiguous_nodisap = mean(nocatch_nodisap, 2);
    S_ambiguous_nodisap = std(nocatch_nodisap, [], 2);
    
    figure('Position', [1 41 1920 1083]),
    subplot(2, 2, 1)
    plot(CatchTargRemov, 'b')
    hold on
    plot(M_phys_disap, 'w', 'LineWidth', 2)
    plot(M_phys_disap + 1.5*S_phys_disap, 'Color', [1 0.6 0], 'LineWidth', 1)
    plot(M_phys_disap - 1.5*S_phys_disap, 'Color', [1 0.6 0], 'LineWidth', 1)
    box on
    xlim([0 6500])
    xline([1500, 3000, 5000])
    title('physical disap')
    
    subplot(2, 2, 2)
    plot(TargBotheyes, 'b')
    hold on
    plot(M_phys_nodisap, 'w', 'LineWidth', 2)
    plot(M_phys_nodisap + 1.5*S_phys_nodisap, 'Color', [1 0.6 0], 'LineWidth', 1)
    plot(M_phys_nodisap - 1.5*S_phys_nodisap, 'Color', [1 0.6 0], 'LineWidth', 1)
    box on
    xlim([0 6500])
    xline([1500, 3000, 5000])
    title('physical nodisap')
    
    subplot(2, 2, 3)
    plot(nocatch_disap, 'b')
    hold on
    plot(M_ambiguous_disap, 'w', 'LineWidth', 2)
    plot(M_ambiguous_disap + 1.5*S_ambiguous_disap, 'Color', [1 0.6 0], 'LineWidth', 1)
    plot(M_ambiguous_disap - 1.5*S_ambiguous_disap, 'Color', [1 0.6 0], 'LineWidth', 1)
    box on
    xlim([0 6500])
    xline([1500, 3000, 5000])
    title('ambiguous disap')
    
    subplot(2, 2, 4)
    plot(nocatch_nodisap, 'b')
    hold on
    plot(M_ambiguous_nodisap, 'w', 'LineWidth', 2)
    plot(M_ambiguous_nodisap + 1.5*S_ambiguous_nodisap, 'Color', [1 0.6 0], 'LineWidth', 1)
    plot(M_ambiguous_nodisap - 1.5*S_ambiguous_nodisap, 'Color', [1 0.6 0], 'LineWidth', 1)
    box on
    xlim([0 6500])
    xline([1500, 3000, 5000])
    title('ambiguous nodisap')
    
    sgtitle([session_id ', ch' chNum_char ', area' num2str(SInf.area(chNum_num)) ', unitqual' num2str(SInf.unitqual(chNum_num))], 'interpreter', 'none')
    
    savename = [savedir session_id '_ch' chNum_char '.jpg'];
    
    saveas(1, savename)
    close(1)
    
end
