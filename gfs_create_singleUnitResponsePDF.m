clear all, close all

dataDir = '.\allAreas_both';

flList = dir([dataDir filesep '*.mat']);

for flNum = 1:length(flList)
    
    currFile = [dataDir filesep flList(flNum).name];
    
    load(currFile)
    
    unqLabels = unique(raster_labels.condition_disap);
    
    for labNum = 1:length(unqLabels)
        
        currInds = cellfun(@ (x) strcmp(x, unqLabels{labNum}), raster_labels.condition_disap);
        
        currData = raster_data(currInds, :);
        
    end
    
    figure,
    
    
    
end
