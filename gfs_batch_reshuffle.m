clear all, close all

params = gfs_decoding_parameters_Tuebingen;

for parNum = 1:length(params)
    
    mkdir(params(parNum).mkdir1)
    mkdir(params(parNum).mkdir2)
    
    for i = 0:500
        i
        if i == 0
            save_file_name = [params(parNum).save_file_name0 '.mat'];
        else
            save_file_name = [params(parNum).save_file_name1 num2str(i, '%03d') '.mat'];
        end
        
        if exist(save_file_name, 'file') == 2
            continue
        end
        
        disp(['Decoding from ' params(parNum).paradigm])
        gfs_run_basic_decoding_shuff_pulvinar(i, params(parNum));
    end
    
end
