function struct = readL2_crop(filename,start,count)
% Description: This function reads and formats date, coordinates, and
% geophysical parameter information 
%
% Input:
% filename: Level 2 product from SeaDAS; generally ends with '.L2_LAC_OC'
% 
% Output:
% struct = Matlab Structure with SeaDAS variables and metadata
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Read and Format Date 
    year = unique(ncread(filename,'/scan_line_attributes/year'));
    doy = unique(ncread(filename,'/scan_line_attributes/day'));
    struct.date = datetime(year,1,0) + caldays(doy);

    % Read Coordinates
    
    struct.Lat = ncread(filename,'/navigation_data/latitude',start,count);
    struct.Lon = ncread(filename,'/navigation_data/longitude',start,count);
    
    % Read Geophysical Parameters
    struct.rrs_442 = ncread(filename,'/geophysical_data/Rrs_442',start,count);
    struct.rrs_492 = ncread(filename,'/geophysical_data/Rrs_492',start,count);
    struct.rrs_559 = ncread(filename,'/geophysical_data/Rrs_559',start,count);
    struct.rrs_665 = ncread(filename,'/geophysical_data/Rrs_665',start,count);
    struct.chl = ncread(filename,'/geophysical_data/chlor_a',start,count);
    struct.kd_490 = ncread(filename,'/geophysical_data/Kd_490',start,count);
   % struct.aot_865 = ncread(filename,'/geophysical_data/aot_865');
    struct.angstrom = ncread(filename,'/geophysical_data/angstrom',start,count);
    struct.l2_flags = ncread(filename,'/geophysical_data/l2_flags',start,count);
    
end

