clear all, close all

% This code takes data from allLFPinclude folder, check them for the
% number of trials, unit quality, area, etc. and saves in the format 
% readable by the Neuronal Decoding Toolbox.

% set the current directory
currDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\';
cd(currDir)

% pulvinar data set for trial-by-trial decoder
parameters(1).currArea = 'pulvinar';
parameters(1).currAreaNum = 1;
parameters(1).eyemodi = 0;
parameters(1).rep = 14;
parameters(1).fieldList = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
parameters(1).disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
parameters(1).conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
parameters(1).currSaveFolder = 'pulvinar_both';
parameters(1).field2decode = 'disap_nodisap';

% LGN data set for trial-by-trial decoder
parameters(2).currArea = 'LGN';
parameters(2).currAreaNum = 2;
parameters(2).eyemodi = 0;
parameters(2).rep = 14;
parameters(2).fieldList = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
parameters(2).disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
parameters(2).conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
parameters(2).currSaveFolder = 'LGN_both';
parameters(2).field2decode = 'disap_nodisap';

% (alpha) V4 data set for trial-by-trial decoder
parameters(3).currArea = 'V4';
parameters(3).currAreaNum = 4;
parameters(3).eyemodi = 0;
parameters(3).rep = 14;
parameters(3).fieldList = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
parameters(3).disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
parameters(3).conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
parameters(3).currSaveFolder = 'V4_both';
parameters(3).field2decode = 'disap_nodisap';

% pulvinar data set for predicting the trial outcome by the pre-surround
% activity
parameters(4).currArea = 'pulvinar';
parameters(4).currAreaNum = 1;
parameters(4).eyemodi = [0 1]; % we need either eye configuration
parameters(4).rep = 14;
parameters(4).fieldList = {'nocatch_disap', 'nocatch_nodisap'};
parameters(4).disapList = {'disap', 'nodisap'};
parameters(4).conditionList = {'ambiguous', 'ambiguous'};
parameters(4).currSaveFolder = 'pulvinar_ambiguous';
parameters(4).field2decode = 'disap_nodisap';

% LGN data set for predicting the trial outcome by the pre-surround
% activity
parameters(5).currArea = 'LGN';
parameters(5).currAreaNum = 2;
parameters(5).eyemodi = [0 1]; % we need either eye configuration
parameters(5).rep = 14;
parameters(5).fieldList = {'nocatch_disap', 'nocatch_nodisap'};
parameters(5).disapList = {'disap', 'nodisap'};
parameters(5).conditionList = {'ambiguous', 'ambiguous'};
parameters(5).currSaveFolder = 'LGN_ambiguous';
parameters(5).field2decode = 'disap_nodisap';

% V4 data set for predicting the trial outcome by the pre-surround
% activity
parameters(6).currArea = 'V4';
parameters(6).currAreaNum = 4;
parameters(6).eyemodi = [0 1]; % we need either eye configuration
parameters(6).rep = 14;
parameters(6).fieldList = {'nocatch_disap', 'nocatch_nodisap'};
parameters(6).disapList = {'disap', 'nodisap'};
parameters(6).conditionList = {'ambiguous', 'ambiguous'};
parameters(6).currSaveFolder = 'V4_ambiguous';
parameters(6).field2decode = 'disap_nodisap';

% pulvinar data set for decoding from physical condition
parameters(7).currArea = 'pulvinar';
parameters(7).currAreaNum = 1;
parameters(7).eyemodi = [0 1]; % we need either eye configuration
parameters(7).rep = 14;
parameters(7).fieldList = {'CatchTargRemov', 'TargBotheyes'};
parameters(7).disapList = {'disap', 'nodisap'};
parameters(7).conditionList = {'physical', 'physical'};
parameters(7).currSaveFolder = 'pulvinar_physical';
parameters(7).field2decode = 'disap_nodisap';

% LGN data set for predicting the trial outcome by the pre-surround
% activity
parameters(8).currArea = 'LGN';
parameters(8).currAreaNum = 2;
parameters(8).eyemodi = [0 1]; % we need either eye configuration
parameters(8).rep = 14;
parameters(8).fieldList = {'CatchTargRemov', 'TargBotheyes'};
parameters(8).disapList = {'disap', 'nodisap'};
parameters(8).conditionList = {'physical', 'physical'};
parameters(8).currSaveFolder = 'LGN_physical';
parameters(8).field2decode = 'disap_nodisap';

