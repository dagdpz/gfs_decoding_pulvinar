clear all, close all

% Tasks:
% - loop through data files
% - take channels that fit the requirements
% - save .mat files with raster data one by one

currDir = 'F:\Luba\scripts\ndt_prep_blp';
cd(currDir)

% set recording area names (pulvinar, LGN, V4)
areaNames = {'pulvinar', 'LGN', 'V4'};
areaNums = [1, 2, 4];

% folder list
fldList = {'LGN_alpha_ambiguous', 'LGN_alpha_both', 'LGN_alpha_physical', ... % alpha for two eyes  
    'pulvinar_alpha_ambiguous', 'pulvinar_alpha_both', 'pulvinar_alpha_physical', ...
    'V4_alpha_ambiguous', 'V4_alpha_both', 'V4_alpha_physical', ...
    'LGN_beta_ambiguous', 'LGN_beta_both', 'LGN_beta_physical', ... % beta for two eyes   
    'pulvinar_beta_ambiguous', 'pulvinar_beta_both', 'pulvinar_beta_physical', ...
    'V4_beta_ambiguous', 'V4_beta_both', 'V4_beta_physical'};
%     ...
%     'LGN_alpha_ambiguous_le', 'LGN_alpha_both_le', 'LGN_alpha_physical_le', ...% alpha for left eye   
%     'pulvinar_alpha_ambiguous_le', 'pulvinar_alpha_both_le', 'pulvinar_alpha_physical_le', ...
%     'V4_alpha_ambiguous_le', 'V4_alpha_both_le', 'V4_alpha_physical_le', ...
%     ...
%     'LGN_alpha_ambiguous_re', 'LGN_alpha_both_re', 'LGN_alpha_physical_re', ...% alpha for right eye   
%     'pulvinar_alpha_ambiguous_re', 'pulvinar_alpha_both_re', 'pulvinar_alpha_physical_re', ...
%     'V4_alpha_ambiguous_re', 'V4_alpha_both_re', 'V4_alpha_physical_re', ...
%     ...
%     'LGN_beta_ambiguous_le', 'LGN_beta_both_le', 'LGN_beta_physical_le', ...% beta for left eye   
%     'pulvinar_beta_ambiguous_le', 'pulvinar_beta_both_le', 'pulvinar_beta_physical_le', ...
%     'V4_beta_ambiguous_le', 'V4_beta_both_le', 'V4_beta_physical_le', ...
%     ...
%     'LGN_beta_ambiguous_re', 'LGN_beta_both_re', 'LGN_beta_physical_re', ...% beta for right eye   
%     'pulvinar_beta_ambiguous_re', 'pulvinar_beta_both_re', 'pulvinar_beta_physical_re', ...
%     'V4_beta_ambiguous_re', 'V4_beta_both_re', 'V4_beta_physical_re'};

% find all data files
flList = dir('F:\Luba\data\allLFPinclude\*.mat');

% loop through data files
for flNum = 1:length(flList)
    filename = [flList(flNum).folder filesep flList(flNum).name];
    load(filename, 'LFPSEL')
    
    if size(LFPSEL.CatchTargRemov, 3) < 14 || ...
            size(LFPSEL.TargBotheyes, 3) < 14 || ...
            size(LFPSEL.nocatch_disap, 3) < 14 || ...
            size(LFPSEL.nocatch_nodisap, 3) < 14
%             ...
%             size(LFPSEL.LE_nc_disap, 3) < 14 || ...
%             size(LFPSEL.LE_nc_nodisap, 3) < 14 || ...
%             size(LFPSEL.RE_nc_disap, 3) < 14 || ...
%             size(LFPSEL.RE_nc_nodisap, 3) < 14 || ...
%             size(LFPSEL.LE_Physdis, 3) < 14 || ...
%             size(LFPSEL.LE_conNodis, 3) < 14 || ...
%             size(LFPSEL.RE_Physdis, 3) < 14 || ...
%             size(LFPSEL.RE_conNodis, 3) < 14;
        
        continue % go to the next data file
        
    end
    
    % get an info id
    info_id = flList(flNum).name(17:end-4);
    
    % figure out recording information
    SInf = getSesInfo_sorted_lats_J(info_id);
    disp(SInf)
    
