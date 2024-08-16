clear all, close all
% Check data analysis steps

datadir = 'F:\Luba\scripts\ndt_prep\pulvinar_both\';

filenames = {'spk_pulvinar_050606_elvis_gfs2-04_ch25_both.mat', ...
    'spk_pulvinar_050606_elvis_gfs2-04_ch26_both.mat', ...
    'spk_pulvinar_050606_elvis_gfs2-04_ch30_both.mat', ...
    'spk_pulvinar_050606_elvis_gfs2-04_ch31_both.mat', ...
    'spk_pulvinar_050606_elvis_gfs2-04_ch32_both.mat'};

for flNum = 1:length(filenames)
    
    currFile = [datadir filenames{flNum}];
    
    load(currFile)
    
    unqLabels = unique(raster_labels.condition_disap);
    
    lab1 = cellfun(@(x) strcmp(x, unqLabels{1}), raster_labels.condition_disap, 'Uniformoutput', 1);
    lab2 = cellfun(@(x) strcmp(x, unqLabels{2}), raster_labels.condition_disap, 'Uniformoutput', 1);
    lab3 = cellfun(@(x) strcmp(x, unqLabels{3}), raster_labels.condition_disap, 'Uniformoutput', 1);
    lab4 = cellfun(@(x) strcmp(x, unqLabels{4}), raster_labels.condition_disap, 'Uniformoutput', 1);
    
    c1 = mean(raster_data(lab1, :));
    c2 = mean(raster_data(lab2, :));
    c3 = mean(raster_data(lab3, :));
    c4 = mean(raster_data(lab4, :));
    
    figure,
    plot([smooth(c1, 250) smooth(c2, 250) smooth(c3, 250) smooth(c4, 250)])
    xline([1500 3000 5000])
    xlim([0 6500])
    title(filenames{flNum}(14:end-4), 'interpreter', 'none')
    legend(unqLabels, 'Location', 'Best', 'interpreter', 'none')
end