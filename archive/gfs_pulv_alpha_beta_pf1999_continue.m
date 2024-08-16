clear all, close all

% find all data files
flList = dir('C:\Users\LVasileva\Documents\data\allLFPinclude\*.mat');

% make inermediate variables
lfp_nocatch_disap = [];
lfp_nocatch_nodisap = [];
lfp_CatchTargRemov = [];

% make resulting variables
nocatch_disap = [];
nocatch_nodisap = [];
CatchTargRemov = [];

% loop through data files
for flNum = 1:length(flList)
    
    filename = [flList(flNum).folder filesep flList(flNum).name];
    load(filename, 'LFPSEL')
    
    % get an info id
    info_id = flList(flNum).name(17:end-4);
    
    % figure out recording information
    SInf = getSesInfo_sorted_lats_J(info_id);
    
    % now we're interested in SInf.area contents. Take only pulvinar 
    % recordings SInf.area = 1
    chans2take = SInf.area == 1;
    clear SInf
    
    % select only pulvinar channels
%     LFP.le_disappdat = LFPSEL.le_disappdat(:, chans2take, :);
%     LFP.re_disappdat = LFPSEL.re_disappdat(:, chans2take, :);
%     LFP.TargBotheyes = LFPSEL.TargBotheyes(:, chans2take, :);
    LFP.nocatch_disap = LFPSEL.nocatch_disap(:, chans2take, :);
    LFP.nocatch_nodisap = LFPSEL.nocatch_nodisap(:, chans2take, :);
    LFP.CatchTargRemov = LFPSEL.CatchTargRemov(:, chans2take, :);
%     LFP.CatchTargRemov_allSOF = LFPSEL.CatchTargRemov_allSOF(:, chans2take, :);
%     LFP.LE_nc_disap = LFPSEL.LE_nc_disap(:, chans2take, :);
%     LFP.RE_nc_disap = LFPSEL.RE_nc_disap(:, chans2take, :);
%     LFP.LE_nc_nodisap = LFPSEL.LE_nc_nodisap(:, chans2take, :);
%     LFP.RE_nc_nodisap = LFPSEL.RE_nc_nodisap(:, chans2take, :);
%     LFP.LE_Physdis = LFPSEL.LE_Physdis(:, chans2take, :);
%     LFP.RE_Physdis = LFPSEL.RE_Physdis(:, chans2take, :);
%     LFP.LE_Physdis_allSOF = LFPSEL.LE_Physdis_allSOF(:, chans2take, :);
%     LFP.RE_Physdis_allSOF = LFPSEL.RE_Physdis_allSOF(:, chans2take, :);
%     LFP.LE_conNodis = LFPSEL.LE_conNodis(:, chans2take, :);
%     LFP.RE_conNodis = LFPSEL.RE_conNodis(:, chans2take, :);
%     LFP.alllat_ncdisap = LFPSEL.alllat_ncdisap(:, chans2take, :);
%     LFP.all = LFPSEL.all(:, chans2take, :);
    clear LFPSEL

    % reshape data into 2d matrices
%     LFP.le_disappdat = reshape(LFP.le_disappdat, [6500, size(LFP.le_disappdat, 2)*size(LFP.le_disappdat, 3)]);
%     LFP.re_disappdat = reshape(LFP.re_disappdat, [6500, size(LFP.re_disappdat, 2)*size(LFP.re_disappdat, 3)]);
%     LFP.TargBotheyes = reshape(LFP.TargBotheyes, [6500, size(LFP.TargBotheyes, 2)*size(LFP.TargBotheyes, 3)]);
    LFP.nocatch_disap = reshape(LFP.nocatch_disap, [6500, size(LFP.nocatch_disap, 2)*size(LFP.nocatch_disap, 3)]);
    LFP.nocatch_nodisap = reshape(LFP.nocatch_nodisap, [6500, size(LFP.nocatch_nodisap, 2)*size(LFP.nocatch_nodisap, 3)]);
    LFP.CatchTargRemov = reshape(LFP.CatchTargRemov, [6500, size(LFP.CatchTargRemov, 2)*size(LFP.CatchTargRemov, 3)]);
