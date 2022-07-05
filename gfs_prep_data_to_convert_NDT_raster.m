clear all, close all

currDir = 'F:\Luba\scripts\ndt_prep\';
cd(currDir)

dataDir = 'F:\Luba\data\allLFPinclude\';
spkdir = 'F:\Luba\scripts\spk_data\';
lfpdir = 'F:\Luba\scripts\lfp_data\';

dataTypes = {'SPKSEL', 'LFPSEL'};

% list of the needed fields
fieldList = ...
    {'TargBotheyes', 'CatchTargRemov', 'nocatch_disap', 'nocatch_nodisap', ...
    'LE_nc_disap', 'RE_nc_disap', 'LE_nc_nodisap', 'RE_nc_nodisap', ...
    'LE_Physdis', 'RE_Physdis', 'LE_conNodis', 'RE_conNodis', 'all_data'};

% find all data files
flList = dir([dataDir '*.mat']);
flList = {flList.name};

% get session names from the names of data files
sessionNames = cellfun(@(x) x(17:end-4), flList, 'Uniformoutput', false);

for dataTypeNum = 1:length(dataTypes)
    
    if strcmp(dataTypes{dataTypeNum}, 'SPKSEL')
        spk_elec = [];
	elseif strcmp(dataTypes{dataTypeNum}, 'LFPSEL')
        lfp_elec = [];
    end
    
    unitqual = [];
    area = [];
    eyemodi = [];
    sessionInfo = {};
    
    % loop through sessions
    for ii = 1:length(sessionNames)
        
        currSession = sessionNames{ii};
        
        SInf = getSesInfo_sorted_lats_J_lnv(currSession);
        
        if strcmp(currSession, '071106_elvis_gfs2-04')
            
            disp(currSession)
            
            if strcmp(dataTypes{dataTypeNum}, 'SPKSEL')
                spk_elec = [spk_elec SInf.spk_elec([1,3,5:8])];
            elseif strcmp(dataTypes{dataTypeNum}, 'LFPSEL')
                lfp_elec = [lfp_elec SInf.spk_elec([1,3,5:8])];
            end
            
            unitqual = [unitqual SInf.unitqual([1,3,5:8])];
            area = [area SInf.area([1,3,5:8])];
            sessionInfo(length(sessionInfo) + 1 : length(sessionInfo) + 6) = {deal(currSession)};
            
            dt = load([dataDir flList{ii}], 'SPKSEL', 'LFPSEL');
            
            dt.SPKSEL.all_data = dt.SPKSEL.all;
            dt.SPKSEL = rmfield(dt.SPKSEL, 'all');
            dt.LFPSEL.all_data = dt.LFPSEL.all;
            dt.LFPSEL = rmfield(dt.LFPSEL, 'all');
            
            eyemodi = [eyemodi repelem(dt.SPKSEL.AddInfo.eyemodi, length(SInf.spk_elec)-2)];
            
            if length(SInf.spk_elec) ~= size(dt.(dataTypes{dataTypeNum}).TargBotheyes, 2)
                disp(currSession)
                error('Unequal number of channels!!')
            end
            
            for fieldNum = 1:length(fieldList)
                
                dt.(dataTypes{dataTypeNum}).(fieldList{fieldNum}) = single(dt.(dataTypes{dataTypeNum}).(fieldList{fieldNum}));
                dt.(dataTypes{dataTypeNum}).(fieldList{fieldNum}) = dt.(dataTypes{dataTypeNum}).(fieldList{fieldNum})(:, [1,3,5:8], :);
                
            end
            
            for chNum = 1:size(dt.(dataTypes{dataTypeNum}).TargBotheyes, 2)
                
                chNumChar = ['0' num2str(chNum)];
                chNumChar = chNumChar(end-1:end);
                
                if strcmp(dataTypes{dataTypeNum}, 'SPKSEL')
                    savename = [spkdir 'spk_' flList{ii}(17:end-4) '_' chNumChar '_ch' num2str(SInf.spk_elec(chNum)) '.mat'];
                elseif strcmp(dataTypes{dataTypeNum}, 'LFPSEL')
                    savename = [lfpdir 'lfp_' flList{ii}(17:end-4) '_' chNumChar '_ch' num2str(SInf.spk_elec(chNum)) '.mat'];
                end
                
                for fieldNum = 1:length(fieldList)
                    
                    SPKSEL_tmp.(fieldList{fieldNum}) = dt.(dataTypes{dataTypeNum}).(fieldList{fieldNum})(:, chNum, :);
                    SPKSEL_tmp.(fieldList{fieldNum}) = permute(SPKSEL_tmp.(fieldList{fieldNum}), [1 3 2]);
                    
                end
                
                SPKSEL_tmp.AddInfo = dt.SPKSEL.AddInfo;
                
                save(savename, '-struct', 'SPKSEL_tmp', ...
                    'TargBotheyes', 'nocatch_disap', 'CatchTargRemov', 'nocatch_nodisap', ...
                    'LE_nc_disap', 'RE_nc_disap', 'LE_nc_nodisap', 'RE_nc_nodisap', ...
                    'LE_Physdis', 'RE_Physdis', 'LE_conNodis', 'RE_conNodis', 'all_data', ...
                    'AddInfo')
                clear SPKSEL_tmp
                
            end
            
            clear dt
            
        elseif strcmp(currSession, '200207_barney_gfs1-04') % unequal number of elements
            
            disp(currSession)
            
        elseif strcmp(currSession, '060307_barney_gfs3-04') || ...
                strcmp(currSession, '071106_elvis_gfs2-04') || ...
                strcmp(currSession, '110207_barney_gfs1-04') || ...
                strcmp(currSession, '110207_barney_gfs2-04') || ...
                strcmp(currSession, '120207_barney_gfs1-04') || ...
                strcmp(currSession, '120207_barney_gfs2-04') || ...
                strcmp(currSession, '120207_barney_gfs3-04')
            
            disp(currSession)
            
        else
            
            if strcmp(dataTypes{dataTypeNum}, 'SPKSEL')
                spk_elec = [spk_elec SInf.spk_elec];
            elseif strcmp(dataTypes{dataTypeNum}, 'LFPSEL')
                lfp_elec = [lfp_elec SInf.lfp_elec];
            end
            
            unitqual = [unitqual SInf.unitqual];
            area = [area SInf.area];
            sessionInfo(length(sessionInfo) + 1 : length(sessionInfo) + length(SInf.spk_elec)) = {deal(currSession)};
            
            dt = load([dataDir flList{ii}], 'SPKSEL', 'LFPSEL');
            
            dt.SPKSEL.all_data = dt.SPKSEL.all;
            dt.SPKSEL = rmfield(dt.SPKSEL, 'all');
            dt.LFPSEL.all_data = dt.LFPSEL.all;
            dt.LFPSEL = rmfield(dt.LFPSEL, 'all');
            
            eyemodi = [eyemodi repelem(dt.SPKSEL.AddInfo.eyemodi, length(SInf.spk_elec))];
            
            if length(SInf.spk_elec) ~= size(dt.(dataTypes{dataTypeNum}).TargBotheyes, 2)
                disp(currSession)
                error('Unequal number of channels!!')
            end
            
            for fieldNum = 1:length(fieldList)
                
                dt.(dataTypes{dataTypeNum}).(fieldList{fieldNum}) = ...
                    single(dt.(dataTypes{dataTypeNum}).(fieldList{fieldNum}));
                
            end
            
            for chNum = 1:size(dt.(dataTypes{dataTypeNum}).TargBotheyes, 2)
                
                chNumChar = ['0' num2str(chNum)];
                chNumChar = chNumChar(end-1:end);
                
                if strcmp(dataTypes{dataTypeNum}, 'SPKSEL')
                    savename = [spkdir 'spk_' flList{ii}(17:end-4) '_' chNumChar '_ch' num2str(SInf.spk_elec(chNum)) '.mat'];
                elseif strcmp(dataTypes{dataTypeNum}, 'LFPSEL')
                    savename = [lfpdir 'lfp_' flList{ii}(17:end-4) '_' chNumChar '_ch' num2str(SInf.spk_elec(chNum)) '.mat'];
                end
                
                for fieldNum = 1:length(fieldList)
                    
                    SPKSEL_tmp.(fieldList{fieldNum}) = dt.(dataTypes{dataTypeNum}).(fieldList{fieldNum})(:, chNum, :);
                    SPKSEL_tmp.(fieldList{fieldNum}) = permute(SPKSEL_tmp.(fieldList{fieldNum}), [1 3 2]);
                    
                end
                
                SPKSEL_tmp.AddInfo = dt.SPKSEL.AddInfo;
                
                save(savename, '-struct', 'SPKSEL_tmp', ...
                    'TargBotheyes', 'nocatch_disap', 'CatchTargRemov', 'nocatch_nodisap', ...
                    'LE_nc_disap', 'RE_nc_disap', 'LE_nc_nodisap', 'RE_nc_nodisap', ...
                    'LE_Physdis', 'RE_Physdis', 'LE_conNodis', 'RE_conNodis', 'all_data', ...
                    'AddInfo')
                clear SPKSEL_tmp
                
            end
            
            clear dt
            
        end
        
    end
    
    if strcmp(dataTypes{dataTypeNum}, 'SPKSEL')
        
        save('spk_info.mat', 'spk_elec', 'unitqual', 'area', 'sessionInfo', 'eyemodi')
        
    elseif strcmp(dataTypes{dataTypeNum}, 'LFPSEL')
        
        save('lfp_info.mat', 'lfp_elec', 'area', 'sessionInfo', 'eyemodi')
        
    end
    
end

clear all
