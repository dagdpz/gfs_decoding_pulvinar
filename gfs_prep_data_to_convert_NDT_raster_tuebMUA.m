clear all, close all

% This script prepares data to be converted into NDT-eatable format and
% saves them into separate folders for respective data sets

currDir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\';
cd(currDir)

% dataDir = 'C:\Users\lvasileva\Documents\Luba\data\allLFPinclude\';
dataDir = 'C:\Users\lvasileva\Documents\Luba\data\collaboration_Tuebfiles\230606_MUAGFS\';
% output_dir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\blp_data\';
output_dir = 'C:\Users\lvasileva\Documents\Luba\scripts\ndt_prep\mua_data\';

% data for area and eye configuration
behDir = 'C:\Users\lvasileva\Documents\Luba\data\Luba\Mathis2\20200330_BehData\';
% data for reation time
RTDir = 'C:\Users\lvasileva\Documents\Luba\data\collaboration_Tuebfiles\230606_LFP_KorrGFS\';

% band_list = {'delta', 'theta', 'alpha', 'beta', 'gamma1', 'gamma2'};
% 
% for bandNum = 1:length(band_list)
%     
%     blpdir{bandNum} = [output_dir band_list{bandNum} filesep];
%     
% end

% dataTypes = {'SPKSEL', 'BLP'};

% list of the needed fields
% fieldList = ...
%     {'TargBotheyes', 'CatchTargRemov', 'nocatch_disap', 'nocatch_nodisap', ...
%     'LE_nc_disap', 'RE_nc_disap', 'LE_nc_nodisap', 'RE_nc_nodisap', ...
%     'LE_Physdis', 'RE_Physdis', 'LE_conNodis', 'RE_conNodis', 'all_data'};
fieldList = ...
    {'physdis', 'nodisappdat', 'subjdis', 'subjNodis'}; % physical disap, physical no-disap, ambiguous disap, ambiguous no-disap

% fieldList_short = ...
%     {'TargBotheyes', 'CatchTargRemov', 'nocatch_disap', 'nocatch_nodisap'};

% find all data files
flList = dir([dataDir '*.mat']);
flList = {flList.name};

% get session names from the names of data files
% sessionNames = cellfun(@(x) x(17:end-4), flList, 'Uniformoutput', false);
sessionNames = cellfun(@(x) x(5:12), flList, 'Uniformoutput', false);

% create variables for electrode info
% spk_elec = []; % for spikes
% blp_elec = []; % for blp
mua_elec = []; % for mua

unitqual = [];
area = [];
eyemodi = [];
sessionInfo = {};

% loop through sessions
for ii = 1:length(sessionNames)
    
    currSession = sessionNames{ii};
    
    behFile = dir([behDir '*' currSession '*']);
    
    %SInf = getSesInfo_sorted_lats_J_lnv(currSession); for NIH data
    SInf = getSessionInfo_Tueb_outside(currSession); % for Tuebingen data
    
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
        
        dt = load([dataDir flList{ii}], 'MUA');
        
%         dt.SPKSEL.all_data = dt.SPKSEL.all;
%         dt.SPKSEL = rmfield(dt.SPKSEL, 'all');
%         dt.LFPSEL.all_data = dt.LFPSEL.all;
%         dt.LFPSEL = rmfield(dt.LFPSEL, 'all');
        
        % update electrode info
%         spk_elec = [spk_elec SInf.spk_elec];
%         blp_elec = [blp_elec SInf.lfp_elec];
        mua_elec = [mua_elec SInf.electrodes];
        
%         unitqual = [unitqual SInf.unitqual];
        
        area = [area SInf.area];
%         sessionInfo(length(sessionInfo) + 1 : length(sessionInfo) + length(SInf.spk_elec)) = {deal(currSession)};
        sessionInfo(length(sessionInfo) + 1 : length(sessionInfo) + length(SInf.electrodes)) = {deal(currSession)};
%         eyemodi = [eyemodi repelem(dt.SPKSEL.AddInfo.eyemodi, length(SInf.spk_elec))];
        
        % check that the number of trials and elecreodes match
%         if length(SInf.spk_elec) ~= size(dt.LFPSEL.TargBotheyes, 2)
%             disp(currSession)
%             error('Unequal number of channels!!')
%         end
        if length(SInf.electrodes) ~= size(dt.MUA.physdis, 2)
            disp(currSession)
            error('Unequal number of channels!!')
        end

        % filter BLP and convert SPK and BLP to single
        for fieldNum = 1:length(fieldList)
            
%             dt.BLP.(fieldList{fieldNum}) = gfs_convBLP_whole_preprocdat(dt.LFPSEL.(fieldList{fieldNum}));
%             dt.BLP.(fieldList{fieldNum}) = single(dt.BLP.(fieldList{fieldNum}));
            dt.MUA.(fieldList{fieldNum}) = single(dt.MUA.(fieldList{fieldNum}));
%             dt.SPKSEL.(fieldList{fieldNum}) = single(dt.SPKSEL.(fieldList{fieldNum}));
            
        end
        
        % loop through channels
