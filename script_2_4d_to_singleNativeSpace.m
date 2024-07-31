

% export single images
cur_run = 4;
cur_sm = 0;
cur_struct = MRIread(['/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/preprocessing_sm',num2str(cur_sm),'_sub3_run',num2str(cur_run),'.feat/filtered_func_data.nii.gz']);
cur_image = cur_struct.vol;
ima_size = size(cur_image);

for ith = 1:ima_size(4)
    cur_struct.vol = cur_image(:,:,:, ith);
    MRIwrite(cur_struct, ['/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/bold_native_nosm/raw_sm',num2str(cur_sm),'_run',num2str(cur_run),'_ima',num2str(ith),'.nii']);
end




