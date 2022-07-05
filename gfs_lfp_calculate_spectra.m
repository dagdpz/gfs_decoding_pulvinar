clear all, close all

data_dir = 'F:\Luba\scripts\lfp_data\';

savedir = 'F:\Luba\scripts\lfp_power_spectra\';

flList = dir([data_dir '*.mat']);

for flNum = 1:length(flList)
    
    load([data_dir flList(flNum).name])
    
    undScrId = find(flList(flNum).name == '_', 2, 'last');
    session_id = flList(flNum).name(5:undScrId(1)-1);
    
    SInf = getSesInfo_sorted_lats_J(session_id);
    
    chId = strfind(flList(flNum).name, 'ch');
    chNum_char = flList(flNum).name(chId-3:chId-2);
    chNum_num = str2double(chNum_char);
    
    savename = [savedir session_id '_ch' chNum_char '.mat'];
    
    if exist(savename, 'file') == 2
        continue
    end
    
    % conditions for both eyes
    if ~isempty(CatchTargRemov)
        spectra.CatchTargRemov = calc_spectra(CatchTargRemov, 1000);
    else
        spectra.CatchTargRemov = [];
    end
    
    if ~isempty(TargBotheyes)
        spectra.TargBotheyes = calc_spectra(TargBotheyes, 1000);
    else
        spectra.TargBotheyes = [];
    end
    
    if ~isempty(nocatch_disap)
        spectra.nocatch_disap = calc_spectra(nocatch_disap, 1000);
    else
        spectra.nocatch_disap = [];
    end
    
    if ~isempty(nocatch_nodisap)
        spectra.nocatch_nodisap = calc_spectra(nocatch_nodisap, 1000);
    else
        spectra.nocatch_nodisap = [];
    end
    
    % conditions for the left eye
    if ~isempty(LE_conNodis)
        spectra.LE_conNodis = calc_spectra(LE_conNodis, 1000);
    else
        spectra.LE_conNodis = [];
    end
    
    if ~isempty(LE_nc_disap)
        spectra.LE_nc_disap = calc_spectra(LE_nc_disap, 1000);
    else
        spectra.LE_nc_disap = [];
    end
    
    if ~isempty(LE_nc_nodisap)
        spectra.LE_nc_nodisap = calc_spectra(LE_nc_nodisap, 1000);
    else
        spectra.LE_nc_nodisap = [];
    end
    
    if ~isempty(LE_Physdis)
        spectra.LE_Physdis = calc_spectra(LE_Physdis, 1000);
    else
        spectra.LE_Physdis = [];
    end
    
    % conditions for the right eye
    if ~isempty(RE_conNodis)
        spectra.RE_conNodis = calc_spectra(RE_conNodis, 1000);
	else
        spectra.RE_conNodis = [];
    end
    
    if ~isempty(RE_nc_disap)
        spectra.RE_nc_disap = calc_spectra(RE_nc_disap, 1000);
    else
        spectra.RE_nc_disap = [];
    end
    
    if ~isempty(RE_nc_nodisap)
        spectra.RE_nc_nodisap = calc_spectra(RE_nc_nodisap, 1000);
    else
        spectra.RE_nc_nodisap = [];
    end
    
    if ~isempty(RE_Physdis)
        spectra.RE_Physdis = calc_spectra(RE_Physdis, 1000);
    else
        spectra.RE_Physdis = [];
    end
    
    % add all the trials
    [spectra.all_data, spectra.frequencies] = calc_spectra(all_data, 1000);
    
    spectra.AddInfo = AddInfo;
    
    clear CatchTargRemov TargBotheyes nocatch_disap nocatch_nodisap ...
        LE_conNodis LE_nc_disap LE_nc_nodisap LE_Physdis ...
        RE_conNodis RE_nc_disap RE_nc_nodisap RE_Physdis ...
        all_data
    
    save(savename, '-struct', 'spectra', ...
        'TargBotheyes', 'nocatch_disap', 'CatchTargRemov', 'nocatch_nodisap', ...
        'LE_nc_disap', 'RE_nc_disap', 'LE_nc_nodisap', 'RE_nc_nodisap', ...
        'LE_Physdis', 'RE_Physdis', 'LE_conNodis', 'RE_conNodis', 'all_data', ...
        'AddInfo', 'frequencies')
    
    clear spectra
    
end