% V4 data set for predicting the trial outcome by the pre-surround
% activity
parameters(9).currArea = 'V4';
parameters(9).currAreaNum = 4;
parameters(9).eyemodi = [0 1]; % we need either eye configuration
parameters(9).rep = 14;
parameters(9).fieldList = {'CatchTargRemov', 'TargBotheyes'};
parameters(9).disapList = {'disap', 'nodisap'};
parameters(9).conditionList = {'physical', 'physical'};
parameters(9).currSaveFolder = 'V4_physical';
parameters(9).field2decode = 'disap_nodisap';

% pulvinar data set to decode the eye
parameters(10).currArea = 'pulvinar';
parameters(10).currAreaNum = 1;
parameters(10).eyemodi = [0 1]; % we need eye configuration only with one eye at a time (???)
parameters(10).rep = 7;
parameters(10).fieldList = ...
    {'RE_Physdis', 'LE_Physdis', 'RE_conNodis', 'LE_conNodis', ...
    'RE_nc_disap', 'LE_nc_disap', 'RE_nc_nodisap', 'LE_nc_nodisap'};
parameters(10).disapList = {'re', 'le', 're', 'le', 're', 'le', 're', 'le'};
parameters(10).conditionList = ...
    {'physical', 'physical', 'physical', 'physical', ...
    'ambiguous', 'ambiguous', 'ambiguous', 'ambiguous'};
parameters(10).currSaveFolder = 'pulvinar_eye';
parameters(10).field2decode = 'disap_nodisap';

% LGN data set to decode the eye
parameters(11).currArea = 'LGN';
parameters(11).currAreaNum = 2;
parameters(11).eyemodi = [0 1]; % we need eye configuration only with one eye at a time (???)
parameters(11).rep = 7;
parameters(11).fieldList = ...
    {'RE_Physdis', 'LE_Physdis', 'RE_conNodis', 'LE_conNodis', ...
    'RE_nc_disap', 'LE_nc_disap', 'RE_nc_nodisap', 'LE_nc_nodisap'};
parameters(11).disapList = {'re', 'le', 're', 'le', 're', 'le', 're', 'le'};
parameters(11).conditionList = ...
    {'physical', 'physical', 'physical', 'physical', ...
    'ambiguous', 'ambiguous', 'ambiguous', 'ambiguous'};
parameters(11).currSaveFolder = 'LGN_eye';
parameters(11).field2decode = 'disap_nodisap';

% V4 data set to decode the eye
parameters(12).currArea = 'V4';
parameters(12).currAreaNum = 4;
parameters(12).eyemodi = [0 1]; % we need eye configuration only with one eye at a time
parameters(12).rep = 7;
parameters(12).fieldList = ...
    {'RE_Physdis', 'LE_Physdis', 'RE_conNodis', 'LE_conNodis', ...
    'RE_nc_disap', 'LE_nc_disap', 'RE_nc_nodisap', 'LE_nc_nodisap'};
parameters(12).disapList = {'re', 'le', 're', 'le', 're', 'le', 're', 'le'};
parameters(12).conditionList = ...
    {'physical', 'physical', 'physical', 'physical', ...
    'ambiguous', 'ambiguous', 'ambiguous', 'ambiguous'};
parameters(12).currSaveFolder = 'V4_eye';
parameters(12).field2decode = 'disap_nodisap';

% decode from neurons with significant response to the target (Wilcoxon)
parameters(13).currArea = 'pulvinar';
parameters(13).currAreaNum = 1;
parameters(13).eyemodi = [0 1]; % we need either eye configuration
parameters(13).rep = 14;
parameters(13).fieldList = {'nocatch_disap', 'nocatch_nodisap'};
parameters(13).disapList = {'disap', 'nodisap'};
parameters(13).conditionList = {'ambiguous', 'ambiguous'};
parameters(13).currSaveFolder = 'pulvinar_response';
parameters(13).field2decode = 'disap_nodisap';
parameters(13).wilcox_resp = 1;

% decode from neurons with no response to the target (Wilcoxon)
parameters(14).currArea = 'pulvinar';
parameters(14).currAreaNum = 1;
parameters(14).eyemodi = [0 1]; % we need either eye configuration
parameters(14).rep = 14;
parameters(14).fieldList = {'nocatch_disap', 'nocatch_nodisap'};
parameters(14).disapList = {'disap', 'nodisap'};
parameters(14).conditionList = {'ambiguous', 'ambiguous'};
parameters(14).currSaveFolder = 'pulvinar_noResponse';
parameters(14).field2decode = 'disap_nodisap';
parameters(14).wilcox_resp = 0;

