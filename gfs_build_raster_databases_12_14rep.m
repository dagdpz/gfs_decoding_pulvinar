clear all, close all

% This code takes data from allLFPinclude folder, check them for the
% number of trials, unit quality, area, etc. and saves in the format 
% eatable by the Neuronal Decoding Toolbox. Saved for keeping records,
% isn't used currently.
% The actual code that does the same thing now but in a more explicit and 
% clear manner - build_raster_databases_12_14rep_new.m

currDir = 'F:\Luba\scripts\ndt_prep\';
cd(currDir)

% set recording area names (pulvinar, LGN, V4)
areaNames = {'pulvinar', 'LGN', 'V4'};
areaNums = [1, 2, 4];

% folder list
fldList = {'LGN_both', 'pulvinar_both', 'V4_both'};

% {'allAreas_ambiguous', 'allAreas_both', 'allAreas_physical', ...
%     'LGN_ambiguous', 'LGN_both', 'LGN_physical', ...
%     'pulvinar_ambiguous', 'pulvinar_both', 'pulvinar_physical', ...
%     'V4_ambiguous', 'V4_both', 'V4_physical'};
%     ...
%     'allAreas_ambiguous_le', 'allAreas_both_le', 'allAreas_physical_le', ... % for left eye
%     'LGN_ambiguous_le', 'LGN_both_le', 'LGN_physical_le', ...
%     'pulvinar_ambiguous_le', 'pulvinar_both_le', 'pulvinar_physical_le', ...
%     'V4_ambiguous_le', 'V4_both_le', 'V4_physical_le', ...
%     ...
%     'allAreas_ambiguous_re', 'allAreas_both_re', 'allAreas_physical_re', ... % for right eye
%     'LGN_ambiguous_re', 'LGN_both_re', 'LGN_physical_re', ...
%     'pulvinar_ambiguous_re', 'pulvinar_both_re', 'pulvinar_physical_re', ...
%     'V4_ambiguous_re', 'V4_both_re', 'V4_physical_re'};

% find all data files
flList = dir('F:\Luba\data\allLFPinclude\*.mat');

% loop through data files
for flNum = 1:length(flList)
    filename = [flList(flNum).folder filesep flList(flNum).name];
    load(filename, 'SPKSEL')
    
    if size(SPKSEL.CatchTargRemov, 3) < 14 || ...
            size(SPKSEL.TargBotheyes, 3) < 14 || ...
            size(SPKSEL.nocatch_disap, 3) < 14 || ...
            size(SPKSEL.nocatch_nodisap, 3) < 14
%             ...
%             size(SPKSEL.LE_nc_disap, 3) < 14 || ...
%             size(SPKSEL.LE_nc_nodisap, 3) < 14 || ...
%             size(SPKSEL.RE_nc_disap, 3) < 14 || ...
%             size(SPKSEL.RE_nc_nodisap, 3) < 14 || ...
%             size(SPKSEL.LE_Physdis, 3) < 14 || ...
%             size(SPKSEL.LE_conNodis, 3) < 14 || ...
%             size(SPKSEL.RE_Physdis, 3) < 14 || ...
%             size(SPKSEL.RE_conNodis, 3) < 14
        continue % go to the next data file
        
    end
    
    % get an info id
    recDay = SPKSEL.AddInfo.file(1:6);
    
    % figure out recording information
    SInf = getSesInfo_sorted_lats_J(SPKSEL.AddInfo.file);
    
    % if no channels apply switch to the next file
    if isempty(SInf.spk_elec)
        continue
    end
    
    % loop through dataset folders
    for fldNum = 1:length(fldList)
        currFolder = fldList{fldNum};
        undscrId = find(fldList{fldNum} == '_', 1, 'first'); % find underscore in the folder name
        currArea = currFolder(1:undscrId-1); % figure out current area
        currCondition = currFolder(undscrId+1:end); % figure out current condition
        
        % decide which areas we need for the current dataset
        if strcmp(currArea, 'allAreas')
            currAreaNums = areaNums;
            currAreaNames = areaNames;
        else
            areas2take = cellfun(@(x) strcmp(x, currArea), areaNames);
            currAreaNums = areaNums(areas2take);
            currAreaNames = areaNames(areas2take);
        end
        
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
                    chans2take = SInf.area == currAreaNums(areaNum) & SInf.unitqual >= 1; %& SInf.TROn == 1;
                else
                    continue
                end
            else
                continue
            end
            
            chanId = find(chans2take);
            
            % loop through channels, save data in a separate file for each
            for currChanId = chanId
                currChan = SInf.spk_elec(currChanId);
                
                raster_site_info.info_id = SPKSEL.AddInfo.file;
                raster_site_info.channel = currChan;
                
                % loop through needed fields corresponding to various
                % conditions and those labels
                raster_data = [];
                raster_labels.disap_nodisap = [];
                raster_labels.condition = [];
                raster_labels.condition_disap = [];
                raster_labels.date_trial_condition_disap = [];
                
                for fieldNum = 1:length(fieldList)
                    % find current field
                    currField = SPKSEL.(fieldList{fieldNum});
                    
                    % choose needed channel
                    currField = currField(:, currChanId, :);
                    
                    % reshape data into a 2D matrix
                    currField = reshape(currField, [6501 size(currField, 3)]);
                    
                    % create data labels
                    disap_nodisap = cell(size(currField, 2), 1);
                    disap_nodisap(:) = {disapList{fieldNum}};
                    
                    condition = cell(size(currField, 2), 1);
                    condition(:) = {conditionList{fieldNum}};
                    
                    disap_condition = cell(size(currField, 2), 1);
                    disap_condition(:) = {[disapList{fieldNum} '_' conditionList{fieldNum}]};
                    
                    date_trial_disap_condition = cell(size(currField, 2), 1);
                    for trNum = 1:size(currField, 2)
                        date_trial_disap_condition{trNum} = ...
                            [recDay '_trial' num2str(trNum) '_' ...
                            disapList{fieldNum} '_' conditionList{fieldNum}];
                    end
                    
                    % append data together
                    raster_data = [raster_data; currField'];
                    raster_labels.disap_nodisap = ...
                        [raster_labels.disap_nodisap; disap_nodisap];
                    raster_labels.condition = [raster_labels.condition; condition];
                    raster_labels.condition_disap = [raster_labels.condition_disap; disap_condition];
                    raster_labels.date_trial_condition_disap = [raster_labels.date_trial_condition_disap; date_trial_disap_condition];
                    
                    clear currField disap_nodisap condition disap_condition ...
                        date_trial_disap_condition
                    
                end
                
                savename = ['spk_' currAreaNames{areaNum} '_' SPKSEL.AddInfo.file '_ch' num2str(currChan) '_' currCondition '.mat'];
                
                disp(['Saving ' savename])
                fprintf('\n')
                if ~exist(['.\' currFolder], 'dir')
                    mkdir(currFolder)
                end
                save(['.\' currFolder '\' savename], 'raster_data', 'raster_labels', 'raster_site_info')
                clear raster_data raster_labels raster_site_info
            end
        end
    end
    clear SInf SPKSEL
end

clear all
