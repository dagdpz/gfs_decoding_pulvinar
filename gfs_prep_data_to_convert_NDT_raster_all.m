function gfs_prep_data_to_convert_NDT_raster_all(dataset)

% This script prepares data from three projects (GFS NIH, GFS no-report
% NIH, GFS Tuebingen) to be converted into NDT-eatable format and saves
% them into separate folders for respective data sets
%
% Example usage:
% gfs_prep_data_to_convert_NDT_raster_all('GFS_NIH')
% gfs_prep_data_to_convert_NDT_raster_all('GFS_noreport')
% gfs_prep_data_to_convert_NDT_raster_all('GFS_Tuebingen')

currDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\';
cd(currDir)

switch dataset
    case 'GFS_NIH'
        % folder to take data from
        dataDir = 'C:\Users\lvasileva\Documents\Luba\data\allLFPinclude\';
        % folder to save ready data in
        output_dir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_NIH\blp_data\';
        
        % make output data folders
        band_list = {'delta', 'theta', 'alpha', 'beta', 'gamma1', 'gamma2'};
        
        blpdir = cell(length(band_list),1); % preallocate for folder names
        for bandNum = 1:length(band_list)
            
            blpdir{bandNum} = [output_dir band_list{bandNum} filesep];
            if exist(blpdir{bandNum}, 'dir')
                mkdir(blpdir{bandNum})
            end
            
        end
        
        dataTypesToLoad = {'SPKSEL', 'LFPSEL'};
        
        shift_time = 450; % time point to which the code aligns the reaction time in each trial
        
        % list of the needed fields
        fieldList = ...
            {'TargBotheyes', 'CatchTargRemov', 'nocatch_disap', 'nocatch_nodisap', ...
            'LE_nc_disap', 'RE_nc_disap', 'LE_nc_nodisap', 'RE_nc_nodisap', ...
            'LE_Physdis', 'RE_Physdis', 'LE_conNodis', 'RE_conNodis', 'all_data'};
        
        fieldList_short = ...
            {'TargBotheyes', 'CatchTargRemov', 'nocatch_disap', 'nocatch_nodisap'};
        
        sessionName.start = 17;
        sessionName.end = 4;
        
        % create variables for electrode info
        spk_elec = []; % for spikes
        blp_elec = []; % for blp
        
        unitqual = [];
        area = [];
        eyemodi = [];
        sessionInfo = {};
        
        getSessionInfo = @getSesInfo_sorted_lats_J_lnv;
        
    case 'GFS_noreport'
        
        dataDir = 'C:\Users\lvasileva\Documents\Luba\data\NIH_noReport\SPKLFP_fixgfs\10Binsize\';
        output_dir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_noreport\blp_data\';
        
        band_list = {'delta', 'theta', 'alpha', 'beta', 'gamma1', 'gamma2'};
        
        blpdir = cell(length(band_list),1); % preallocate for folder names
        for bandNum = 1:length(band_list)
            
            blpdir{bandNum} = [output_dir band_list{bandNum} filesep];
            if ~exist(blpdir{bandNum}, 'dir')
                mkdir(blpdir{bandNum})
            end
            
        end
        spk_dir = [output_dir 'spk' filesep];
        if ~exist(spk_dir, 'dir')
            mkdir(spk_dir)
        end
        
        dataTypesToLoad = {'SPKSEL', 'LFPSEL'};
        
        % shift_time = 450; % time point to which the code aligns the reaction time in each trial
        
        fieldList = ...
            {'TargOnly', 'TargRemov', 'disap', 'nodisap', ... % Mask-aligned: physical disap, physical no-disap, ambiguous disap, ambiguous no-disap
            'T_TargOnly' 'T_TargRemov' 'T_disap' 'T_nodisap', ... % Target-aligned: physical disap, physical no-disap, ambiguous disap, ambiguous no-disap
            'all_data'}; 
        
        fieldList_short = ...
            {'TargOnly', 'TargRemov', 'disap', 'nodisap', 'all_data'};
        
        sessionName.start = 24;
        sessionName.end = 4;
        
        % create variables for electrode info
        spk_elec = []; % for spikes
        blp_elec = []; % for blp
        
        unitqual = [];
        area = [];
        eyemodi = [];
        sessionInfo = {};
        targetResponse = [];
        
        getSessionInfo = @(x) getSesInfo_fixgfs_04_lnv(x, 1);
        
    case 'GFS_Tuebingen'
        
        dataDir = 'C:\Users\lvasileva\Documents\Luba\data\collaboration_Tuebfiles\230606_MUAGFS\';
        lfpDir = 'C:\Users\lvasileva\Documents\Luba\data\collaboration_Tuebfiles\2023_LFP\';
        output_dir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\GFS_Tuebingen\blp_data\';
        
        % data for area and eye configuration
        behDir = 'C:\Users\lvasileva\Documents\Luba\data\collaboration_Tuebfiles\2023_Beh\';
        % data for reation time
        RTDir = 'C:\Users\lvasileva\Documents\Luba\data\collaboration_Tuebfiles\230606_LFP_KorrGFS\';
        
        band_list = {'delta', 'theta', 'alpha', 'beta', 'gamma1', 'gamma2'};
        
        for bandNum = 1:length(band_list)
            
            blpdir{bandNum} = [output_dir band_list{bandNum} filesep];
            
        end
        
        dataTypesToLoad = {'MUA', 'LFP'};
        %     dataTypesToLoad = {'MUA'};
        
        fieldList = ...
            {'physdis', 'nodisappdat', 'subjdis', 'subjNodis', 'all_data'}; % physical disap, physical no-disap, ambiguous disap, ambiguous no-disap
        
        sessionName.start = 5;
        sessionName.end = 12;
        
        % create variables for electrode info
        mua_elec = []; % for mua
        
        unitqual = [];
        area = [];
        eyemodi = [];
        sessionInfo = {};
        sessionInfo_long = {};
        
        getSessionInfo = @getSessionInfo_Tueb_outside_lnv;
        
    otherwise
        error('incorrect dataset')
