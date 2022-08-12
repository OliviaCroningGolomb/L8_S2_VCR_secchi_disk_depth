% Set Up
clear
clc
close all 

% Change to virginiaCoast Folder
cd 'C:/Users/emb8xg/Documents/Lang_ZSD/Zsd_processing/' % Change for your system

stifdir = dir('C:/Users/emb8xg/Documents/Lang_ZSD/Zsd_processing/Inputs/S2/S2A/S2A_2021/*_ZSD.tif');
stifpath = 'C:/Users/emb8xg/Documents/Lang_ZSD/Zsd_processing/Inputs/S2/S2A/S2A_2021/';
out_tif = 'C:/Users/emb8xg/Documents/Lang_ZSD/Zsd_processing/Outputs/S2/S2A/Geotiff/S2A_2021/';

% Resample imagery
parfor tif = 1:length(stifdir)
    cd(stifpath)
         
    % Read Files
    tif_name = stifdir(tif).name;
    ras_in = tif_name;
        
    ras_name = strrep(tif_name,'_ZSD','_ZSD_resampled');
    ras_out = [out_tif, ras_name];
        
    %Just use gdalwarp
    func    = 'C:/Users/emb8xg/Miniconda3/envs/gis/Library/bin/gdalwarp ';
    opts    = '-t_srs EPSG:32618 -tr 30 30 -tap -r bilinear -of GTiff -co "TFW=NO" -overwrite ';
    command = [func opts ras_in ' ' ras_out];
    status  = system(command);
    %delete(ras_in)
    
end

