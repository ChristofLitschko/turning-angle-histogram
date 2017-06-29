% --- HISTOGRAM ---
% IMPORTANT: create variable "x" and enter data !!!
% marking in Excel: Shift + Ctrl + Pfeilunten

clearvars -except x
clc


% --- generate histogram ---
xbins = [-180; -170; -160; -150; -140; -130; -120; -110; -100; -90; -80; -70; -60; -50; -40; -30; -20; -10; 0; 10; 20; 30; 40; 50; 60; 70; 80; 90; 100; 110; 120; 130; 140; 150; 160; 170; 180];
[counts,~] = hist(x, xbins);
counts2=transpose(counts);
sum_counts = sum(counts);

% --- calculate frequency in percent ---
for i=1:length(counts2);
    counts2(i,2) = (counts2(i,1)/sum_counts)*100;
end

% --- prepare everything for export ---
output_data = [xbins counts2];
output_data2= num2cell(output_data);
col_1 = ['turning angle (deg)'];
col_2 = ['counts'];
col_3 = ['frequency (%)'];
header = {col_1, col_2, col_3};
output_fin = vertcat(header, output_data2);

filename = uigetfile('*.*', 'Select TIFF stack for analysis');
newname = strrep(filename, 'tracks.tif', 'turnangle hist.xls');
xlswrite(newname, output_fin);

clear all

