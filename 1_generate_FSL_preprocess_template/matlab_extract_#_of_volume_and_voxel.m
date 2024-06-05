

root_path = '/Users/bo/Documents/data_dean_lab';

for ind_subject = 1:31
    for ind_run = 1:4
        cur_image_struct = MRIread([root_path, '/sarah_safetyEstimationTask/raw_bold_sub_', num2str(ind_subject),'_run_', num2str(ind_run), '.nii.gz']);
        cur_image = cur_image_struct.vol;
        image_size = size(cur_image);
        ['sub', num2str(ind_subject), ' run', num2str(ind_run), ' #volume: ', num2str(image_size(4)), ' #voxel: ', num2str(image_size(1) * image_size(2) * image_size(3) * image_size(4))]
    end
end
['Please copy & paste these values into "batch_file_generator"']






