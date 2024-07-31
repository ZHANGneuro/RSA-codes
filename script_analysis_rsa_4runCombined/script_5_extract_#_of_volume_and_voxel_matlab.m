



% root_path = '/Users/bo/Documents/data_dean_lab';
% for ind_subject = 3:3
%     cur_image_struct = MRIread([root_path, '/data_swati_ket/image_raw_bold_sub', num2str(ind_subject),'_run', num2str(ind_run), '.nii.gz']);
%     cur_image = cur_image_struct.vol;
%     image_size = size(cur_image);
%     ['sub', num2str(ind_subject), ' run', num2str(ind_run), ' #volume: ', num2str(image_size(4)), ' #voxel: ', num2str(image_size(1) * image_size(2) * image_size(3) * image_size(4))]
% end
% ['Please copy & paste these values into "batch_file_generator"']


for ind_subject = 3:3
    cur_image_struct = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/image_standard_bold_nosm.nii');
    cur_image = cur_image_struct.vol;
    image_size = size(cur_image);
    ['sub', num2str(ind_subject), ' #volume: ', num2str(image_size(4)), ' #voxel: ', num2str(image_size(1) * image_size(2) * image_size(3) * image_size(4))]
end
['Please copy & paste these values into "batch_file_generator"']



