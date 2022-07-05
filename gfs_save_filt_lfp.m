clear all, close all

data_dir = 'F:\Luba\scripts\lfp_data\';

savedir = 'F:\Luba\scripts\lfp_filt1-100Hz\';

flList = dir([data_dir '*.mat']);

for flNum = 1:length(flList)
    
    load([data_dir flList(flNum).name])
    
    undScrId = find(flList(flNum).name == '_', 2, 'last');
    session_id = flList(flNum).name(5:undScrId(1)-1);
    
    SInf = getSesInfo_sorted_lats_J(session_id);
    
    chId = strfind(flList(flNum).name, 'ch');
    chNum_char = flList(flNum).name(chId-3:chId-2);
    chNum_num = str2double(chNum_char);
    
    CatchTargRemov = lfp_filt(CatchTargRemov, 1, 100);
    TargBotheyes = lfp_filt(TargBotheyes, 1, 100);
    nocatch_disap = lfp_filt(nocatch_disap, 1, 100);
    nocatch_nodisap = lfp_filt(nocatch_nodisap, 1, 100);
    LE_nc_disap = lfp_filt(LE_nc_disap, 1, 100);
    LE_nc_nodisap = lfp_filt(LE_nc_nodisap, 1, 100);
    LE_Physdis = lfp_filt(LE_Physdis, 1, 100);
    LE_conNodis = lfp_filt(LE_conNodis, 1, 100);
    RE_conNodis = lfp_filt(RE_conNodis, 1, 100);
    RE_nc_disap = lfp_filt(RE_nc_disap, 1, 100);
    RE_nc_nodisap = lfp_filt(RE_nc_nodisap, 1, 100);
    RE_Physdis = lfp_filt(RE_Physdis, 1, 100);
    all_data = lfp_filt(all_data, 1, 100);
    
    savename = [savedir session_id '_ch' chNum_char '.mat'];
    save(savename, ...
        'CatchTargRemov', 'TargBotheyes', 'nocatch_disap', 'nocatch_nodisap', ...
        'LE_nc_disap', 'LE_nc_nodisap', 'LE_Physdis', 'LE_conNodis', ...
        'RE_conNodis', 'RE_nc_disap', 'RE_nc_nodisap', 'RE_Physdis', ...
        'all_data')
    
end