end

% find all data files
flList = dir([dataDir '*.mat']);
flList = {flList.name};

% get session names from the names of data files
if strcmp(dataset, 'GFS_Tuebingen')
    sessionNames = cellfun(@(x) x(sessionName.start:sessionName.end), flList, 'Uniformoutput', false);
    sessionNames_long = cellfun(@(x) x(5:end-4), flList, 'Uniformoutput', false);
else
    sessionNames = cellfun(@(x) x(sessionName.start:end-sessionName.end), flList, 'Uniformoutput', false);
end

% loop through sessions
for ii = 1:length(sessionNames)
    
    currSession = sessionNames{ii};
    SInf = getSessionInfo(currSession);
    
    if strcmp(dataset, 'GFS_Tuebingen')
        currSession_long = sessionNames_long{ii};
        SInf_long = getSessionInfo(currSession_long);
    end
    
    % rename field "electrodes" --> "spk_elec"
    switch dataset
        case 'GFS_Tuebingen'
            if ~isfield(SInf, 'electrodes')
                SInf = SInf_long;
            end
            SInf.spk_elec = SInf.electrodes;
            SInf = rmfield(SInf, 'electrodes');
    end
    
    if strcmp(currSession, '200207_barney_gfs1-04') || ...% unequal number of elements
            strcmp(currSession, '060307_barney_gfs3-04') || ...
            ...%             strcmp(currSession, '071106_elvis_gfs2-04') || ...
            strcmp(currSession, '110207_barney_gfs1-04') || ...
            strcmp(currSession, '110207_barney_gfs2-04') || ...
            strcmp(currSession, '120207_barney_gfs1-04') || ...
            strcmp(currSession, '120207_barney_gfs2-04') || ...
            strcmp(currSession, '120207_barney_gfs3-04') || ...
            strcmp(currSession, '131106_elvis_fixgfs_soa1400_2pos-04') || ...% from no-report data set
            ...
            strcmp(currSession, '140303_e') || ... % from Tuebingen data
            strcmp(currSession, '210403_e') || ...
            ...
            strcmp(currSession, '131106_elvis_fixgfs_soa1400-04') || ... % from no-report data, skip soa sessions
            strcmp(currSession, '131106_elvis_fixgfs_soa1400_2pos-04')
        %             strcmp(currSession_long, '070204_wally_gfs_prot') || ...
        %             strcmp(currSession_long, '090204_wally_gfs_protgrat') || ...
        %             strcmp(currSession_long, '110403_ernst_fixgfs_1min1_3455_prot25') || ...
        %             strcmp(currSession_long, '150403_ernst_gfs_pr2_3455_1min1_grat') || ...
        %             strcmp(currSession_long, '170204_wally_gfs_prot') || ...
        %             strcmp(currSession_long, '270104_wally_gfs_pr2')
        
        disp(currSession)
        
    else
        
        % load data
        switch dataset
            case 'GFS_Tuebingen'
                dt = load([dataDir flList{ii}], dataTypesToLoad{1}); % load MUA
                
                RT_id = [RTDir '*' currSession_long '*'];
                RT_filename = dir(RT_id);
                if length(RT_filename) == 1
                    load([RTDir RT_filename.name], 'AddInfo');
                    dt.MUA.RPL = AddInfo;
                    clear AddInfo
                else
                    disp(currSession_long)
                    warning('Wrong number of RT-files / RT-files aren''t found')
                    continue
                end
                
                % load LFP
                load([RT_filename.folder filesep RT_filename.name], dataTypesToLoad{2}, 'LFP');
                dt.LFP = LFP;
                
                clear RT_filename LFP
                
                % load Beh data
                Beh_id = [behDir '*' currSession_long '*'];
                Beh_filename = dir(Beh_id);
                if length(Beh_filename) == 1
                    load([behDir Beh_filename.name], 'BEH');
                else
                    disp(currSession_long)
                    warning('Wrong number of Beh-files / Beh-files aren''t found')
                end
                
                
                
                if size(dt.MUA.(fieldList{1}), 2) ~= size(dt.LFP.(fieldList{1}), 2)
                    warning('Number of Channels in MUA and LFP doesn''t match')
                    continue
                end
                
            otherwise
                dt = load([dataDir flList{ii}], dataTypesToLoad{:});
        end
        
        % make all_data variable
        for dTypNum = 1:length(dataTypesToLoad)
            
            switch dataset
                case 'GFS_NIH'
                    % the 'all' variable and rename into the all_data, drop
                    dt.(dataTypesToLoad{dTypNum}).all_data = dt.(dataTypesToLoad{dTypNum}).all;
                    dt.(dataTypesToLoad{dTypNum}) = rmfield(dt.(dataTypesToLoad{dTypNum}), 'all');
                    
                case 'GFS_noreport'
                    % find condition with the max trials to use for unit
                    % stability assessment
                    varSizes = [size(dt.(dataTypesToLoad{dTypNum}).TargOnly, 3), ...
                        size(dt.(dataTypesToLoad{dTypNum}).TargRemov, 3), ...
                        size(dt.(dataTypesToLoad{dTypNum}).disap, 3), ...
                        size(dt.(dataTypesToLoad{dTypNum}).nodisap, 3)];
                    [~, maxSizeId] = max(varSizes);
                    % assign the variable with max trials to all_data
                    dt.(dataTypesToLoad{dTypNum}).all_data = ...
                        dt.(dataTypesToLoad{dTypNum}).(fieldList{maxSizeId});
                    
                case 'GFS_Tuebingen'
                    
                    dt.(dataTypesToLoad{dTypNum}).all_data = ...
                        cat(3, dt.(dataTypesToLoad{dTypNum}).physdis, dt.(dataTypesToLoad{dTypNum}).nodisappdat, ...
                        dt.(dataTypesToLoad{dTypNum}).subjdis, dt.(dataTypesToLoad{dTypNum}).subjNodis);
                    
            end
        end
        
        % update electrode info
        switch dataset
            case 'GFS_NIH'
                spk_elec = [spk_elec SInf.spk_elec];
                blp_elec = [blp_elec SInf.lfp_elec];
                
                unitqual = [unitqual SInf.unitqual];
                area = [area SInf.area];
                sessionInfo(length(sessionInfo) + 1 : length(sessionInfo) + length(SInf.spk_elec)) = {deal(currSession)};
                eyemodi = [eyemodi repelem(dt.SPKSEL.AddInfo.eyemodi, length(SInf.spk_elec))];
            case 'GFS_noreport'
                spk_elec = [spk_elec SInf.spk_elec];
                
                unitqual = [unitqual SInf.spikeQual];
                area = [area SInf.area];
                sessionInfo(length(sessionInfo) + 1 : length(sessionInfo) + length(SInf.spk_elec)) = {deal(currSession)};
                % check if all eyemod are either 6,7,8,9
                if all(ismember(dt.SPKSEL.StimInfo.eyemod, [6 7 8 9]) == 1)
                    eyemodi = [eyemodi, zeros(1, length(SInf.spk_elec))]; % for asymmetrical stimulus presentation
                else
                    eyemodi = [eyemodi, ones(1, length(SInf.spk_elec))];
                end
                targetResponse = [targetResponse SInf.TrOn];
            case 'GFS_Tuebingen'
                mua_elec = [mua_elec SInf.spk_elec];
                
                area = [area SInf.area];
                sessionInfo(length(sessionInfo) + 1 : length(sessionInfo) + length(SInf.spk_elec)) = {deal(currSession)};
                sessionInfo_long(length(sessionInfo_long) + 1 : length(sessionInfo_long) + length(SInf.spk_elec)) = {deal(currSession_long)};
                eyemodi(length(eyemodi) + 1 : length(eyemodi) + length(SInf.spk_elec)) = deal(BEH.fromDGZ.eyecomb);
        end
        
        % check that the number of trials and elecreodes match
        if length(SInf.spk_elec) ~= size(dt.(dataTypesToLoad{1}).(fieldList{1}), 2)
            disp(currSession)
            error('Unequal number of channels!!')
        end
        
        % filter LFPSEL and convert SPK, LFP, MUA to single
        for dTypNum = 1:length(dataTypesToLoad)
            
            for fieldNum = 1:length(fieldList)
                
                if strcmp(dataTypesToLoad{dTypNum}, 'LFPSEL') || strcmp(dataTypesToLoad{dTypNum}, 'LFP')
                    dt.(dataTypesToLoad{dTypNum}).(fieldList{fieldNum}) = gfs_convBLP_whole_preprocdat(dt.(dataTypesToLoad{dTypNum}).(fieldList{fieldNum}));
                end
                dt.(dataTypesToLoad{dTypNum}).(fieldList{fieldNum}) = single(dt.(dataTypesToLoad{dTypNum}).(fieldList{fieldNum}));
                
            end
            
        end
        
        % create fake RTs from corresponding disap trials
        switch dataset
            case 'GFS_NIH'
                TargBotheyes_fake = randsample(dt.LFPSEL.RPL.CatchTargRemov, size(dt.LFPSEL.TargBotheyes, 3), true); % physical condition
                nocatch_nodisap_fake = randsample(dt.LFPSEL.RPL.nc_disap, size(dt.LFPSEL.nocatch_nodisap, 3), true); % ambiguous condition
            otherwise % 'GFS_Tuebingen' or 'GFS_noreport'
                %             nodisappdat_fake = randsample(dt.MUA.RPL.rellat_short, size(dt.MUA.nodisappdat, 3), true); % nodisap physical condition
                %             subjNodis_fake = randsample(dt.LFPSEL.RPL.nc_disap, size(dt.MUA.nocatch_nodisap, 3), true); % nodisap ambiguous condition
        end
        
        % loop through channels
        for chNum = 1:size(dt.(dataTypesToLoad{1}).(fieldList{1}), 2)
            
            chNumChar = ['0' num2str(chNum)];
            chNumChar = chNumChar(end-1:end);
            
            switch dataset
                case 'GFS_Tuebingen'
                    mua_savename = [output_dir 'mua' filesep 'mua_' currSession_long '_' chNumChar '_ch' num2str(SInf.spk_elec(chNum)) '.mat'];
                otherwise
                    spk_savename = [output_dir 'spk' filesep 'spk_' currSession '_' chNumChar '_ch' num2str(SInf.spk_elec(chNum)) '.mat'];
            end
            
            % create databases for original data
            for fieldNum = 1:length(fieldList)
                
                if isempty(dt.(dataTypesToLoad{1}).(fieldList{fieldNum}))
                    switch dataset
                        case 'GFS_Tuebingen'
                            MUA.(fieldList{fieldNum}) = [];
                            continue
                        otherwise
                            SPK.(fieldList{fieldNum}) = [];
                            continue
                    end
                    
                end
                
                switch dataset
                    case 'GFS_Tuebingen'
                        MUA.(fieldList{fieldNum}) = dt.MUA.(fieldList{fieldNum})(:, chNum, :);
                        MUA.(fieldList{fieldNum}) = permute(MUA.(fieldList{fieldNum}), [1 3 2]);
                    otherwise
                        SPK.(fieldList{fieldNum}) = dt.SPKSEL.(fieldList{fieldNum})(:, chNum, :);
                        SPK.(fieldList{fieldNum}) = permute(SPK.(fieldList{fieldNum}), [1 3 2]);
                end
                
            end
            
            switch dataset
                case 'GFS_NIH'
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
                    
            end
            
            switch dataset
                case 'GFS_NIH'
                    save(spk_savename, '-struct', 'SPK', ...
                        [fieldList, ...
                        'CatchTargRemov_shifted', 'TargBotheyes_shifted', ...
                        'nocatch_disap_shifted', 'nocatch_nodisap_shifted', ...
                        'AddInfo', 'RPL'])
                    clear SPK
                case 'GFS_noreport'
                    save(spk_savename, '-struct', 'SPK', fieldList{:})
                    clear SPK
                case 'GFS_Tuebingen'
                    if ~exist(mua_savename, 'file')
                        save(mua_savename, '-struct', 'MUA', fieldList{:})
                        clear MUA
                    else
                        disp(currSession)
                        disp('This filename already exists')
                    end
            end
            
            for bandNum = 1:length(band_list)
                
                switch dataset
                    case 'GFS_Tuebingen'
                        blp_savename = ...
                            [output_dir filesep band_list{bandNum} filesep band_list{bandNum} '_' currSession_long '_' chNumChar '_ch' num2str(SInf.spk_elec(chNum)) '.mat'];
                    otherwise
                        blp_savename = ...
                            [output_dir filesep band_list{bandNum} filesep band_list{bandNum} '_' currSession '_' chNumChar '_ch' num2str(SInf.spk_elec(chNum)) '.mat'];
                end
                
                for fieldNum = 1:length(fieldList)
                    
                    if isempty(dt.(dataTypesToLoad{2}).(fieldList{fieldNum}))
                        BLP.(fieldList{fieldNum}) = [];
                        continue
                    end
                    
                    BLP.(fieldList{fieldNum}) = dt.(dataTypesToLoad{2}).(fieldList{fieldNum})(:, chNum, :, bandNum);
                    BLP.(fieldList{fieldNum}) = permute(BLP.(fieldList{fieldNum}), [1 3 2]);
                end
                
                switch dataset
                    case 'GFS_NIH'
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
                            [fieldList, ...
                            'CatchTargRemov_shifted', 'TargBotheyes_shifted', ...
                            'nocatch_disap_shifted', 'nocatch_nodisap_shifted', ...
                            'AddInfo', 'RPL'])
                        clear BLP
                        
                    case 'GFS_noreport'
                        save(blp_savename, '-struct', 'BLP', fieldList{:})
                        clear BLP
                        
                    case 'GFS_Tuebingen'
                        save(blp_savename, '-struct', 'BLP', fieldList{:})
                        clear BLP
                end
            end
        end
        
        if strcmp(dataset, 'GFS_NIH')
            clear TargBotheyes_fake nocatch_nodisap_fake
        end
        
        clear dt
        
    end
end

switch dataset
    case 'GFS_Tuebingen'
        save(['.' filesep dataset filesep 'mua_info.mat'], 'mua_elec', 'area', 'sessionInfo', 'sessionInfo_long', 'eyemodi')
    case 'GFS_noreport'
        save(['.' filesep dataset filesep 'elec_info.mat'], 'spk_elec', 'blp_elec', 'unitqual', 'area', 'sessionInfo', 'eyemodi', 'targetResponse')
    otherwise
        save(['.' filesep dataset filesep 'elec_info.mat'], 'spk_elec', 'blp_elec', 'unitqual', 'area', 'sessionInfo', 'eyemodi')
end
