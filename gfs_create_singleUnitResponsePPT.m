function gfs_create_singleUnitResponsePPT(filename, dataSet)
% 

% set current folder
cd(['..\' dataSet])

% raw GFS data path
if strcmp(dataSet, 'GFS_NIH')
    gfs_path = 'C:\Users\lvasileva\Documents\Luba\data\allLFPinclude\';
elseif strcmp(dataSet, 'GFS_Tuebingen')
    gfs_path = 'C:\Users\lvasileva\Documents\Luba\data\collaboration_Tuebfiles\2023_LFP\';
    gfs_path_mua = 'C:\Users\lvasileva\Documents\Luba\data\collaboration_Tuebfiles\230606_MUAGFS\';
end

% define brain area
if contains(filename, 'LGN')
    brainArea = 'LGN';
elseif contains(filename, 'V1_')
    brainArea = 'V1';
elseif contains(filename, 'V2_')
    brainArea = 'V2';
elseif contains(filename, 'V1&2_')
    brainArea = 'V1&2';
elseif contains(filename, 'V4')
    brainArea = 'V4';
elseif contains(filename, 'pulvinar')
    brainArea = 'pulvinar';
end

% define file parameters
if strcmp(dataSet, 'GFS_NIH')
    % figure out matching or no-matching units
    if contains(filename, 'matchUnits')
        matchStatus = 'matchUnits';
    elseif contains(filename, 'noMatchUnits')
        matchStatus = 'noMatchUnits';
    end
    
    % figure out labels
    if contains(filename, 'ambiguous')
        setType = 'ambiguous';
        m_labels = {'nocatch_disap', 'nocatch_nodisap'};
        l_labels = {'disap_ambiguous', 'nodisap_ambiguous'};
    elseif contains(filename, '_both_')
        setType = 'both';
        m_labels = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'}; % Melanie's labels
        l_labels = {'disap_physical', 'nodisap_physical', 'disap_ambiguous', 'nodisap_ambiguous'}; % Luba's labels
    end
    
    stableFix = 1500; % surround onset
    tarOn = 3000; % target onset
    
elseif strcmp(dataSet, 'GFS_Tuebingen')
    
    % figure out labels
    if contains(filename, 'ambiguous')
        setType = 'ambiguous';
        m_labels = {'physdis', 'subjdis'};
        l_labels = {'disap_ambiguous', 'nodisap_ambiguous'};
    elseif contains(filename, '_both_')
        setType = 'both';
        m_labels = {'physdis', 'nodisappdat', 'subjdis', 'subjNodis'}; % Melanie's labels
        l_labels = {'disap_physical', 'nodisap_physical', 'disap_ambiguous', 'nodisap_ambiguous'}; % Luba's labels
    end
    
    stableFix = 500; % surround onset
    tarOn = 800; % target onset
    
end

% figure out data type
if contains(filename, 'mua')
    dataType = 'mua';
elseif contains(filename, 'spk')
    dataType = 'spk';
elseif contains(filename, 'delta')
    dataType = 'delta';
elseif contains(filename, 'theta')
    dataType = 'theta';
elseif contains(filename, 'alpha')
    dataType = 'alpha';
elseif contains(filename, 'beta')
    dataType = 'beta';
elseif contains(filename, 'gamma1')
    dataType = 'gamma1';
elseif contains(filename, 'gamma2')
    dataType = 'gamma2';
end

% current date and time for savename
D = datetime('now','Format', 'yyyy-MM-dd HH:mm:ss');
D = char(D);
D(D == ':') = '-';

if strcmp(dataSet, 'GFS_NIH')
    dataDir = ['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\' dataSet filesep brainArea '_' matchStatus '_' setType '_' dataType filesep];
    savename = ['single_channel_' brainArea '_' matchStatus '_' setType '_' dataType '_' D '.ppt'];%['singleUnitPlots_raw_binned_normalized' '_' brainArea '_' paradigm '.ppt'];
elseif strcmp(dataSet, 'GFS_Tuebingen')
    dataDir = ['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\' dataSet filesep brainArea '_' setType '_cvsplits14_' dataType filesep];
    savename = ['single_channel_' brainArea '_' setType '_cvsplits14_' dataType '_' D '.ppt'];
end



% % data prepared for NDT
% if contains(filename, 'pulvinar') && contains(filename, 'both')
%     
%     dataDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\pulvinar_both\';
%     
%     brainArea = 'pulvinar';
%     paradigm = 'both';
%     
%     % set data labels
%     m_labels = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
%     l_labels = {'disap_physical', 'nodisap_physical', 'disap_ambiguous', 'nodisap_ambiguous'};
%     
% elseif contains(filename, 'pulvinar') && contains(filename, 'ambiguous')
%     
%     dataDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\pulvinar_ambiguous\';
%     
%     brainArea = 'pulvinar';
%     paradigm = 'ambiguous';
%     
%     % set data labels
%     m_labels = {'nocatch_disap', 'nocatch_nodisap'};
%     l_labels = {'disap_ambiguous', 'nodisap_ambiguous'};
%     
% elseif contains(filename, 'pulvinar') && contains(filename, 'eye')
%     
%     dataDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\pulvinar_eye\';
%     
%     m_labels = {{'RE_Physdis', 'RE_conNodis', 'RE_nc_disap', 'RE_nc_nodisap'}, {'LE_Physdis', 'LE_conNodis', 'LE_nc_disap', 'LE_nc_nodisap'}};    
%     l_labels = {'le', 're'};
%     
% elseif contains(filename, 'pulvinar') && contains(filename, 'noResponse')
%     
%     dataDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\pulvinar_noResponse\';
%     
%     brainArea = 'pulvinar';
%     paradigm = 'ambiguous';
%     
%     % set data labels
%     m_labels = {'nocatch_disap', 'nocatch_nodisap'};
%     l_labels = {'disap_ambiguous', 'nodisap_ambiguous'};
%     
% elseif contains(filename, 'pulvinar') && contains(filename, 'response')
%     
%     dataDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\pulvinar_response\';
%     
%     brainArea = 'pulvinar';
%     paradigm = 'ambiguous';
%     
%     % set data labels
%     m_labels = {'nocatch_disap', 'nocatch_nodisap'};
%     l_labels = {'disap_ambiguous', 'nodisap_ambiguous'};
%     
% elseif contains(filename, 'LGN') && contains(filename, 'both')
%     
%     dataDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\LGN_both\';
%     
%     brainArea = 'LGN';
%     paradigm = 'both';
%     
%     % set data labels
%     m_labels = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
%     l_labels = {'disap_physical', 'nodisap_physical', 'disap_ambiguous', 'nodisap_ambiguous'};
%     
% elseif contains(filename, 'LGN') && contains(filename, 'ambiguous')
%     
%     dataDir = '.\LGN_matchUnits_ambiguous_spk\';
%     
%     brainArea = 'LGN';
%     paradigm = 'ambiguous';
%     
%     % set data labels
%     m_labels = {'nocatch_disap', 'nocatch_nodisap'};
%     l_labels = {'disap_ambiguous', 'nodisap_ambiguous'};
%     
% elseif contains(filename, 'LGN') && contains(filename, 'eye')
%     
%     dataDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\LGN_eye\';
%     
%     l_labels = {'le', 're'};
%     
% elseif contains(filename, 'V4') && contains(filename, 'both')
%     
%     dataDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\V4_both\';
%     
%     brainArea = 'V4';
%     paradigm = 'both';
%     
%     % set data labels
%     m_labels = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
%     l_labels = {'disap_physical', 'nodisap_physical', 'disap_ambiguous', 'nodisap_ambiguous'};
%     
% elseif contains(filename, 'V4') && contains(filename, 'ambiguous')
%     
%     dataDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\V4_ambiguous\';
%     
%     brainArea = 'V4';
%     paradigm = 'ambiguous';
%     
%     % set data labels
%     m_labels = {'nocatch_disap', 'nocatch_nodisap'};
%     l_labels = {'disap_ambiguous', 'nodisap_ambiguous'};
%     
% elseif contains(filename, 'V4') && contains(filename, 'eye')
%     
%     dataDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\V4_eye\';
%     
%     l_labels = {'le', 're'};
%     
% end

flList = dir([dataDir '*.mat']); % the list of raster data files

% load binned data
load(filename, 'binned_data', 'binned_labels', 'binned_site_info')

% normalize data
bin_centers = binned_site_info.binning_parameters.the_bin_start_times - ...
    binned_site_info.binning_parameters.bin_width/2;

backgroundIDs = bin_centers <= tarOn - binned_site_info.binning_parameters.bin_width/2 & ...
    bin_centers >= stableFix + binned_site_info.binning_parameters.bin_width/2;

binned_data = cellfun(@single, binned_data, 'UniformOutput', false);

% transpose neuronal data
B = cellfun(@transpose, binned_data, 'UniformOutput', false);
binned_data = cellfun(@transpose, binned_data, 'UniformOutput', false);

% data normalization
mean_bg = cellfun(@(x) mean2(x(backgroundIDs, :)), B, 'UniformOutput', false);
std_all = cellfun(@(x) std2(x), B, 'UniformOutput', false);
B = cellfun(@(x, y, z) (x-y)/z, B, mean_bg, std_all, 'UniformOutput', false);

% convert into spikes/s
binned_data = cellfun(@ (x) 1000*x, binned_data, 'Uniformoutput', 0);

% calculate standard deviation for each neuron
st_dev = cellfun(@(x) std(mean(x(backgroundIDs, :), 1)), binned_data);

% set colors
cmap = cool(4);

for flNum = 1:length(flList)
    
    currFile = [dataDir flList(flNum).name];
    
    load(currFile)
    
    % find corresponding data in the binned and smoothed data
    currID = cellfun(@ (x) strcmp(x, raster_site_info.info_id), binned_site_info.info_id);
    currCh = binned_site_info.channel == raster_site_info.channel;
    
    unqLabels = unique(raster_labels.condition_disap);
    
    x_times = binned_site_info.binning_parameters.the_bin_start_times + binned_site_info.binning_parameters.bin_width/2;
    
    figure,
    screenSize = get(0, 'Screensize');
    screenSize(3) = length(l_labels)*screenSize(3)/4;
    set(gcf, 'Position', screenSize);
    
    % plot Melanie's data
    currFile = dir([gfs_path filesep '*' raster_site_info.info_id '*.mat']);
    
    if length(currFile) > 1
        error('More than 1 one file')
    elseif isempty(currFile)
        error('No files were found')
    end
    
    if strcmp(dataType, 'spk')
        load([gfs_path currFile.name], 'SPKSEL')
        native_data = SPKSEL;
        clear SPKSEL
    else
        load([gfs_path currFile.name], 'LFPSEL')
        native_data = LFPSEL;
        clear LFPSEL
    end
    
    for labNum = 1:length(m_labels)
        
        currRaster = native_data.(m_labels{labNum});
        
        SInf = getSesInfo_sorted_lats_J_lnv(raster_site_info.info_id);
        
        currChanID = SInf.lfp_elec == raster_site_info.channel;
        
        if sum(currChanID) > 1
            error('')
        elseif sum(currChanID) < 1
            error('')
        end
        
        currRaster = currRaster(:, currChanID, :);
        
        if strcmp(dataType, 'spk')
            currRaster_reshaped = reshape(currRaster, [6501 size(currRaster, 3)]);
        else
            currRaster_reshaped = reshape(currRaster, [6500 size(currRaster, 3)]);
        end
        
        subplot(2, length(m_labels), labNum);
        
        imagesc(currRaster_reshaped')
        hold on
        xline(1500)
        xline(3000)
        xline(5000)
        axis xy
        colormap(flipud(gray))
        set(gca, 'YTick', [])
        title([m_labels{labNum} ', N = ' num2str(size(currRaster, 2))],'interpreter','none')
        
        if labNum == 1
            ylabel({'Raw data from SPKSEL', ''},'fontweight', 'bold', 'fontsize', 16)
        end
        
    end
    
    % plot raster data
    for labNum = 1:length(l_labels)
        
        currLab = l_labels{labNum};
        
        currLabId = cellfun(@ (x) isequal(currLab, x), raster_labels.condition_disap, 'UniformOutput', 1);
        
        s(labNum) = subplot(2,  length(m_labels), labNum + length(m_labels));
        yyaxis left
        imagesc(raster_data(currLabId, :))
        axis xy
        colormap(flipud(gray))
        set(gca, 'YTick', [])
        title(currLab,'interpreter','none')
        
        if labNum == 1
            ylabel({'Data prepared for NDT', ''}, 'fontweight', 'bold', 'fontsize', 16)
        end
        
        currData = binned_data{currID & currCh'}(:, currLabId);
        currMean(:, labNum) = mean(currData, 2);
        
        % +/- standard deviation
        upperEB = currMean(:, labNum) + std(currData, [], 2);
        lowerEB = currMean(:, labNum) - std(currData, [], 2);
        
        % +/- standard error of the mean
        upperEB_ste = currMean(:, labNum) + std(currData, [], 2)/sqrt(size(currData, 2));
        lowerEB_ste = currMean(:, labNum) - std(currData, [], 2)/sqrt(size(currData, 2));
        
        yyaxis right
        
        hold on
        
        p(1) = fill([x_times fliplr(x_times) x_times(1)], [upperEB; flipud(lowerEB); upperEB(1)], cmap(labNum, :), 'FaceAlpha', .15, 'EdgeColor', 'none');
        p(2) = fill([x_times fliplr(x_times) x_times(1)], [upperEB_ste; flipud(lowerEB_ste); upperEB_ste(1)], cmap(labNum, :), 'FaceAlpha', .3, 'EdgeColor', 'none');
        p(3) = plot(x_times, currMean(:, labNum), 'Color', cmap(labNum, :), 'LineWidth', 2);
        %hold off
        
        % set lower y-lim to zero
        y_lim = get(gca, 'YLim');
        y_lim(1) = 0;
        set(gca, 'YLim', y_lim);
        grid on
        
        y_lim_max(labNum) = y_lim(2);
        
        if labNum == 1
            xlabel('Time after trial start, ms')
            if contains(filename, 'spk')
                ylabel('Spiking Frequency, Hz')
            else
                ylabel('Potential Magnitude, a.u.')
            end
        end
        
        xline(1500)
        xline(3000)
        xline(5000)
        
        title([currLab ', N = ' num2str(size(currData, 2))], 'interpreter', 'none')
        
        box on
    end
    
    for ii = 1:length(s)
        
        set(s(ii), 'YLim', [0 max(y_lim_max)])
        
        for plotNum = 1:length(l_labels)
            plot(s(ii), x_times, currMean(:, plotNum), '-', 'Color', cmap(plotNum, :))
        end
        
        legend(s(ii), {'+/- St. Dev.', '+/- St. Error', 'average'}, 'Location', 'southoutside', 'interpreter', 'none')
        
%         legend('off')
    end
    
%     % plot normalized data
%         
%     for labNum = 1:length(l_labels)
%         
%         currLab = l_labels{labNum};
%         
%         currLabId = cellfun(@ (x) isequal(currLab, x), binned_labels.condition_disap{flNum}, 'UniformOutput', 1);
%         
%         s(labNum) = subplot(2,  length(m_labels), labNum + 2*length(m_labels));
%         
%         if labNum == 1
%             ylabel('Normalized Data')
%         end
%         
%         currData = B{currID & currCh'}(:, currLabId);
%         currMean = mean(currData, 2);
%         
%         % +/- standard deviation
%         upperEB = currMean + std(currData, [], 2);
%         lowerEB = currMean - std(currData, [], 2);
%         
%         % +/- standard error of the mean
%         upperEB_ste = currMean + std(currData, [], 2)/sqrt(size(currData, 2));
%         lowerEB_ste = currMean - std(currData, [], 2)/sqrt(size(currData, 2));
%         
%         yyaxis left
%         set(gca, 'YTick', [])
%         if labNum == 1
%             ylabel('Normalized Data')
%         end
%         
%         yyaxis right
%         fill([x_times fliplr(x_times) x_times(1)], [upperEB; flipud(lowerEB); upperEB(1)], cmap(labNum, :), 'FaceAlpha', .15, 'EdgeColor', 'none')
%         hold on
%         fill([x_times fliplr(x_times) x_times(1)], [upperEB_ste; flipud(lowerEB_ste); upperEB_ste(1)], cmap(labNum, :), 'FaceAlpha', .3, 'EdgeColor', 'none')
%         plot(x_times, currMean, 'Color', cmap(labNum, :), 'LineWidth', 2)
%         hold off
%         
%         % set lower y-lim to zero
%         y_lim = get(gca, 'YLim');
%         y_lim(1) = 0;
%         set(gca, 'YLim', y_lim);
%         
%         y_lim_max(labNum) = y_lim(2);
%         
%         if labNum == 1
%             xlabel('Time after trial start, ms')
%             ylabel('Normalized Spiking Frequency')
%         end
%         
%         xline(1500)
%         xline(3000)
%         xline(5000)
%         yline(0)
%         
%         if labNum == 1
%             title([currLab ', N = ' num2str(size(currData, 2)) ' std = ' num2str(st_dev(flNum))], 'interpreter', 'none')
%         else
%             title([currLab ', N = ' num2str(size(currData, 2))], 'interpreter', 'none')
%         end
%         
%         box on
%     end
    
    for ii = 1:length(s)
        
        set(s(ii), 'YLim', [-1 max(y_lim_max)])
        
    end
    
    supttl = flList(flNum).name(1:end-4);
    supttl(supttl == '_') = ' ';
    sgtitle(supttl)
    
    if flNum == 1
        % Plot figures in batch mode. Faster than opening a new powerpoint object each time
        ppt = saveppt2(savename, 'init');

        % Create blank title page.
        saveppt2('ppt', ppt,'f',0,'t',[dataType ' Responses in GFS - ' brainArea], 'driver', 'meta');
    end
    
    saveppt2('ppt', ppt, 'f', 1)
    
    close(1)
end

saveppt2(savename, 'ppt', ppt, 'close');

end
