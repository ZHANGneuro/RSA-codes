


%
target_folder_path = '/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/bold_standard_nosm/';
brain_dir = dir(fullfile(target_folder_path, ['standard_*']));
brain_dir = strcat(target_folder_path,   {brain_dir.name}');
num_ima = length(brain_dir);
brain_4d = zeros(109, 91, 91, num_ima);
counter=1;
for ith_run = 1:4
    brain_dir = dir(fullfile(target_folder_path, ['standard_sm0_run',num2str(ith_run),'_ima*']));
    brain_dir = strcat(target_folder_path,   {brain_dir.name}');
    %sort
    temp_rank_ith = zeros(length(brain_dir),1);
    for n = 1:length(brain_dir)
        temp_name = extractBetween(brain_dir{n}, '_ima', '.nii');
        temp_rank_ith(n,1) = str2double(temp_name{1});
    end
    [ranked,sort_index] = sort(temp_rank_ith);
    brain_dir = brain_dir(sort_index);

    for ith_tr = 1:length(brain_dir)
        cur_struct = MRIread(brain_dir{ith_tr});
        cur_ima = cur_struct.vol;
        brain_4d(:,:,:, counter) = cur_ima;
        counter = counter + 1;
        counter
    end
end

cur_struct.vol = brain_4d;
cur_struct.tr=2.0;
MRIwrite(cur_struct, '/Users/bo/Documents/data_dean_lab/data_swati_ket/image_standard_bold_nosm.nii');