%     % if no channels apply switch to the next file
%     if isempty(SInf.spk_elec)
%         continue
%     end
    
    % loop through dataset folders
    for fldNum = 1:length(fldList)
        currFolder = fldList{fldNum};
        undscrId = find(fldList{fldNum} == '_', 2, 'first'); % find underscore in the folder name
        currArea = currFolder(1:undscrId(1)-1); % figure out current area
        currCondition = currFolder(undscrId(2)+1:end); % figure out current condition
        currBand = currFolder(undscrId(1)+1:undscrId(2)-1);
        
        % decide which areas we need for the current dataset
        if strcmp(currArea, 'allAreas')
            areas2take = [true, true, true];
        else
            areas2take = cellfun(@(x) strcmp(x, currArea), areaNames);
        end
        
        currAreaNums = areaNums(areas2take);
        currAreaNames = areaNames(areas2take);
        
        % decide which conditions we need for the current dataset
        if strcmp(currCondition, 'ambiguous') == 1
            fieldList = {'nocatch_disap', 'nocatch_nodisap'};
            disapList = {'disap', 'nodisap'};
            conditionList = {'ambiguous', 'ambiguous'};
        elseif strcmp(currCondition, 'physical') == 1
            fieldList = {'CatchTargRemov', 'TargBotheyes'};
            disapList = {'disap', 'nodisap'};
            conditionList = {'physical', 'physical'};
        elseif strcmp(currCondition, 'both') == 1
            fieldList = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
            disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
            conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
        ...
        elseif strcmp(currCondition, 'ambiguous_le') == 1
            fieldList = {'LE_nc_disap', 'LE_nc_nodisap'};
            disapList = {'disap', 'nodisap'};
            conditionList = {'ambiguous', 'ambiguous'};
        elseif strcmp(currCondition, 'ambiguous_re') == 1
            fieldList = {'RE_nc_disap', 'RE_nc_nodisap'};
            disapList = {'disap', 'nodisap'};
            conditionList = {'ambiguous', 'ambiguous'};
        elseif strcmp(currCondition, 'both_le') == 1
            fieldList = {'LE_Physdis', 'LE_conNodis', 'LE_nc_disap', 'LE_nc_nodisap'};
            disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
            conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
        elseif strcmp(currCondition, 'both_re') == 1
            fieldList = {'RE_Physdis', 'RE_conNodis', 'RE_nc_disap', 'RE_nc_nodisap'};
            disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
            conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
        elseif strcmp(currCondition, 'physical_le') == 1
            fieldList = {'LE_Physdis', 'LE_conNodis'};
            disapList = {'disap', 'nodisap'};
            conditionList = {'physical', 'physical'};
        elseif strcmp(currCondition, 'physical_re') == 1
            fieldList = {'RE_Physdis', 'RE_conNodis'};
            disapList = {'disap', 'nodisap'};
            conditionList = {'physical', 'physical'};
        end
        
        for areaNum = 1:length(currAreaNums)
            % choose neurons of a specific area (SInf.area) with recording
            % quality equal to 2 and higher
            if isfield(SInf, 'TROn')
                if length(SInf.area) == length(SInf.unitqual) && length(SInf.area) == length(SInf.TROn) && length(SInf.area) == length(SInf.spk_elec)
                    chans2take = SInf.area == currAreaNums(areaNum) & SInf.unitqual >= 2; %& SInf.TROn == 1;
                else
                    continue
                end
            else
                continue
            end

            % choose channels to take
            if length(SInf.area) == length(SInf.lfp_elec)
                chans2take = SInf.area == currAreaNums(areaNum);
            end
            
            chanId = find(chans2take);
            
            if isempty(chanId)
                continue
            end
            
            % take one channel per session
            for currChanId = chanId
                currChan = SInf.lfp_elec(currChanId);
                
                raster_site_info.info_id = info_id;
                raster_site_info.channel = currChan;
                
                % loop through needed fields corresponding to various
                % conditions and those labels
                raster_data_native = [];
                raster_labels.disap_nodisap = [];
                raster_labels.condition = [];
                raster_labels.condition_disap = [];
                
                for fieldNum = 1:length(fieldList)
                    % find current field
                    currField = LFPSEL.(fieldList{fieldNum});
                    
                    % choose needed channel
                    currField = currField(:, currChanId, :);
                    
                    % reshape data into a 2D matrix
                    currField = reshape(currField, [6500 size(currField, 3)]);
                    
                    % create data labels
                    disap_nodisap = cell(size(currField, 2), 1);
                    disap_nodisap(:) = {disapList{fieldNum}};
                    
                    condition = cell(size(currField, 2), 1);
                    condition(:) = {conditionList{fieldNum}};
                    
                    disap_condition = cell(size(currField, 2), 1);
                    disap_condition(:) = {[disapList{fieldNum} '_' conditionList{fieldNum}]};
                    
                    % append data together
                    raster_data_native = [raster_data_native; currField'];
                    raster_labels.disap_nodisap = ...
                        [raster_labels.disap_nodisap; disap_nodisap];
                    raster_labels.condition = [raster_labels.condition; condition];
                    raster_labels.condition_disap = [raster_labels.condition_disap; disap_condition];
                    
                    clear currField disap_nodisap condition disap_condition
                    
                end
                
                if strcmp(currBand, 'alpha') == 1
                    % create alpha blp data, save in file
                    raster_data = pfurtscheller_daSilva(raster_data_native, 8, 14);
                    
                    if ~exist(currFolder, 'dir')
                        mkdir(currFolder)
                    end
                    
                    savenameA = ['lfpA_' currAreaNames{areaNum} '_' info_id '_ch' num2str(currChan) '_' currCondition '.mat'];
                    disp(['Saving ' savenameA])
                    fprintf('\n')
                    save(['.\' currFolder '\' savenameA], 'raster_data', 'raster_labels', 'raster_site_info')
                    clear raster_data raster_site_info
                    
                elseif strcmp(currBand, 'beta') == 1
                    % create beta blp data, save in file
                    raster_data = pfurtscheller_daSilva(raster_data_native, 14, 25);
                    
                    if ~exist(currFolder, 'dir')
                        mkdir(currFolder)
                    end
                    
                    savenameB = ['lfpB_' currAreaNames{areaNum} '_' info_id '_ch' num2str(currChan) '_' currCondition '.mat'];
                    disp(['Saving ' savenameB])
                    fprintf('\n')
                    save(['.\' currFolder '\' savenameB], 'raster_data', 'raster_labels', 'raster_site_info')
                    clear raster_data raster_labels
                    
                end
            end
        end
    end
    clear SInf LFPSEL
end

clear all
