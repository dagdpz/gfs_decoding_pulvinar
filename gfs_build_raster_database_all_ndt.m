clear all, close all

% Tasks:
% - loop through data files
% - take channels that fit the requirements
% - save .mat files with rasters one by one

% set recording area names (pulvinar, LGN, V4)
areaNames = {'pulvinar', 'LGN', 'V4'};
areaNums = [1, 2, 4];

% find all data files
flList = dir('C:\Users\LVasileva\Documents\data\allLFPinclude\*.mat');

for areaNum = 1:length(areaNums)
    
    % make resulting variables
    physDisap = [];
    physNoDisap = [];
    ambDisap = [];
    ambNoDisap = [];
    
    % loop through data files
    for flNum = 1:length(flList)
        
        filename = [flList(flNum).folder filesep flList(flNum).name];
        load(filename, 'SPKSEL')
        
        % get an info id
        info_id = flList(flNum).name(17:end-4);
        
        % figure out recording information
        SInf = getSesInfo_sorted_lats_J(info_id);
        disp(SInf)
        
        % choose neurons of a specific area (SInf.area) with recording
        % quality equal to 2 and higher
        if isfield(SInf, 'TROn')
            if length(SInf.area) == length(SInf.unitqual) && ...
                    length(SInf.area) == length(SInf.TROn)
                chans2take = SInf.area == areaNums(areaNum) & SInf.unitqual >= 2 & SInf.TROn == 1;
            else
                continue
            end
        else
            continue
        end
        
        % choose needed channels
%         SPKSEL.CatchTargRemov = SPKSEL.CatchTargRemov(:, chans2take, :);
%         SPKSEL.TargBotheyes = SPKSEL.TargBotheyes(:, chans2take, :);
%         SPKSEL.nocatch_disap = SPKSEL.nocatch_disap(:, chans2take, :);
%         SPKSEL.nocatch_nodisap = SPKSEL.nocatch_nodisap(:, chans2take, :);
%         SInf.spk_elec = SInf.spk_elec(chans2take);
        
        % if no channels fit switch to the next file
        if isempty(SInf.spk_elec)
            continue
        end
        
        chanId = find(chans2take);
        
        % loop through channels, save data in a separate file for each
        for currChanId = chanId
            currChan = SInf.spk_elec(currChanId);
            
            % make raster_data database
            physDisap = SPKSEL.CatchTargRemov(:, currChanId, :);
            physNoDisap = SPKSEL.TargBotheyes(:, currChanId, :);
            ambDisap = SPKSEL.nocatch_disap(:, currChanId, :);
            ambNoDisap = SPKSEL.nocatch_nodisap(:, currChanId, :);
            
            physDisap = reshape(physDisap, [6501 size(physDisap, 3)]);
            physNoDisap = reshape(physNoDisap, [6501 size(physNoDisap, 3)]);
            ambDisap = reshape(ambDisap, [6501 size(ambDisap, 3)]);
            ambNoDisap = reshape(ambNoDisap, [6501 size(ambNoDisap, 3)]);
            
            raster_data = [physDisap'; physNoDisap'; ambDisap'; ambNoDisap'];
            
            % make raster_labels database
            physDisap_labels = cell(size(physDisap, 2), 1);
            physDisap_labels(:) = {'physDisap'};
            
            physNoDisap_labels = cell(size(physNoDisap, 2), 1);
            physNoDisap_labels(:) = {'physNoDisap'};
            
            ambDisap_labels = cell(size(ambDisap, 2), 1);
            ambDisap_labels(:) = {'ambDisap'};
            
            ambNoDisap_labels = cell(size(ambNoDisap, 2), 1);
            ambNoDisap_labels(:) = {'ambNoDisap'};
            
            raster_labels.disap_nodisap = ...
                [physDisap_labels; physNoDisap_labels; ambDisap_labels; ambNoDisap_labels];
            
            savename = ['spk_' areaNames{areaNum} '_' info_id '_ch' num2str(currChan) '_all.mat'];
            disp(['Saving ' savename])
            fprintf('\n')
            raster_site_info = [];
            save(['.\all_condition_dataset\' savename], 'raster_data', 'raster_labels', 'raster_site_info')
            clear physDisap physNoDisap ambDisap ambNoDisap ...
                raster_data ...
                physDisap_labels physNoDisap_labels ambDisap_labels ambNoDisap_labels ...
                raster_labels
        end
        
        clear SInf
        
    end
    
end
