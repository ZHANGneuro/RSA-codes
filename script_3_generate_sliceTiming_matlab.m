

% extract slice timing from json file
root_path = '/Users/bo/Documents/data_dean_lab';
jsonFileName = [root_path, '/data_swati_ket/func-bold_task-socmedia_run-1.json'];
jsonStr = fileread(jsonFileName);
jsonData = jsondecode(jsonStr);
list_slice_timging = jsonData.SliceTiming;

% slice timing transformation 
% The transformed units are in TRs, the range of values is between -0.5 and
% 0.5 (1TR) as required below
% https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FEAT/UserGuide
list_slice_timging = (list_slice_timging-min(list_slice_timging))/(max(list_slice_timging-mean(list_slice_timging)) - min(list_slice_timging-mean(list_slice_timging))) - 0.5;

% save to txt
% here 72 means 72 slices in z axis of BOLD images
fid = fopen([root_path, '/data_swati_ket/slice_timing.txt'],'w');
for n = 1:length(list_slice_timging(:,1))
    fprintf(fid,'%f\n', list_slice_timging(n,:));
end
fclose(fid);







% % swati
% aa = load('/Users/bo/Documents/data_dean_lab/data_swati_ket/func-bold_task-socmedia_run-1.json');
% aa = aa.h.func_bold_task_socmedia_run_1;
% 
% slice_timing = aa.SliceTiming;
% 
% % save to txt
% % here 72 means 72 slices in z axis of BOLD images
% fid = fopen('/Users/bo/Documents/data_dean_lab/data_swati/slice_timing.txt','w');
% for n = 1:length(slice_timing(:,1))
%     fprintf(fid,'%f\n', slice_timing(n,:));
% end
% fclose(fid);