% pulvinar data set for decoding from pulvinar both, eyemodi = 1
parameters(15).currArea = 'pulvinar';
parameters(15).currAreaNum = 1;
parameters(15).eyemodi = 1;
parameters(15).rep = 14;
parameters(15).fieldList = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
parameters(15).disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
parameters(15).conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
parameters(15).currSaveFolder = 'pulvinar_both1';
parameters(15).field2decode = 'disap_nodisap';

% prepare 2 + 2 random datasets from the pulvinar ambiguous eyemodi == [0 1],
% 4 groups of trials
random_order195_1 = randperm(195);
half1_1 = random_order195_1(1:98);
half2_1 = random_order195_1(99:195);

random_order195_2 = randperm(195);
half1_2 = random_order195_2(1:98);
half2_2 = random_order195_2(99:195);

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 1
parameters(16).currArea = 'pulvinar';
parameters(16).currAreaNum = 1;
parameters(16).eyemodi = [0 1];
parameters(16).rep = 14;
parameters(16).fieldList = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
parameters(16).disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
parameters(16).conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
parameters(16).currSaveFolder = 'pulvinar_ambiguous_half1_1';
parameters(16).field2decode = 'disap_nodisap';
parameters(16).neurons2choose = half1_1;

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 2
parameters(17).currArea = 'pulvinar';
parameters(17).currAreaNum = 1;
parameters(17).eyemodi = [0 1];
parameters(17).rep = 14;
parameters(17).fieldList = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
parameters(17).disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
parameters(17).conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
parameters(17).currSaveFolder = 'pulvinar_ambiguous_half2_1';
parameters(17).field2decode = 'disap_nodisap';
parameters(17).neurons2choose = half2_1;

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 1
parameters(18).currArea = 'pulvinar';
parameters(18).currAreaNum = 1;
parameters(18).eyemodi = [0 1];
parameters(18).rep = 14;
parameters(18).fieldList = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
parameters(18).disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
parameters(18).conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
parameters(18).currSaveFolder = 'pulvinar_ambiguous_half1_2';
parameters(18).field2decode = 'disap_nodisap';
parameters(18).neurons2choose = half1_2;

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 2
parameters(19).currArea = 'pulvinar';
parameters(19).currAreaNum = 1;
parameters(19).eyemodi = [0 1];
parameters(19).rep = 14;
parameters(19).fieldList = {'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap'};
parameters(19).disapList = {'disap', 'nodisap', 'disap', 'nodisap'};
parameters(19).conditionList = {'physical', 'physical', 'ambiguous', 'ambiguous'};
parameters(19).currSaveFolder = 'pulvinar_ambiguous_half2_2';
parameters(19).field2decode = 'disap_nodisap';
parameters(19).neurons2choose = half2_2;

% prepare 2 + 2 random datasets from the pulvinar ambiguous eyemodi == [0 1],
% 2 groups of trials
random_order214_1 = randperm(214);
half1_1 = random_order214_1(1:107);
half2_1 = random_order214_1(108:214);

random_order214_2 = randperm(214);
half1_2 = random_order214_2(1:107);
half2_2 = random_order214_2(108:214);

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 1
parameters(20).currArea = 'pulvinar';
parameters(20).currAreaNum = 1;
parameters(20).eyemodi = [0 1];
parameters(20).rep = 14;
parameters(20).fieldList = {'nocatch_disap', 'nocatch_nodisap'};
parameters(20).disapList = {'disap', 'nodisap'};
parameters(20).conditionList = {'ambiguous', 'ambiguous'};
parameters(20).currSaveFolder = 'pulvinar_ambiguous214_half1_1';
parameters(20).field2decode = 'disap_nodisap';
parameters(20).neurons2choose = half1_1;

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 2
parameters(21).currArea = 'pulvinar';
parameters(21).currAreaNum = 1;
parameters(21).eyemodi = [0 1];
parameters(21).rep = 14;
parameters(21).fieldList = {'nocatch_disap', 'nocatch_nodisap'};
parameters(21).disapList = {'disap', 'nodisap'};
parameters(21).conditionList = {'ambiguous', 'ambiguous'};
parameters(21).currSaveFolder = 'pulvinar_ambiguous214_half2_1';
parameters(21).field2decode = 'disap_nodisap';
parameters(21).neurons2choose = half2_1;

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 1
parameters(22).currArea = 'pulvinar';
parameters(22).currAreaNum = 1;
parameters(22).eyemodi = [0 1];
parameters(22).rep = 14;
parameters(22).fieldList = {'nocatch_disap', 'nocatch_nodisap'};
parameters(22).disapList = {'disap', 'nodisap'};
parameters(22).conditionList = {'ambiguous', 'ambiguous'};
parameters(22).currSaveFolder = 'pulvinar_ambiguous214_half1_2';
parameters(22).field2decode = 'disap_nodisap';
parameters(22).neurons2choose = half1_2;

