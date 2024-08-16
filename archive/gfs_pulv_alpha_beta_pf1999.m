clear all, close all

load('C:\Users\LVasileva\Documents\Luba\data\allLFPinclude\20151005_SPKLFP_010606_elvis_gfs1_04.mat')

% reshape data into 2d matrices
LFPSEL.le_disappdat = reshape(LFPSEL.le_disappdat, [6500, size(LFPSEL.le_disappdat, 2)*size(LFPSEL.le_disappdat, 3)]);
LFPSEL.re_disappdat = reshape(LFPSEL.re_disappdat, [6500, size(LFPSEL.re_disappdat, 2)*size(LFPSEL.re_disappdat, 3)]);
LFPSEL.TargBotheyes = reshape(LFPSEL.TargBotheyes, [6500, size(LFPSEL.TargBotheyes, 2)*size(LFPSEL.TargBotheyes, 3)]);
LFPSEL.nocatch_disap = reshape(LFPSEL.nocatch_disap, [6500, size(LFPSEL.nocatch_disap, 2)*size(LFPSEL.nocatch_disap, 3)]);
LFPSEL.nocatch_nodisap = reshape(LFPSEL.nocatch_nodisap, [6500, size(LFPSEL.nocatch_nodisap, 2)*size(LFPSEL.nocatch_nodisap, 3)]);
LFPSEL.CatchTargRemov = reshape(LFPSEL.CatchTargRemov, [6500, size(LFPSEL.CatchTargRemov, 2)*size(LFPSEL.CatchTargRemov, 3)]);
LFPSEL.CatchTargRemov_allSOF = reshape(LFPSEL.CatchTargRemov_allSOF, [6500, size(LFPSEL.CatchTargRemov_allSOF, 2)*size(LFPSEL.CatchTargRemov_allSOF, 3)]);
LFPSEL.LE_nc_disap = reshape(LFPSEL.LE_nc_disap, [6500, size(LFPSEL.LE_nc_disap, 2)*size(LFPSEL.LE_nc_disap, 3)]);
LFPSEL.RE_nc_disap = reshape(LFPSEL.RE_nc_disap, [6500, size(LFPSEL.RE_nc_disap, 2)*size(LFPSEL.RE_nc_disap, 3)]);
LFPSEL.LE_nc_nodisap = reshape(LFPSEL.LE_nc_nodisap, [6500, size(LFPSEL.LE_nc_nodisap, 2)*size(LFPSEL.LE_nc_nodisap, 3)]);
LFPSEL.RE_nc_nodisap = reshape(LFPSEL.RE_nc_nodisap, [6500, size(LFPSEL.RE_nc_nodisap, 2)*size(LFPSEL.RE_nc_nodisap, 3)]);
LFPSEL.LE_Physdis = reshape(LFPSEL.LE_Physdis, [6500, size(LFPSEL.LE_Physdis, 2)*size(LFPSEL.LE_Physdis, 3)]);
LFPSEL.RE_Physdis = reshape(LFPSEL.RE_Physdis, [6500, size(LFPSEL.RE_Physdis, 2)*size(LFPSEL.RE_Physdis, 3)]);
LFPSEL.LE_Physdis_allSOF = reshape(LFPSEL.LE_Physdis_allSOF, [6500, size(LFPSEL.LE_Physdis_allSOF, 2)*size(LFPSEL.LE_Physdis_allSOF, 3)]);
LFPSEL.RE_Physdis_allSOF = reshape(LFPSEL.RE_Physdis_allSOF, [6500, size(LFPSEL.RE_Physdis_allSOF, 2)*size(LFPSEL.RE_Physdis_allSOF, 3)]);
LFPSEL.LE_conNodis = reshape(LFPSEL.LE_conNodis, [6500, size(LFPSEL.LE_conNodis, 2)*size(LFPSEL.LE_conNodis, 3)]);
LFPSEL.RE_conNodis = reshape(LFPSEL.RE_conNodis, [6500, size(LFPSEL.RE_conNodis, 2)*size(LFPSEL.RE_conNodis, 3)]);
LFPSEL.alllat_ncdisap = reshape(LFPSEL.alllat_ncdisap, [6500, size(LFPSEL.alllat_ncdisap, 2)*size(LFPSEL.alllat_ncdisap, 3)]);
LFPSEL.all = reshape(LFPSEL.all, [6500, size(LFPSEL.all, 2)*size(LFPSEL.all, 3)]);


