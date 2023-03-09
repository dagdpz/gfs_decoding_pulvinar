clear all, close all

% This script prepares data to be converted into NDT-eatable format and
% saves them into separate folders for respective data sets

currDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\';
cd(currDir)

dataDir = 'C:\Users\lvasileva\Documents\Luba\data\allLFPinclude\';
output_dir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\blp_data\';

band_list = {'delta', 'theta', 'alpha', 'beta', 'gamma1', 'gamma2'};

for bandNum = 1:length(band_list)
    
    blpdir{bandNum} = [output_dir band_list{bandNum} filesep];
    
end

dataTypes = {'SPKSEL', 'BLP'};

shift_time = 450; % time point to which the code aligns the reaction time in each trial

% list of the needed fields
fieldList = ...
    {'TargBotheyes', 'CatchTargRemov', 'nocatch_disap', 'nocatch_nodisap', ...
    'LE_nc_disap', 'RE_nc_disap', 'LE_nc_nodisap', 'RE_nc_nodisap', ...
    'LE_Physdis', 'RE_Physdis', 'LE_conNodis', 'RE_conNodis', 'all_data'};

fieldList_short = ...
    {'TargBotheyes', 'CatchTargRemov', 'nocatch_disap', 'nocatch_nodisap'};

% find all data files
flList = dir([dataDir '*.mat']);
flList = {flList.name};

% get session names from the names of data files
sessionNames = cellfun(@(x) x(17:end-4), flList, 'Uniformoutput', false);

% create variables for electrode info
spk_elec = []; % for spikes
blp_elec = []; % for blp

unitqual = [];
area = [];
eyemodi = [];
sessionInfo = {};

