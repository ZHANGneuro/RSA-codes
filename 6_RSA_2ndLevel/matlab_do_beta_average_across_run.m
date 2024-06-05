



root_path = '/Users/bo/Documents/data_dean_lab/';
% info_list = {'outcome', 'protec', 'shock', 'threat'};
info_list = {'dwea_sani', 'dwea_dani', 'swea_sani', 'swea_dani'};
brain_mask = MRIread('/Users/bo/Documents/brainmask/fsl_standard/MNI152_T1_2mm_brain_mask.nii.gz');
brain_mask = brain_mask.vol;

for ith_info = 1:4
    cur_keyword = info_list{ith_info};
    for ind_sub = 1
        s1_struct = MRIread([root_path, 'sarah_safetyEstimationTask/outputs/result_rsa_category/standard_',cur_keyword,'_sub',num2str(ind_sub),'_run1.nii.gz']);
        s2_struct = MRIread([root_path, 'sarah_safetyEstimationTask/outputs/result_rsa_category/standard_',cur_keyword,'_sub',num2str(ind_sub),'_run2.nii.gz']);
        s3_struct = MRIread([root_path, 'sarah_safetyEstimationTask/outputs/result_rsa_category/standard_',cur_keyword,'_sub',num2str(ind_sub),'_run3.nii.gz']);
        s4_struct = MRIread([root_path, 'sarah_safetyEstimationTask/outputs/result_rsa_category/standard_',cur_keyword,'_sub',num2str(ind_sub),'_run4.nii.gz']);
        s1_ima = s1_struct.vol;
        s2_ima = s2_struct.vol;
        s3_ima = s3_struct.vol;
        s4_ima = s4_struct.vol;
        ave_r_brain = (s1_ima + s2_ima + s3_ima + s4_ima)/4;
        ave_r_brain_z = (ave_r_brain-mean(ave_r_brain(:)))/std(ave_r_brain(:));

        empty_brain = brain_mask;
        empty_brain(:) = 0;

        mask_index = find(brain_mask==1);
        empty_brain(mask_index) = ave_r_brain_z(mask_index);

        temp_struc = s1_struct;
        temp_struc.vol = empty_brain;
        MRIwrite(temp_struc,[root_path, 'sarah_safetyEstimationTask/outputs/result_rsa_category/mean_z_',cur_keyword,'.nii']);
    end
end









