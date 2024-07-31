


folder_of_dicoms = '/Users/bo/Desktop/unknown/Useable/fMRI/func-bold_task-socmedia_run-1/1.3.12.2.1107.5.2.43.167050.2024072316345395472559750.0.0.0.dicom';
folder_of_output = '/Users/bo/Desktop/unknown/Useable/fMRI/func-bold_task-socmedia_run-1/';
dicm2nii(folder_of_dicoms, folder_of_output, '.nii')


template = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/code_ThirdParty_tools/MNI152_T1_2mm_brain.nii.gz');

temp = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/test_t1.nii');

mean_ima = mean(temp.vol, 4);

template.vol = mean_ima;
MRIwrite(template, '/Users/bo/Desktop/test_t1.nii')






temp = MRIread('/Users/bo/Documents/data_dean_lab/data_swati/rsa_code/ThirdParty_tools/MNI152_T1_2mm_brain.nii.gz');

aaa = MRIread('/Users/bo/Documents/data_dean_lab/data_swati/t1_sub1.nii');
aa = aaa.vol(:,:,:,1);

index = find(aa<10);
aa(index) = 0;

index = find(aa>10);

aa(index) = aa(index)*5;

temp.vol = aa;
MRIwrite(temp, '/Users/bo/Desktop/test.nii')