%     LFP.CatchTargRemov_allSOF = reshape(LFP.CatchTargRemov_allSOF, [6500, size(LFP.CatchTargRemov_allSOF, 2)*size(LFP.CatchTargRemov_allSOF, 3)]);
%     LFP.LE_nc_disap = reshape(LFP.LE_nc_disap, [6500, size(LFP.LE_nc_disap, 2)*size(LFP.LE_nc_disap, 3)]);
%     LFP.RE_nc_disap = reshape(LFP.RE_nc_disap, [6500, size(LFP.RE_nc_disap, 2)*size(LFP.RE_nc_disap, 3)]);
%     LFP.LE_nc_nodisap = reshape(LFP.LE_nc_nodisap, [6500, size(LFP.LE_nc_nodisap, 2)*size(LFP.LE_nc_nodisap, 3)]);
%     LFP.RE_nc_nodisap = reshape(LFP.RE_nc_nodisap, [6500, size(LFP.RE_nc_nodisap, 2)*size(LFP.RE_nc_nodisap, 3)]);
%     LFP.LE_Physdis = reshape(LFP.LE_Physdis, [6500, size(LFP.LE_Physdis, 2)*size(LFP.LE_Physdis, 3)]);
%     LFP.RE_Physdis = reshape(LFP.RE_Physdis, [6500, size(LFP.RE_Physdis, 2)*size(LFP.RE_Physdis, 3)]);
%     LFP.LE_Physdis_allSOF = reshape(LFP.LE_Physdis_allSOF, [6500, size(LFP.LE_Physdis_allSOF, 2)*size(LFP.LE_Physdis_allSOF, 3)]);
%     LFP.RE_Physdis_allSOF = reshape(LFP.RE_Physdis_allSOF, [6500, size(LFP.RE_Physdis_allSOF, 2)*size(LFP.RE_Physdis_allSOF, 3)]);
%     LFP.LE_conNodis = reshape(LFP.LE_conNodis, [6500, size(LFP.LE_conNodis, 2)*size(LFP.LE_conNodis, 3)]);
%     LFP.RE_conNodis = reshape(LFP.RE_conNodis, [6500, size(LFP.RE_conNodis, 2)*size(LFP.RE_conNodis, 3)]);
%     LFP.alllat_ncdisap = reshape(LFP.alllat_ncdisap, [6500, size(LFP.alllat_ncdisap, 2)*size(LFP.alllat_ncdisap, 3)]);
%     LFP.all = reshape(LFP.all, [6500, size(LFP.all, 2)*size(LFP.all, 3)]);
    
    lfp_nocatch_disap = [lfp_nocatch_disap LFP.nocatch_disap];
    lfp_nocatch_nodisap = [lfp_nocatch_nodisap LFP.nocatch_nodisap];
    lfp_CatchTargRemov = [lfp_CatchTargRemov LFP.CatchTargRemov];

    % get alpha filtered data
%     LFPALPH.le_disappdat = pfurtscheller_daSilva(LFP.le_disappdat, 8, 14);
%     LFPALPH.re_disappdat = pfurtscheller_daSilva(LFP.re_disappdat, 8, 14);
%     LFPALPH.TargBotheyes = pfurtscheller_daSilva(LFP.TargBotheyes, 8, 14);
    LFPALPH.nocatch_disap = pfurtscheller_daSilva(LFP.nocatch_disap, 8, 14);
    LFPALPH.nocatch_nodisap = pfurtscheller_daSilva(LFP.nocatch_nodisap, 8, 14);
    LFPALPH.CatchTargRemov = pfurtscheller_daSilva(LFP.CatchTargRemov, 8, 14);
%     LFPALPH.CatchTargRemov_allSOF = pfurtscheller_daSilva(LFP.CatchTargRemov_allSOF, 8, 14);
%     LFPALPH.CatchTargRemov_allSOF = pfurtscheller_daSilva(LFP.CatchTargRemov_allSOF, 8, 14);
%     LFPALPH.RE_nc_disap = pfurtscheller_daSilva(LFP.RE_nc_disap, 8, 14);
%     LFPALPH.RE_nc_disap = pfurtscheller_daSilva(LFP.LE_nc_disap, 8, 14);
%     LFPALPH.LE_nc_nodisap = pfurtscheller_daSilva(LFP.LE_nc_nodisap, 8, 14);
%     LFPALPH.RE_nc_nodisap = pfurtscheller_daSilva(LFP.RE_nc_nodisap, 8, 14);
%     LFPALPH.LE_Physdis = pfurtscheller_daSilva(LFP.LE_Physdis, 8, 14);
%     LFPALPH.RE_Physdis = pfurtscheller_daSilva(LFP.RE_Physdis, 8, 14);
%     LFPALPH.LE_Physdis_allSOF = pfurtscheller_daSilva(LFP.LE_Physdis_allSOF, 8, 14);
%     LFPALPH.RE_Physdis_allSOF = pfurtscheller_daSilva(LFP.RE_Physdis_allSOF, 8, 14);
%     LFPALPH.LE_conNodis = pfurtscheller_daSilva(LFP.LE_conNodis, 8, 14);
%     LFPALPH.RE_conNodis = pfurtscheller_daSilva(LFP.RE_conNodis, 8, 14);
%     LFPALPH.alllat_ncdisap = pfurtscheller_daSilva(LFP.alllat_ncdisap, 8, 14);
%     LFPALPH.all = pfurtscheller_daSilva(LFP.all, 8, 14);
    
    % get nocatch_disap and nocatch_nodisap
    nocatch_disap = [nocatch_disap LFPALPH.nocatch_disap];
    nocatch_nodisap = [nocatch_nodisap LFPALPH.nocatch_nodisap];
    CatchTargRemov = [CatchTargRemov LFPALPH.CatchTargRemov];
    
    % get beta filtered data