% pulvinar dataset, pulvinar ambiguous, eyemodi = [0 1], half 2
parameters(23).currArea = 'pulvinar';
parameters(23).currAreaNum = 1;
parameters(23).eyemodi = [0 1];
parameters(23).rep = 14;
parameters(23).fieldList = {'nocatch_disap', 'nocatch_nodisap'};
parameters(23).disapList = {'disap', 'nodisap'};
parameters(23).conditionList = {'ambiguous', 'ambiguous'};
parameters(23).currSaveFolder = 'pulvinar_ambiguous214_half2_2';
parameters(23).field2decode = 'disap_nodisap';
parameters(23).neurons2choose = half2_2;

% load info
spk_info = load('blp_info.mat');

saveDir = 'F:\Luba\scripts\ndt_prep\';

% data dir
band_list = {'delta', 'theta', 'alpha', 'beta', 'gamma1', 'gamma2'};

for bandNum = 1:length(band_list)
    
    dataDir = ['C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\blp_data\' band_list{bandNum} '\'];
    
    flList = dir([dataDir '*.mat']);
    
    % session names
    fl_list = {flList.name};
    ch_id = cellfun(@(x) strfind(x, 'ch'), fl_list, 'UniformOutput', 0);
    fl_list = cellfun(@ (x, y) x(length(band_list{bandNum}) + 2 : y-5), fl_list, ch_id, 'UniformOutput', 0);
    
    % make sure that the number of neurons match
    if sum(cellfun(@strcmp, fl_list, spk_info.sessionInfo)) ~= 841
        error('Figure out the correct file order')
    end
    
    % implement exclusion criteria to the blp data
%     for flNum = 1:length(flList)
%         
%         load([flList(flNum).folder filesep flList(flNum).name], ...
%             'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap', 'all_data')
        
%         M.catch_targ_remov = mean(CatchTargRemov, 2);
%         M.targ_both_eyes = mean(TargBotheyes, 2);
%         M.nocatch_disap = mean(nocatch_disap, 2);
%         M.nocatch_nodisap = mean(nocatch_nodisap, 2);
%         
%         S.catch_targ_remov = std(CatchTargRemov, [], 2);
%         S.targ_both_eyes = std(TargBotheyes, [], 2);
%         S.nocatch_disap = std(nocatch_disap, [], 2);
%         S.nocatch_nodisap = std(nocatch_nodisap, [], 2);
%         
%         higher_EB3.catch_targ_remov = M.catch_targ_remov + 3*S.catch_targ_remov;
%         higher_EB3.targ_both_eyes = M.targ_both_eyes + 3*S.targ_both_eyes;
%         higher_EB3.nocatch_disap = M.nocatch_disap + 3*S.nocatch_disap;
%         higher_EB3.nocatch_nodisap = M.nocatch_nodisap + 3*S.nocatch_nodisap;
%         
%         trials2exclude.catch_targ_remov = CatchTargRemov > higher_EB3.catch_targ_remov;
%         trials2exclude.targ_both_eyes = TargBotheyes > higher_EB3.targ_both_eyes;
%         trials2exclude.nocatch_disap = nocatch_disap > higher_EB3.nocatch_disap;
%         trials2exclude.nocatch_nodisap = nocatch_nodisap > higher_EB3.nocatch_nodisap;
%         
%         trials2exclude.catch_targ_remov = find(~sum(trials2exclude.catch_targ_remov));
%         trials2exclude.targ_both_eyes = find(~sum(trials2exclude.targ_both_eyes));
%         trials2exclude.nocatch_disap = find(~sum(trials2exclude.nocatch_disap));
%         trials2exclude.nocatch_nodisap = find(~sum(trials2exclude.nocatch_nodisap));
        
%         new_data.catch_targ_remov = 
%         new_data.targ_both_eyes = 
%         new_data.nocatch_disap = 
%         new_data.nocatch_nodisap = 
        
%     end
    
    
%     % calculate background parameters for each neuron
%     for flNum = 1:length(flList)
%         
%         load([flList(flNum).folder filesep flList(flNum).name], ...
%             'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap', 'all_data')
%         
%         disap_physical(flNum) = 1000*mean2(CatchTargRemov(1501:3000, :));
%         
%         nodisap_physical(flNum) = 1000*mean2(TargBotheyes(1501:3000, :));
%         
%         %     % calculate stdev of the background FR for all the trials: calculate
%         %     % the mean for each trial, compute stdev for the trial means
%         %     st_dev(flNum) = ...
%         %         std(1000*mean([CatchTargRemov(1501:3000, :), TargBotheyes(1501:3000, :), ...
%         %         nocatch_disap(1501:3000, :), nocatch_nodisap(1501:3000, :)]));
%         
%         % divide data into two groups, calc d' equation
%         %     allData = [CatchTargRemov(1501:3000, :), TargBotheyes(1501:3000, :), ...
%         %         nocatch_disap(1501:3000, :), nocatch_nodisap(1501:3000, :)];
%         halfData = size(all_data, 2)/2;
%         halfData = floor(halfData);
%         half1std = std(mean(all_data(:, 1:halfData), 1));
%         half2std = std(mean(all_data(:, end-halfData+1:end), 1));
%         
%         diff_index(flNum) = ...
%             (half1std - half2std) ./ (half1std + half2std);
%         
%         clear CatchTargRemov TargBotheyes nocatch_disap nocatch_nodisap
%         
%     end
    
%     %constant_background = st_dev < median(st_dev) + 1.5*iqr(st_dev);
%     constant_background = diff_index < median(diff_index) + 1.5*iqr(diff_index) & ...
%         diff_index > median(diff_index) - 1.5*iqr(diff_index);
%     
%     FRdisap_by_FRnodisap = ...
%         (disap_physical - nodisap_physical) ./ ...
%         (disap_physical + nodisap_physical);
%     
%     below200 = disap_physical < 200;
%     
%     equalFR = ...
%         FRdisap_by_FRnodisap > nanmedian(FRdisap_by_FRnodisap) - 1.5*iqr(FRdisap_by_FRnodisap) & ...
%         FRdisap_by_FRnodisap < nanmedian(FRdisap_by_FRnodisap) + 1.5*iqr(FRdisap_by_FRnodisap);
    
%     % calculate Wilcox test to figure out responsive neurons
%     for flNum = 1:length(flList)
%         
%         load([flList(flNum).folder filesep flList(flNum).name], ...
%             'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap')
%         
%         dt = [CatchTargRemov TargBotheyes nocatch_disap nocatch_nodisap];
%         
%         target_response = mean(dt(3051:3500, :), 1);
%         background = mean(dt(2501:3000, :), 1);
%         
%         [p_wilcox(flNum), h_wilcox(flNum)] = ranksum(target_response, background);
%         
%         clear CatchTargRemov TargBotheyes nocatch_disap nocatch_nodisap
%         
%     end
    
    for setNum = 7:9%:length(parameters)
        
        savedir = [parameters(setNum).currSaveFolder '_' band_list{bandNum}];
        if ~isfolder([parameters(setNum).currSaveFolder '_' band_list{bandNum}])
            mkdir(savedir)
        end
        
        % choose channels for the current condition
        currAreaId = spk_info.area == parameters(setNum).currAreaNum; % from pulvinar
        %currUnitqual = spk_info.unitqual > 0; % with unit quality 1 and above
        currEyemodi = ismember(spk_info.eyemodi, parameters(setNum).eyemodi);
        
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
        else
%             unitId = currAreaId & currUnitqual & rep14' & currEyemodi & ...
%                 constant_background & below200 & equalFR;
            unitId = currAreaId & rep14' & currEyemodi;
        end
        
        clear data_size
        
        curr_info.area = spk_info.area(unitId);
        curr_info.sessionInfo = spk_info.sessionInfo(unitId);
        curr_info.blp_elec = spk_info.blp_elec(unitId);
        %curr_info.unitqual = spk_info.unitqual(unitId);
        
        currFiles = flList(unitId);
        
        % loop through files
        for flNum = 1:length(currFiles)
            
            dt = load([currFiles(flNum).folder filesep currFiles(flNum).name]);
            
            % prepare site info for NDT
            raster_site_info.info_id = dt.AddInfo.file;
            %raster_site_info.channel = curr_info.spk_elec(flNum);
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
            
            savename = [band_list{bandNum} '_' parameters(setNum).currArea '_' dt.AddInfo.file ...
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