% loop through sessions
for ii = 1:length(sessionNames)
    
    currSession = sessionNames{ii};
    
    SInf = getSesInfo_sorted_lats_J_lnv(currSession);
    
    if strcmp(currSession, '200207_barney_gfs1-04') || ...% unequal number of elements
            strcmp(currSession, '060307_barney_gfs3-04') || ...
            ...%             strcmp(currSession, '071106_elvis_gfs2-04') || ...
            strcmp(currSession, '110207_barney_gfs1-04') || ...
            strcmp(currSession, '110207_barney_gfs2-04') || ...
            strcmp(currSession, '120207_barney_gfs1-04') || ...
            strcmp(currSession, '120207_barney_gfs2-04') || ...
            strcmp(currSession, '120207_barney_gfs3-04')
        
        disp(currSession)
        
    else
        
        dt = load([dataDir flList{ii}], 'SPKSEL', 'LFPSEL');
        
        dt.SPKSEL.all_data = dt.SPKSEL.all;
        dt.SPKSEL = rmfield(dt.SPKSEL, 'all');
        dt.LFPSEL.all_data = dt.LFPSEL.all;
        dt.LFPSEL = rmfield(dt.LFPSEL, 'all');
        
        % update electrode info
        spk_elec = [spk_elec SInf.spk_elec];
        blp_elec = [blp_elec SInf.lfp_elec];
        unitqual = [unitqual SInf.unitqual];
        area = [area SInf.area];
        sessionInfo(length(sessionInfo) + 1 : length(sessionInfo) + length(SInf.spk_elec)) = {deal(currSession)};
        eyemodi = [eyemodi repelem(dt.SPKSEL.AddInfo.eyemodi, length(SInf.spk_elec))];
        
        % check that the number of trials and elecreodes match
        if length(SInf.spk_elec) ~= size(dt.LFPSEL.TargBotheyes, 2)
            disp(currSession)
            error('Unequal number of channels!!')
        end
        
        % filter BLP and convert SPK and BLP to single
        for fieldNum = 1:length(fieldList)
            
            dt.BLP.(fieldList{fieldNum}) = gfs_convBLP_whole_preprocdat(dt.LFPSEL.(fieldList{fieldNum}));
            dt.BLP.(fieldList{fieldNum}) = single(dt.BLP.(fieldList{fieldNum}));
            dt.SPKSEL.(fieldList{fieldNum}) = single(dt.SPKSEL.(fieldList{fieldNum}));
            
        end
        
        % create fake RTs from corresponding disap trials
        TargBotheyes_fake = randsample(dt.LFPSEL.RPL.CatchTargRemov, size(dt.LFPSEL.TargBotheyes, 3), true); % physical condition
        nocatch_nodisap_fake = randsample(dt.LFPSEL.RPL.nc_disap, size(dt.LFPSEL.nocatch_nodisap, 3), true); % ambiguous condition
        
        % loop through channels
        for chNum = 1:size(dt.SPKSEL.TargBotheyes, 2)
            
            chNumChar = ['0' num2str(chNum)];
            chNumChar = chNumChar(end-1:end);
            
            spk_savename = [output_dir 'spk' filesep 'spk_' flList{ii}(17:end-4) '_' chNumChar '_ch' num2str(SInf.spk_elec(chNum)) '.mat'];
            
            % create databases for original data
            for fieldNum = 1:length(fieldList)
                
                if isempty(dt.SPKSEL.(fieldList{fieldNum}))
                    SPK.(fieldList{fieldNum}) = [];
                    continue
                end
                
                SPK.(fieldList{fieldNum}) = dt.SPKSEL.(fieldList{fieldNum})(:, chNum, :);
                SPK.(fieldList{fieldNum}) = permute(SPK.(fieldList{fieldNum}), [1 3 2]);
                
            end
            
            SPK.AddInfo = dt.SPKSEL.AddInfo;
            SPK.RPL = dt.LFPSEL.RPL;
            
            % add the randomized RTs into the data structure
            SPK.RPL.TargBotheyes_fake = TargBotheyes_fake;
            SPK.RPL.nocatch_nodisap_fake = nocatch_nodisap_fake;
            
            % create spike RT-shifted data
            for trNum = 1:size(SPK.CatchTargRemov, 2)
                SPK.CatchTargRemov_shifted(:, trNum) = circshift(SPK.CatchTargRemov(:, trNum), shift_time - SPK.RPL.CatchTargRemov(trNum));
            end
            for trNum = 1:size(SPK.TargBotheyes, 2)
                SPK.TargBotheyes_shifted(:, trNum) = circshift(SPK.TargBotheyes(:, trNum), shift_time - SPK.RPL.TargBotheyes_fake(trNum));
            end
            for trNum = 1:size(SPK.nocatch_disap, 2)
                SPK.nocatch_disap_shifted(:, trNum) = circshift(SPK.nocatch_disap(:, trNum), shift_time - SPK.RPL.nc_disap(trNum));
            end
            for trNum = 1:size(SPK.nocatch_nodisap, 2)
                SPK.nocatch_nodisap_shifted(:, trNum) = circshift(SPK.nocatch_nodisap(:, trNum), shift_time - SPK.RPL.nocatch_nodisap_fake(trNum));
            end
            
            save(spk_savename, '-struct', 'SPK', ...
                'TargBotheyes', 'nocatch_disap', 'CatchTargRemov', 'nocatch_nodisap', ...
                'CatchTargRemov_shifted', 'TargBotheyes_shifted', ...
                'nocatch_disap_shifted', 'nocatch_nodisap_shifted', ...
                'LE_nc_disap', 'RE_nc_disap', 'LE_nc_nodisap', 'RE_nc_nodisap', ...
                'LE_Physdis', 'RE_Physdis', 'LE_conNodis', 'RE_conNodis', 'all_data', ...
                'AddInfo', 'RPL')
            clear SPK
            
            % loop through bands and save data for those
            for bandNum = 1:length(band_list)
                
                blp_savename = [output_dir filesep band_list{bandNum} filesep band_list{bandNum} '_' flList{ii}(17:end-4) '_' chNumChar '_ch' num2str(SInf.spk_elec(chNum)) '.mat'];
                
                for fieldNum = 1:length(fieldList)
                    
                    if isempty(dt.BLP.(fieldList{fieldNum}))
                        BLP.(fieldList{fieldNum}) = [];
                        continue
                    end
                    
                    BLP.(fieldList{fieldNum}) = dt.BLP.(fieldList{fieldNum})(:, chNum, :, bandNum);
                    BLP.(fieldList{fieldNum}) = permute(BLP.(fieldList{fieldNum}), [1 3 2]);
                    
                end
                
                BLP.AddInfo = dt.SPKSEL.AddInfo;
                BLP.RPL = dt.LFPSEL.RPL;
                
                % use the same randomized RTs as for SPK data for
                % corresponding BLP trials
                BLP.RPL.TargBotheyes_fake = TargBotheyes_fake; % physical condition
                BLP.RPL.nocatch_nodisap_fake = nocatch_nodisap_fake; % ambiguous condition
                
                % create BLP RT-shifted data
                for trNum = 1:size(BLP.CatchTargRemov, 2)
                    BLP.CatchTargRemov_shifted(:, trNum) = circshift(BLP.CatchTargRemov(:, trNum), shift_time - BLP.RPL.CatchTargRemov(trNum));
                end
                for trNum = 1:size(BLP.TargBotheyes, 2)
                    BLP.TargBotheyes_shifted(:, trNum) = circshift(BLP.TargBotheyes(:, trNum), shift_time - BLP.RPL.TargBotheyes_fake(trNum));
                end
                for trNum = 1:size(BLP.nocatch_disap, 2)
                    BLP.nocatch_disap_shifted(:, trNum) = circshift(BLP.nocatch_disap(:, trNum), shift_time - BLP.RPL.nc_disap(trNum));
                end
                for trNum = 1:size(BLP.nocatch_nodisap, 2)
                    BLP.nocatch_nodisap_shifted(:, trNum) = circshift(BLP.nocatch_nodisap(:, trNum), shift_time - BLP.RPL.nocatch_nodisap_fake(trNum));
                end
                
                save(blp_savename, '-struct', 'BLP', ...
                    'TargBotheyes', 'nocatch_disap', 'CatchTargRemov', 'nocatch_nodisap', ...
                    'CatchTargRemov_shifted', 'TargBotheyes_shifted', ...
                    'nocatch_disap_shifted', 'nocatch_nodisap_shifted', ...
                    'LE_nc_disap', 'RE_nc_disap', 'LE_nc_nodisap', 'RE_nc_nodisap', ...
                    'LE_Physdis', 'RE_Physdis', 'LE_conNodis', 'RE_conNodis', 'all_data', ...
                    'AddInfo', 'RPL')
                clear BLP 
                
            end
            
        end
        
        clear TargBotheyes_fake nocatch_nodisap_fake
        
        clear dt
        
    end
end

save('elec_info.mat', 'spk_elec', 'blp_elec', 'unitqual', 'area', 'sessionInfo', 'eyemodi')

clear all
