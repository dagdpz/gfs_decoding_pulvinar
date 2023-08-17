clear all, close all

% This code takes data from allLFPinclude folder, check them for the
% number of trials, unit quality, area, etc. and saves in the format 
% readable by the Neuronal Decoding Toolbox.

% set the current directory
currDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\';
cd(currDir)

% saveDir = 'F:\Luba\scripts\ndt_prep\';

% load elec info
elec_info = load('mua_info.mat');

% % load blp info
% elec_info = load('blp_info.mat');

% pattern
% parameters(n).currArea = % char: 'pulvinar', 'V4', 'LGN'
% parameters(n).currAreaNum = % numeric: 1 for pulvinar, 2 for LGN, 4 for V4
% parameters(n).eyemodi = % numeric vector: [0 1] for either eye configuration, 0 for 1-eye stimulation in the target period
% parameters(n).rep = % 14
% parameters(n).fieldList = % cell: {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'} - shrink the list if you need less
% parameters(n).disapList = % cell: {'disap', 'nodisap', 'disap', 'nodisap'}
% parameters(n).conditionList = % cell: {'physical', 'physical', 'ambiguous', 'ambiguous'}
% parameters(n).currSaveFolder = % char: name of the folder to save
% parameters(n).field2decode = % char: 'disap_nodisap', 'condition_disap', 'condition'
% parameters(n).excludeByUnitQual = % numeric: 0 if you don't want to match blp and units and exclude blp by unit quality on the channel or 1 if you want
% n = n + 1;

areaName = {'pulvinar', 'LGN', 'V4'};
areaNum = [1 2 4];

n = 1;
for areaId = 1:length(areaName) % loop through brain areas I have

    for MWU = [1 0] % create data matching and no-matching with units
        
        % data set for trial-by-trial decoder
        parameters(n).currArea = areaName{areaId};
        parameters(n).currAreaNum = areaNum(areaId);
        %parameters(n).eyemodi = 0;
        parameters(n).rep = 14;
        parameters(n).fieldList = {'physdis', 'nodisappdat', 'subjdis', 'subjNodis'}; % physical disap, physical no-disap, ambiguous disap, ambiguous no-disap
        parameters(n).disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
        parameters(n).conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
        parameters(n).currSaveFolder = [areaName{areaId} '_matchUnits_both'];
        parameters(n).field2decode = 'disap_nodisap';
        parameters(n).excludeByUnitQual = MWU;
        n = n + 1;
        
        % data set for predicting the trial outcome by the pre-surround activity
        parameters(n).currArea = areaName{areaId};
        parameters(n).currAreaNum = areaNum(areaId);
        parameters(n).eyemodi = [0 1]; % we need either eye configuration
        parameters(n).rep = 14;
        parameters(n).fieldList = {'nocatch_disap', 'nocatch_nodisap'};
        parameters(n).disapList = {'disap', 'nodisap'};
        parameters(n).conditionList = {'ambiguous', 'ambiguous'};
        parameters(n).currSaveFolder = [areaName{areaId} '_matchUnits_ambiguous'];
        parameters(n).field2decode = 'disap_nodisap';
        parameters(n).excludeByUnitQual = MWU;
        n = n + 1;
        
        % RT-aligned data, pulvinar, unit-matched
        parameters(n).currArea = areaName{areaId};
        parameters(n).currAreaNum = areaNum(areaId);
        parameters(n).eyemodi = [0 1];
        parameters(n).rep = 14;
        parameters(n).fieldList = {'CatchTargRemov_shifted', 'TargBotheyes', 'nocatch_disap_shifted', 'nocatch_nodisap'};
        parameters(n).disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
        parameters(n).conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
        parameters(n).currSaveFolder = [areaName{areaId} '_RTaligned_matchUnits_both'];
        parameters(n).field2decode = 'disap_nodisap';
        parameters(n).excludeByUnitQual = MWU;
        n = n + 1;
        
    end
    
    % data set to decode the eye
    parameters(n).currArea = areaName{areaId};
    parameters(n).currAreaNum = areaNum(areaId);
    parameters(n).eyemodi = [0 1]; % we need eye configuration only with one eye at a time (???)
    parameters(n).rep = 7;
    parameters(n).fieldList = ...
        {'RE_Physdis', 'LE_Physdis', 'RE_conNodis', 'LE_conNodis', ...
        'RE_nc_disap', 'LE_nc_disap', 'RE_nc_nodisap', 'LE_nc_nodisap'};
    parameters(n).disapList = {'re', 'le', 're', 'le', 're', 'le', 're', 'le'};
    parameters(n).conditionList = ...
        {'physical', 'physical', 'physical', 'physical', ...
        'ambiguous', 'ambiguous', 'ambiguous', 'ambiguous'};
    parameters(n).currSaveFolder = [areaName{areaId} '_eye'];
    parameters(n).field2decode = 'disap_nodisap';
    n = n + 1;
    
    for wilcoxState = [0 1] % decode from neurons with significant / non-significant response to the target (Wilcoxon)
        
        parameters(n).currArea = areaName{areaId};
        parameters(n).currAreaNum = areaNum(areaId);
        parameters(n).eyemodi = [0 1]; % we need either eye configuration
        parameters(n).rep = 14;
        parameters(n).fieldList = {'nocatch_disap', 'nocatch_nodisap'};
        parameters(n).disapList = {'disap', 'nodisap'};
        parameters(n).conditionList = {'ambiguous', 'ambiguous'};
        parameters(n).currSaveFolder = [areaName{areaId} '_response'];
        parameters(n).field2decode = 'disap_nodisap';
        parameters(n).wilcox_resp = wilcoxState;
        n = n + 1;
        
    end
    
    % data set for decoding, eyemodi = 1
    parameters(n).currArea = areaName{areaId};
    parameters(n).currAreaNum = areaNum(areaId);
    parameters(n).eyemodi = 1;
    parameters(n).rep = 14;
    parameters(n).fieldList = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
    parameters(n).disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
    parameters(n).conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
    parameters(n).currSaveFolder = [areaName{areaId} '_both1'];
    parameters(n).field2decode = 'disap_nodisap';
    n = n + 1;
    
end

% prepare 2 + 2 random datasets from the pulvinar ambiguous eyemodi == [0 1],
% 4 groups of trials
random_order195_1 = randperm(195);
half1_1 = random_order195_1(1:98);
half2_1 = random_order195_1(99:195);

random_order195_2 = randperm(195);
half1_2 = random_order195_2(1:98);
half2_2 = random_order195_2(99:195);

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 1
parameters(n).currArea = 'pulvinar';
parameters(n).currAreaNum = 1;
parameters(n).eyemodi = [0 1];
parameters(n).rep = 14;
parameters(n).fieldList = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
parameters(n).disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
parameters(n).conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
parameters(n).currSaveFolder = 'pulvinar_ambiguous_half1_1';
parameters(n).field2decode = 'disap_nodisap';
parameters(n).neurons2choose = half1_1;
n = n + 1;

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 2
parameters(n).currArea = 'pulvinar';
parameters(n).currAreaNum = 1;
parameters(n).eyemodi = [0 1];
parameters(n).rep = 14;
parameters(n).fieldList = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
parameters(n).disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
parameters(n).conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
parameters(n).currSaveFolder = 'pulvinar_ambiguous_half2_1';
parameters(n).field2decode = 'disap_nodisap';
parameters(n).neurons2choose = half2_1;
n = n + 1;

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 1
parameters(n).currArea = 'pulvinar';
parameters(n).currAreaNum = 1;
parameters(n).eyemodi = [0 1];
parameters(n).rep = 14;
parameters(n).fieldList = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
parameters(n).disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
parameters(n).conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
parameters(n).currSaveFolder = 'pulvinar_ambiguous_half1_2';
parameters(n).field2decode = 'disap_nodisap';
parameters(n).neurons2choose = half1_2;
n = n + 1;

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 2
parameters(n).currArea = 'pulvinar';
parameters(n).currAreaNum = 1;
parameters(n).eyemodi = [0 1];
parameters(n).rep = 14;
parameters(n).fieldList = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
parameters(n).disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
parameters(n).conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
parameters(n).currSaveFolder = 'pulvinar_ambiguous_half2_2';
parameters(n).field2decode = 'disap_nodisap';
parameters(n).neurons2choose = half2_2;
n = n + 1;

% prepare 2 + 2 random datasets from the pulvinar ambiguous eyemodi == [0 1],
% 2 groups of trials
random_order214_1 = randperm(214);
half1_1 = random_order214_1(1:107);
half2_1 = random_order214_1(108:214);

random_order214_2 = randperm(214);
half1_2 = random_order214_2(1:107);
half2_2 = random_order214_2(108:214);

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 1
parameters(n).currArea = 'pulvinar';
parameters(n).currAreaNum = 1;
parameters(n).eyemodi = [0 1];
parameters(n).rep = 14;
parameters(n).fieldList = {'nocatch_disap', 'nocatch_nodisap'};
parameters(n).disapList = {'disap', 'nodisap'};
parameters(n).conditionList = {'ambiguous', 'ambiguous'};
parameters(n).currSaveFolder = 'pulvinar_ambiguous214_half1_1';
parameters(n).field2decode = 'disap_nodisap';
parameters(n).neurons2choose = half1_1;
n = n + 1;

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 2
parameters(n).currArea = 'pulvinar';
parameters(n).currAreaNum = 1;
parameters(n).eyemodi = [0 1];
parameters(n).rep = 14;
parameters(n).fieldList = {'nocatch_disap', 'nocatch_nodisap'};
parameters(n).disapList = {'disap', 'nodisap'};
parameters(n).conditionList = {'ambiguous', 'ambiguous'};
parameters(n).currSaveFolder = 'pulvinar_ambiguous214_half2_1';
parameters(n).field2decode = 'disap_nodisap';
parameters(n).neurons2choose = half2_1;
n = n + 1;

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 1
parameters(n).currArea = 'pulvinar';
parameters(n).currAreaNum = 1;
parameters(n).eyemodi = [0 1];
parameters(n).rep = 14;
parameters(n).fieldList = {'nocatch_disap', 'nocatch_nodisap'};
parameters(n).disapList = {'disap', 'nodisap'};
parameters(n).conditionList = {'ambiguous', 'ambiguous'};
parameters(n).currSaveFolder = 'pulvinar_ambiguous214_half1_2';
parameters(n).field2decode = 'disap_nodisap';
parameters(n).neurons2choose = half1_2;
n = n + 1;

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 2
parameters(n).currArea = 'pulvinar';
parameters(n).currAreaNum = 1;
parameters(n).eyemodi = [0 1];
parameters(n).rep = 14;
parameters(n).fieldList = {'nocatch_disap', 'nocatch_nodisap'};
parameters(n).disapList = {'disap', 'nodisap'};
parameters(n).conditionList = {'ambiguous', 'ambiguous'};
parameters(n).currSaveFolder = 'pulvinar_ambiguous214_half2_2';
parameters(n).field2decode = 'disap_nodisap';
parameters(n).neurons2choose = half2_2;
n = n + 1;

% make the file list of spike data
spkDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\blp_data\spk\';
spkList = dir([spkDir '*.mat']);

% calculate background parameters for each neuron
disap_physical = zeros(843, 1);
nodisap_physical = zeros(843, 1);
diff_index = zeros(843, 1);

for spkNum = 1:length(spkList)
    
    load([spkList(spkNum).folder filesep spkList(spkNum).name], ...
        'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap', 'all_data')
    
    disap_physical(spkNum) = 1000*mean2(CatchTargRemov(1501:3000, :));
    
    nodisap_physical(spkNum) = 1000*mean2(TargBotheyes(1501:3000, :));
    
    % divide data into two groups, calc d' equation
    halfData = size(all_data, 2)/2;
    halfData = floor(halfData);
    half1std = std(mean(all_data(1501:3000, 1:halfData), 1));
    half2std = std(mean(all_data(1501:3000, end-halfData+1:end), 1));
    
    diff_index(spkNum) = ...
        (half1std - half2std) ./ (half1std + half2std);
    
    clear CatchTargRemov TargBotheyes nocatch_disap nocatch_nodisap all_data
    
end

constant_background = diff_index < median(diff_index) + 1.5*iqr(diff_index) & ...
    diff_index > median(diff_index) - 1.5*iqr(diff_index);

FRdisap_by_FRnodisap = ...
    (disap_physical - nodisap_physical) ./ ...
    (disap_physical + nodisap_physical);

equalFR = ...
    FRdisap_by_FRnodisap > nanmedian(FRdisap_by_FRnodisap) - 1.5*iqr(FRdisap_by_FRnodisap) & ...
    FRdisap_by_FRnodisap < nanmedian(FRdisap_by_FRnodisap) + 1.5*iqr(FRdisap_by_FRnodisap);

below200 = disap_physical < 200;

% calculate Wilcox test to figure out responsive neurons
for spkNum = 1:length(spkList)
    
    load([spkList(spkNum).folder filesep spkList(spkNum).name], ...
        'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap')
    
    dt = [CatchTargRemov TargBotheyes nocatch_disap nocatch_nodisap];
    
    target_response = mean(dt(3051:3500, :), 1);
    background = mean(dt(2501:3000, :), 1);
    
    [p_wilcox(spkNum), h_wilcox(spkNum)] = ranksum(target_response, background);
    
    clear CatchTargRemov TargBotheyes nocatch_disap nocatch_nodisap
    
end

% data dir
data_list = {'delta', 'theta', 'alpha', 'beta', 'gamma1', 'gamma2', 'spk'};

for dataNum = 1:length(data_list)
    
    dataDir = ['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\blp_data\' data_list{dataNum} '\'];
    
    flList = dir([dataDir '*.mat']);
    
    % session names
    fl_list = {flList.name};
    ch_id = cellfun(@(x) strfind(x, 'ch'), fl_list, 'UniformOutput', 0);
    fl_list = cellfun(@ (x, y) x(length(data_list{dataNum}) + 2 : y-5), fl_list, ch_id, 'UniformOutput', 0);
    
    % make sure that the number of neurons match
    if sum(cellfun(@strcmp, fl_list, elec_info.sessionInfo)) ~= 843
        error('Figure out the correct file order')
    end
    
    for setNum = 13:18%length(parameters)
        
        savedir = [parameters(setNum).currSaveFolder '_' data_list{dataNum}];
        if ~isfolder([parameters(setNum).currSaveFolder '_' data_list{dataNum}])
            mkdir(savedir)
        end
        
        % choose channels for the current condition
        currAreaId = elec_info.area == parameters(setNum).currAreaNum; % from pulvinar
        currUnitqual = elec_info.unitqual > 0; % with unit quality 1 and above
        currEyemodi = ismember(elec_info.eyemodi, parameters(setNum).eyemodi);
        
        % know number of trials in the data
        for flNum = 1:length(flList)
            
            for fieldNum = 1:length(parameters(setNum).fieldList)
                
                data_info{flNum, fieldNum} = whos('-file', [flList(flNum).folder filesep flList(flNum).name], parameters(setNum).fieldList{fieldNum});
                
            end
            
        end
        
        data_size = get_number_of_trials(data_info);
        
        clear data_info
        
        % find files with 14 repetitions of each condition and above
        rep14 = all(data_size >= parameters(setNum).rep, 2);
        
        % choose neurons that apply to the above conditions
        if ~isempty(parameters(setNum).wilcox_resp)
            if parameters(setNum).wilcox_resp == 1 % significant response to the target
                unitId = currAreaId & currUnitqual & rep14' & currEyemodi & ...
                    constant_background & below200 & equalFR & h_wilcox;
            elseif parameters(setNum).wilcox_resp == 0 % no response to the target
                unitId = currAreaId & currUnitqual & rep14' & currEyemodi & ...
                    constant_background & below200 & equalFR & ~h_wilcox;
            end
        elseif ~isempty(parameters(setNum).neurons2choose) % choose one half of the pulvinar data for decoding
            unitId = currAreaId & currUnitqual & rep14' & currEyemodi & ...
                constant_background & below200 & equalFR;
            unitId = find(unitId);
            unitId = unitId(parameters(setNum).neurons2choose);
        elseif parameters(setNum).excludeByUnitQual == 1 % choose by unit quality as well
            unitId = currAreaId & currUnitqual & rep14' & currEyemodi & ...
                constant_background' & below200' & equalFR';
        else % (use for blp) don't care about the unit quality to get more channels
            unitId = currAreaId & rep14' & currEyemodi;
        end
        
        clear data_size
        
        curr_info.area = elec_info.area(unitId);
        curr_info.sessionInfo = elec_info.sessionInfo(unitId);
        curr_info.blp_elec = elec_info.blp_elec(unitId);
        curr_info.unitqual = elec_info.unitqual(unitId);
        
        currFiles = flList(unitId);
        
        % loop through files
        for flNum = 1:length(currFiles)
            
            dt = load([currFiles(flNum).folder filesep currFiles(flNum).name]);
            
            % prepare site info for NDT
            raster_site_info.info_id = dt.AddInfo.file;
            raster_site_info.channel = curr_info.blp_elec(flNum);
            raster_site_info.eyemodi = dt.AddInfo.eyemodi;
            raster_site_info.parameters = parameters(setNum);
            
            % loop through needed fields corresponding to various
            % conditions and those labels
            raster_data = [];
            raster_labels.disap_nodisap = [];
            raster_labels.condition = [];
            raster_labels.condition_disap = [];
            
            for fieldNum = 1:length(parameters(setNum).fieldList)
                % find current field
                currField = dt.(parameters(setNum).fieldList{fieldNum});
                
                % create data labels
                disap_nodisap = cell(size(currField, 2), 1);
                disap_nodisap(:) = {parameters(setNum).disapList{fieldNum}};
                
                condition = cell(size(currField, 2), 1);
                condition(:) = {parameters(setNum).conditionList{fieldNum}};
                
                disap_condition = cell(size(currField, 2), 1);
                disap_condition(:) = ...
                    {[parameters(setNum).disapList{fieldNum} '_' ...
                    parameters(setNum).conditionList{fieldNum}]};
                
                % append data together
                raster_data = [raster_data; currField'];
                raster_labels.disap_nodisap = ...
                    [raster_labels.disap_nodisap; disap_nodisap];
                raster_labels.condition = [raster_labels.condition; condition];
                raster_labels.condition_disap = [raster_labels.condition_disap; disap_condition];
                
                clear currField disap_nodisap condition disap_condition ...
                    date_trial_disap_condition
            end
            
            savename = [data_list{dataNum} '_' parameters(setNum).currArea '_' dt.AddInfo.file ...
                '_ch' num2str(curr_info.blp_elec(flNum)) '_both.mat'];
            
            disp(['Saving ' savename])
            fprintf('\n')
            save([currDir savedir filesep savename], 'raster_data', 'raster_labels', 'raster_site_info')
            clear raster_data raster_labels raster_site_info dt
            
        end
        
    end
    
end


clear all

function number_of_trials = get_number_of_trials(file_info)

struct_size = cellfun(@(x) x.size, file_info, 'UniformOutput', 0);
number_of_trials = cellfun(@(x) x(2), struct_size, 'UniformOutput', 1);

end