%     LFPBETA.le_disappdat = pfurtscheller_daSilva(LFP.le_disappdat, 14, 25);
%     LFPBETA.re_disappdat = pfurtscheller_daSilva(LFP.re_disappdat, 14, 25);
%     LFPBETA.TargBotheyes = pfurtscheller_daSilva(LFP.TargBotheyes, 14, 25);
%     LFPBETA.nocatch_disap = pfurtscheller_daSilva(LFP.nocatch_disap, 14, 25);
%     LFPBETA.nocatch_nodisap = pfurtscheller_daSilva(LFP.nocatch_nodisap, 14, 25);
%     LFPBETA.CatchTargRemov = pfurtscheller_daSilva(LFP.CatchTargRemov, 14, 25);
%     LFPBETA.CatchTargRemov_allSOF = pfurtscheller_daSilva(LFP.CatchTargRemov_allSOF, 14, 25);
%     LFPBETA.CatchTargRemov_allSOF = pfurtscheller_daSilva(LFP.CatchTargRemov_allSOF, 14, 25);
%     LFPBETA.RE_nc_disap = pfurtscheller_daSilva(LFP.RE_nc_disap, 14, 25);
%     LFPBETA.RE_nc_disap = pfurtscheller_daSilva(LFP.LE_nc_disap, 14, 25);
%     LFPBETA.LE_nc_nodisap = pfurtscheller_daSilva(LFP.LE_nc_nodisap, 14, 25);
%     LFPBETA.RE_nc_nodisap = pfurtscheller_daSilva(LFP.RE_nc_nodisap, 14, 25);
%     LFPBETA.LE_Physdis = pfurtscheller_daSilva(LFP.LE_Physdis, 14, 25);
%     LFPBETA.RE_Physdis = pfurtscheller_daSilva(LFP.RE_Physdis, 14, 25);
%     LFPBETA.LE_Physdis_allSOF = pfurtscheller_daSilva(LFP.LE_Physdis_allSOF, 14, 25);
%     LFPBETA.RE_Physdis_allSOF = pfurtscheller_daSilva(LFP.RE_Physdis_allSOF, 14, 25);
%     LFPBETA.LE_conNodis = pfurtscheller_daSilva(LFP.LE_conNodis, 14, 25);
%     LFPBETA.RE_conNodis = pfurtscheller_daSilva(LFP.RE_conNodis, 14, 25);
%     LFPBETA.alllat_ncdisap = pfurtscheller_daSilva(LFP.alllat_ncdisap, 14, 25);
%     LFPBETA.all = pfurtscheller_daSilva(LFP.all, 14, 25);
    clear LFP LFPALPH chans2take
end


save lfp_results2.mat lfp_CatchTargRemov lfp_nocatch_disap lfp_nocatch_nodisap CatchTargRemov nocatch_disap nocatch_nodisap

%     figure,
%     plot(mean(nocatch_disap, 2), 'b')
%     hold on
%     plot(mean(nocatch_nodisap, 2), 'r')
%     plot(mean(CatchTargRemov, 2), 'g')
%     hold off
%     legend('nocatch_disap', 'nocatch_nodisap', 'CatchTargRemov')
%     %lfp_pfsi = pfurtscheller_daSilva(lfp, low_cut, high_cut);
% 
%     
%     %% plot filtered data
%     
%     figure,
%     subplot(3, 1, 1)
%     plot(lfp_CatchTargRemov)
%     
%     subplot(3, 1, 2)
%     plot(lfp_nocatch_disap)
%     
%     subplot(3, 1, 3)
%     plot(lfp_nocatch_nodisap)