%         for chNum = 1:size(dt.SPKSEL.TargBotheyes, 2)
        for chNum = 1:size(dt.MUA.physdis, 2)
            
            chNumChar = ['0' num2str(chNum)];
            chNumChar = chNumChar(end-1:end);
            
%             spk_savename = [output_dir 'spk' filesep 'spk_' flList{ii}(17:end-4) '_' chNumChar '_ch' num2str(SInf.spk_elec(chNum)) '.mat'];
            mua_savename = [output_dir 'mua_' flList{ii}(5:12) '_' chNumChar '_ch' num2str(SInf.electrodes(chNum)) '.mat'];
            
            % create databases for original data
            for fieldNum = 1:length(fieldList)
                
%                 if isempty(dt.SPKSEL.(fieldList{fieldNum}))
                if isempty(dt.MUA.(fieldList{fieldNum}))
%                     SPK.(fieldList{fieldNum}) = [];
                    MUA.(fieldList{fieldNum}) = [];
                    continue
                end
                
%                 SPK.(fieldList{fieldNum}) = dt.SPKSEL.(fieldList{fieldNum})(:, chNum, :);
%                 SPK.(fieldList{fieldNum}) = permute(SPK.(fieldList{fieldNum}), [1 3 2]);
                MUA.(fieldList{fieldNum}) = dt.MUA.(fieldList{fieldNum})(:, chNum, :);
                MUA.(fieldList{fieldNum}) = permute(MUA.(fieldList{fieldNum}), [1 3 2]);
                
            end
            
%             SPK.AddInfo = dt.SPKSEL.AddInfo;
%             SPK.RPL = dt.LFPSEL.RPL;
            
%             % create spike RT-shifted data
%             for trNum = 1:size(SPK.CatchTargRemov, 2)
%                 SPK.CatchTargRemov_shifted(:, trNum) = circshift(SPK.CatchTargRemov(:, trNum), 350 - SPK.RPL.CatchTargRemov(trNum));
%             end
%             for trNum = 1:size(SPK.nocatch_disap, 2)
%                 SPK.nocatch_disap_shifted(:, trNum) = circshift(SPK.nocatch_disap(:, trNum), 350 - SPK.RPL.nc_disap(trNum));
%             end
            
%             save(spk_savename, '-struct', 'SPK', ...
%                 'TargBotheyes', 'nocatch_disap', 'CatchTargRemov', 'nocatch_nodisap', ...
%                 'CatchTargRemov_shifted', 'nocatch_disap_shifted', ...
%                 'LE_nc_disap', 'RE_nc_disap', 'LE_nc_nodisap', 'RE_nc_nodisap', ...
%                 'LE_Physdis', 'RE_Physdis', 'LE_conNodis', 'RE_conNodis', 'all_data', ...
%                 'AddInfo', 'RPL')
            
            
%             % loop through bands and save data for those
%             for bandNum = 1:length(band_list)
%                 
%                 blp_savename = [output_dir filesep band_list{bandNum} filesep band_list{bandNum} '_' flList{ii}(17:end-4) '_' chNumChar '_ch' num2str(SInf.spk_elec(chNum)) '.mat'];
%                 
%                 for fieldNum = 1:length(fieldList)
%                     
%                     if isempty(dt.BLP.(fieldList{fieldNum}))
%                         BLP.(fieldList{fieldNum}) = [];
%                         continue
%                     end
%                     
%                     BLP.(fieldList{fieldNum}) = dt.BLP.(fieldList{fieldNum})(:, chNum, :, bandNum);
%                     BLP.(fieldList{fieldNum}) = permute(BLP.(fieldList{fieldNum}), [1 3 2]);
%                     
%                 end
%                 
%                 BLP.AddInfo = dt.SPKSEL.AddInfo;
%                 BLP.RPL = dt.LFPSEL.RPL;
%                 
%                 % create BLP RT-shifted data
%                 for trNum = 1:size(BLP.CatchTargRemov, 2)
%                     BLP.CatchTargRemov_shifted(:, trNum) = circshift(BLP.CatchTargRemov(:, trNum), 350 - BLP.RPL.CatchTargRemov(trNum));
%                 end
%                 for trNum = 1:size(BLP.nocatch_disap, 2)
%                     BLP.nocatch_disap_shifted(:, trNum) = circshift(BLP.nocatch_disap(:, trNum), 350 - BLP.RPL.nc_disap(trNum));
%                 end
%                 
%                 save(blp_savename, '-struct', 'BLP', ...
%                     'TargBotheyes', 'nocatch_disap', 'CatchTargRemov', 'nocatch_nodisap', ...
%                     'CatchTargRemov_shifted', 'nocatch_disap_shifted', ...
%                     'LE_nc_disap', 'RE_nc_disap', 'LE_nc_nodisap', 'RE_nc_nodisap', ...
%                     'LE_Physdis', 'RE_Physdis', 'LE_conNodis', 'RE_conNodis', 'all_data', ...
%                     'AddInfo', 'RPL')
%                 clear BLP
%                 
%             end
            
        end
        
        clear dt
        
    end
end

% save('elec_info.mat', 'spk_elec', 'blp_elec', 'unitqual', 'area', 'sessionInfo', 'eyemodi')
save('mua_info.mat', 'mua_elec', 'area', 'sessionInfo')

clear all
