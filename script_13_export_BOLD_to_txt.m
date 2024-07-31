



root_path = '/Users/bo/Documents/data_dean_lab';

mask_struct = MRIread('/Users/bo/Documents/brainmask/mask_wholebrain.nii');
mask_ima= mask_struct.vol;
mask_index = find(mask_ima==1);


%
cur_struct = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/neg_topic_neg_gpt.nii');
cur_ima = cur_struct.vol;
output_table = cur_ima(mask_index);
fid = fopen([  root_path,  ['/data_swati_ket/outputs/BOLD_signal_neg_topic_neg_gpt.txt']],'w');
for ith_trial = 1:length(output_table)
    fprintf(fid,'%f\n',output_table(ith_trial,:));
end
fclose(fid);


%
cur_struct = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/neg_topic_pos_gpt.nii');
cur_ima = cur_struct.vol;
output_table = cur_ima(mask_index);
fid = fopen([  root_path,  ['/data_swati_ket/outputs/BOLD_signal_neg_topic_pos_gpt.txt']],'w');
for ith_trial = 1:length(output_table)
    fprintf(fid,'%f\n',output_table(ith_trial,:));
end
fclose(fid);


%
cur_struct = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/pos_topic_neg_gpt.nii');
cur_ima = cur_struct.vol;
output_table = cur_ima(mask_index);
fid = fopen([  root_path,  ['/data_swati_ket/outputs/BOLD_signal_pos_topic_neg_gpt.txt']],'w');
for ith_trial = 1:length(output_table)
    fprintf(fid,'%f\n',output_table(ith_trial,:));
end
fclose(fid);


%
cur_struct = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/pos_topic_pos_gpt.nii');
cur_ima = cur_struct.vol;
output_table = cur_ima(mask_index);
fid = fopen([  root_path,  ['/data_swati_ket/outputs/BOLD_signal_pos_topic_pos_gpt.txt']],'w');
for ith_trial = 1:length(output_table)
    fprintf(fid,'%f\n',output_table(ith_trial,:));
end
fclose(fid);


%
cur_struct = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/likesReceived.nii');
cur_ima = cur_struct.vol;
output_table = cur_ima(mask_index);
fid = fopen([  root_path,  ['/data_swati_ket/outputs/BOLD_signal_likesReceived.txt']],'w');
for ith_trial = 1:length(output_table)
    fprintf(fid,'%f\n',output_table(ith_trial,:));
end
fclose(fid);



%
cur_struct = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/LikesGiven.nii');
cur_ima = cur_struct.vol;
output_table = cur_ima(mask_index);
fid = fopen([  root_path,  ['/data_swati_ket/outputs/BOLD_signal_LikesGiven.txt']],'w');
for ith_trial = 1:length(output_table)
    fprintf(fid,'%f\n',output_table(ith_trial,:));
end
fclose(fid);


%
cur_struct = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/dislikesReceived.nii');
cur_ima = cur_struct.vol;
output_table = cur_ima(mask_index);
fid = fopen([  root_path,  ['/data_swati_ket/outputs/BOLD_signal_dislikesReceived.txt']],'w');
for ith_trial = 1:length(output_table)
    fprintf(fid,'%f\n',output_table(ith_trial,:));
end
fclose(fid);


%
cur_struct = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/dislikesGiven.nii');
cur_ima = cur_struct.vol;
output_table = cur_ima(mask_index);
fid = fopen([  root_path,  ['/data_swati_ket/outputs/BOLD_signal_dislikesGiven.txt']],'w');
for ith_trial = 1:length(output_table)
    fprintf(fid,'%f\n',output_table(ith_trial,:));
end
fclose(fid);
