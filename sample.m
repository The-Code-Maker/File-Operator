%%
clear
clc
close all

%%
method = 'alltype-keyword';
options.filepath = 'F:\H-CFD\Wate-Entry\Cylinder\Case-VOF-Imlicit-1e-5-ke-NC';
options.filetype = 'gz';
options.keyword = 'SimBuilding-';
filerenamer(method,options)