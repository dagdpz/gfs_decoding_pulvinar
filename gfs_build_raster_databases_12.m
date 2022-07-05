clear all, close all

% Tasks:
% - loop through data files
% - take channels that fit the requirements
% - save .mat files with rasters one by one

currDir = 'C:\Users\LVasileva\Documents\scripts\ndt_prep';
cd(currDir)

% set recording area names (pulvinar, LGN, V4)
areaNames = {'pulvinar', 'LGN', 'V4'};
areaNums = [1, 2, 4];

% look for folders in the current dir
fldList = dir(currDir);
fldList = fldList([fldList.isdir] == 1);
fldList = fldList(3:end);

% find all data files
flList = dir('C:\Users\LVasileva\Documents\data\allLFPinclude\*.mat');

% loop through data files
for flNum = 1:length(flList)
    filename = [flList(flNum).folder filesep flList(flNum).name];
    load(filename, 'SPKSEL')
    
    % get an info id
    info_id = flList(flNum).name(17:end-4);
    
    % figure out recording information
    SInf = getSesInfo_sorted_lats_J(info_id);
    disp(SInf)
    
    % if no channels apply switch to the next file
    if isempty(SInf.spk_elec)
        continue
    end
    
    % loop through dataset folders
    for fldNum = 1:length(fldList)
        currFolder = fldList(fldNum).name;
        undscrId = find(fldList(fldNum).name == '_'); % find underscore in the folder name
        currArea = currFolder(1:undscrId-1); % figure out current area
        currCondition = currFolder(undscrId+1:end); % figure out current condition
        
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
        elseif strcmp(currCondition, 'physical') == 1
            fieldList = {'CatchTargRemov', 'TargBotheyes'};
        elseif strcmp(currCondition, 'both') == 1
            fieldList = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
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
                
                % loop through needed fields corresponding to various
                % conditions and those labels
                raster_data = [];
                raster_labels.condition = [];
                for fieldNum = 1:length(fieldList)
                    % find current field
                    currField = SPKSEL.(fieldList{fieldNum});
                    
                    % choose needed channel
                    currField = currField(:, currChanId, :);
                    
                    % reshape data into a 2D matrix
                    currField = reshape(currField, [6501 size(currField, 3)]);
                    
                    % append data together
                    raster_data = [raster_data; currField'];
                    labels = cell(size(currField, 2), 1);
                    labels(:) = {fieldList{fieldNum}};
                    raster_labels.condition = [raster_labels.condition; labels];
                    clear currField labels
                end
                
                savename = ['spk_' currAreaNames{areaNum} '_' info_id '_ch' num2str(currChan) '_' currCondition '.mat'];
                
                disp(['Saving ' savename])
                fprintf('\n')
                raster_site_info = [];
                save(['.\' currFolder '\' savename], 'raster_data', 'raster_labels', 'raster_site_info')
                clear raster_data raster_labels
            end
        end
    end
    clear SInf SPKSEL
end

clear all