% get alpha filtered data
LFPALPH.le_disappdat = pfurtscheller_daSilva(LFPSEL.le_disappdat, 8, 14);
LFPALPH.re_disappdat = pfurtscheller_daSilva(LFPSEL.re_disappdat, 8, 14);
LFPALPH.TargBotheyes = pfurtscheller_daSilva(LFPSEL.TargBotheyes, 8, 14);
LFPALPH.nocatch_disap = pfurtscheller_daSilva(LFPSEL.nocatch_disap, 8, 14);
LFPALPH.nocatch_nodisap = pfurtscheller_daSilva(LFPSEL.nocatch_nodisap, 8, 14);
LFPALPH.CatchTargRemov = pfurtscheller_daSilva(LFPSEL.CatchTargRemov, 8, 14);
LFPALPH.CatchTargRemov_allSOF = pfurtscheller_daSilva(LFPSEL.CatchTargRemov_allSOF, 8, 14);
LFPALPH.CatchTargRemov_allSOF = pfurtscheller_daSilva(LFPSEL.CatchTargRemov_allSOF, 8, 14);
LFPALPH.RE_nc_disap = pfurtscheller_daSilva(LFPSEL.RE_nc_disap, 8, 14);
LFPALPH.RE_nc_disap = pfurtscheller_daSilva(LFPSEL.LE_nc_disap, 8, 14);
LFPALPH.LE_nc_nodisap = pfurtscheller_daSilva(LFPSEL.LE_nc_nodisap, 8, 14);
LFPALPH.RE_nc_nodisap = pfurtscheller_daSilva(LFPSEL.RE_nc_nodisap, 8, 14);
LFPALPH.LE_Physdis = pfurtscheller_daSilva(LFPSEL.LE_Physdis, 8, 14);
LFPALPH.RE_Physdis = pfurtscheller_daSilva(LFPSEL.RE_Physdis, 8, 14);
LFPALPH.LE_Physdis_allSOF = pfurtscheller_daSilva(LFPSEL.LE_Physdis_allSOF, 8, 14);
LFPALPH.RE_Physdis_allSOF = pfurtscheller_daSilva(LFPSEL.RE_Physdis_allSOF, 8, 14);
LFPALPH.LE_conNodis = pfurtscheller_daSilva(LFPSEL.LE_conNodis, 8, 14);
LFPALPH.RE_conNodis = pfurtscheller_daSilva(LFPSEL.RE_conNodis, 8, 14);
LFPALPH.alllat_ncdisap = pfurtscheller_daSilva(LFPSEL.alllat_ncdisap, 8, 14);
LFPALPH.all = pfurtscheller_daSilva(LFPSEL.all, 8, 14);

% get beta filtered data
LFPBETA.le_disappdat = pfurtscheller_daSilva(LFPSEL.le_disappdat, 14, 25);
LFPBETA.re_disappdat = pfurtscheller_daSilva(LFPSEL.re_disappdat, 14, 25);
LFPBETA.TargBotheyes = pfurtscheller_daSilva(LFPSEL.TargBotheyes, 14, 25);
LFPBETA.nocatch_disap = pfurtscheller_daSilva(LFPSEL.nocatch_disap, 14, 25);
LFPBETA.nocatch_nodisap = pfurtscheller_daSilva(LFPSEL.nocatch_nodisap, 14, 25);
LFPBETA.CatchTargRemov = pfurtscheller_daSilva(LFPSEL.CatchTargRemov, 14, 25);
LFPBETA.CatchTargRemov_allSOF = pfurtscheller_daSilva(LFPSEL.CatchTargRemov_allSOF, 14, 25);
LFPBETA.CatchTargRemov_allSOF = pfurtscheller_daSilva(LFPSEL.CatchTargRemov_allSOF, 14, 25);
LFPBETA.RE_nc_disap = pfurtscheller_daSilva(LFPSEL.RE_nc_disap, 14, 25);
LFPBETA.RE_nc_disap = pfurtscheller_daSilva(LFPSEL.LE_nc_disap, 14, 25);
LFPBETA.LE_nc_nodisap = pfurtscheller_daSilva(LFPSEL.LE_nc_nodisap, 14, 25);
LFPBETA.RE_nc_nodisap = pfurtscheller_daSilva(LFPSEL.RE_nc_nodisap, 14, 25);
LFPBETA.LE_Physdis = pfurtscheller_daSilva(LFPSEL.LE_Physdis, 14, 25);
LFPBETA.RE_Physdis = pfurtscheller_daSilva(LFPSEL.RE_Physdis, 14, 25);
LFPBETA.LE_Physdis_allSOF = pfurtscheller_daSilva(LFPSEL.LE_Physdis_allSOF, 14, 25);
LFPBETA.RE_Physdis_allSOF = pfurtscheller_daSilva(LFPSEL.RE_Physdis_allSOF, 14, 25);
LFPBETA.LE_conNodis = pfurtscheller_daSilva(LFPSEL.LE_conNodis, 14, 25);
LFPBETA.RE_conNodis = pfurtscheller_daSilva(LFPSEL.RE_conNodis, 14, 25);
LFPBETA.alllat_ncdisap = pfurtscheller_daSilva(LFPSEL.alllat_ncdisap, 14, 25);
LFPBETA.all = pfurtscheller_daSilva(LFPSEL.all, 14, 25);

% 

figure,
plot(mean(LFPALPH.nocatch_disap, 2), 'b')
hold on
plot(mean(LFPALPH.nocatch_nodisap, 2), 'r')
plot(mean(LFPALPH.CatchTargRemov, 2), 'g')
hold off
legend('nocatch_disap', 'nocatch_nodisap', 'CatchTargRemov')
%lfp_pfsi = pfurtscheller_daSilva(lfp, low_cut, high_cut);



