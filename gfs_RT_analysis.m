clear all, close all

dataDir = 'C:\Users\lvasileva\Documents\Luba\data\allLFPinclude\';

flList = dir([dataDir '*.mat']);

RT.disap_physical = [];
RT.disap_ambiguous = [];

for flNum = 1:length(flList)
    
    disp(['Loading ' flList(flNum).name])
    load([dataDir flList(flNum).name], 'LFPSEL');
        
    RT.disap_physical = [RT.disap_physical LFPSEL.RPL.CatchTargRemov];
    RT.disap_ambiguous = [RT.disap_ambiguous LFPSEL.RPL.nc_disap];
    
end

figure
h(1) = histogram(RT.disap_physical);
hold on
h(2) = histogram(RT.disap_ambiguous);
stem(median(RT.disap_physical), 550, 'b')
stem(median(RT.disap_ambiguous), 550, 'r')
xlim([0 1000])
xlabel('Reaction Time, ms')
ylabel('# of Cases')
legend('RT physical', 'RT ambiguous', ...
    [num2str(median(RT.disap_physical)) 'Median RT physical'], ...
    [num2str(median(RT.disap_ambiguous)) 'Median RT ambiguous'])
