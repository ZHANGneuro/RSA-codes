

root_path = '/Users/bo/Documents/data_dean_lab';

% extract values from csv file
[num_table1,TXT,txt_table1] = xlsread([root_path, '/data_swati_ket/beh_block0.xlsx']);
[num_table2,TXT,txt_table2] = xlsread([root_path, '/data_swati_ket/beh_block1.xlsx']);
[num_table3,TXT,txt_table3] = xlsread([root_path, '/data_swati_ket/beh_block2.xlsx']);
[num_table4,TXT,txt_table4] = xlsread([root_path, '/data_swati_ket/beh_block3.xlsx']);

txt_table1 = txt_table1(2:end, :);
txt_table2 = txt_table2(2:end, :);
txt_table3 = txt_table3(2:end, :);
txt_table4 = txt_table4(2:end, :);

num_table = [num_table1; num_table2; num_table3; num_table4];
txt_table = [txt_table1; txt_table2; txt_table3; txt_table4];

for ith_col = 1:5
    for ith_row = 1:length(txt_table)
        txt_table{ith_row, ith_col} = num2str(txt_table{ith_row, ith_col});
    end
end

%
prompt_onset = num_table(cellfun(@(x) strcmp(x, 'msgReceived'), txt_table(:, 6)), 8);
prompt_end = num_table(cellfun(@(x) strcmp(x, 'msgReceived'), txt_table(:, 6)), 9);
prompt_value = ones(length(prompt_onset), 1);
output_table = [prompt_onset, prompt_end-prompt_onset, prompt_value];
for ith_trial = 1:length(prompt_onset)
    fid = fopen([  root_path,  ['/data_swati_ket/outputs/col3_rsa_run_',num2str(ith_run+1),'_mess_',num2str(ith_trial),'.txt']],'w');
    fprintf(fid,'%f\t  %f\t  %d\n',output_table(ith_trial,:));
end

%
prompt_onset = num_table(cellfun(@(x) strcmp(x, 'prompt'), txt_table(:, 6)), 8);
prompt_end = num_table(cellfun(@(x) strcmp(x, 'prompt'), txt_table(:, 6)), 9);
prompt_value = ones(length(prompt_onset), 1);
output_table = [prompt_onset, prompt_end-prompt_onset, prompt_value];
fid = fopen([  root_path,  ['/data_swati_ket/outputs/col3_rsa_run_',num2str(ith_run+1),'_prompt.txt']],'w');
for ith_trial = 1:length(prompt_onset)
    fprintf(fid,'%f\t  %f\t  %d\n',output_table(ith_trial,:));
end



% likesReceivedTotal
likesReceivedTotal_onset = num_table(cellfun(@(x) strcmp(x, 'likesReceivedTotal'), txt_table(:, 6)), 8);
likesReceivedTotal_end = num_table(cellfun(@(x) strcmp(x, 'likesReceivedTotal'), txt_table(:, 6)), 9);
likesReceivedTotal_value = num_table(cellfun(@(x) strcmp(x, 'likesReceivedTotal'), txt_table(:, 6)), 7);
output_table = [likesReceivedTotal_onset, likesReceivedTotal_end-likesReceivedTotal_onset, likesReceivedTotal_value];
fid = fopen([  root_path,  ['/data_swati_ket/outputs/col3_rsa_run_',num2str(ith_run+1),'_likesReceived.txt']],'w');
for n = 1:length(output_table(:,1))
    fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
end

% dislikesReceived
dislikesReceived_onset = num_table(cellfun(@(x) strcmp(x, 'dislikesReceived'), txt_table(:, 6)), 8);
dislikesReceived_end = num_table(cellfun(@(x) strcmp(x, 'dislikesReceived'), txt_table(:, 6)), 9);
dislikesReceived_value = num_table(cellfun(@(x) strcmp(x, 'dislikesReceived'), txt_table(:, 6)), 7);
output_table = [dislikesReceived_onset, dislikesReceived_end-dislikesReceived_onset, dislikesReceived_value];
fid = fopen([  root_path,  ['/data_swati_ket/outputs/col3_rsa_run_',num2str(ith_run+1),'_dislikesReceived.txt']],'w');
for n = 1:length(output_table(:,1))
    fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
end


% LikesGiven
LikesGiven_onset = num_table(cellfun(@(x) strcmp(x, 'totalLikesGiven'), txt_table(:, 6)), 8);
LikesGiven_end = num_table(cellfun(@(x) strcmp(x, 'totalLikesGiven'), txt_table(:, 6)), 9);
LikesGiven_value = num_table(cellfun(@(x) strcmp(x, 'totalLikesGiven'), txt_table(:, 6)), 7);
output_table = [LikesGiven_onset, LikesGiven_end-LikesGiven_onset, LikesGiven_value];
fid = fopen([  root_path,  ['/data_swati_ket/outputs/col3_rsa_run_',num2str(ith_run+1),'_LikesGiven.txt']],'w');
for n = 1:length(output_table(:,1))
    fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
end


% DislikesGiven
DislikesGiven_onset = num_table(cellfun(@(x) strcmp(x, 'totalDislikesGiven'), txt_table(:, 6)), 8);
DislikesGiven_end = num_table(cellfun(@(x) strcmp(x, 'totalDislikesGiven'), txt_table(:, 6)), 9);
DislikesGiven_value = num_table(cellfun(@(x) strcmp(x, 'totalDislikesGiven'), txt_table(:, 6)), 7);
output_table = [DislikesGiven_onset, DislikesGiven_end-DislikesGiven_onset, DislikesGiven_value];
fid = fopen([  root_path,  ['/data_swati_ket/outputs/col3_rsa_run_',num2str(ith_run+1),'_DislikesGiven.txt']],'w');
for n = 1:length(output_table(:,1))
    fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
end


% rewardPunish
rewardPunish_onset = num_table(cellfun(@(x) strcmp(x, 'rewardPunish'), txt_table(:, 6)), 8);
rewardPunish_end = num_table(cellfun(@(x) strcmp(x, 'rewardPunish'), txt_table(:, 6)), 9);
rewardPunish_value = num_table(cellfun(@(x) strcmp(x, 'rewardPunish'), txt_table(:, 6)), 7);
output_table = [rewardPunish_onset, rewardPunish_end-rewardPunish_onset, rewardPunish_value];
fid = fopen([  root_path,  ['/data_swati_ket/outputs/col3_rsa_run_',num2str(ith_run+1),'_rewardPunish.txt']],'w');
for n = 1:length(output_table(:,1))
    fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
end


% likability
likability_onset = num_table(cellfun(@(x) strcmp(x, 'likability'), txt_table(:, 6)), 8);
likability_end = num_table(cellfun(@(x) strcmp(x, 'likability'), txt_table(:, 6)), 9);
likability_value = num_table(cellfun(@(x) strcmp(x, 'likability'), txt_table(:, 6)), 7);
output_table = [likability_onset, likability_end-likability_onset, likability_value];
fid = fopen([  root_path,  ['/data_swati_ket/outputs/col3_rsa_run_',num2str(ith_run+1),'_likability.txt']],'w');
for n = 1:length(output_table(:,1))
    fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
end


% likabilityRev
likabilityRev_onset = num_table(cellfun(@(x) strcmp(x, 'likabilityRev'), txt_table(:, 6)), 8);
likabilityRev_end = num_table(cellfun(@(x) strcmp(x, 'likabilityRev'), txt_table(:, 6)), 9);
likabilityRev_value = num_table(cellfun(@(x) strcmp(x, 'likabilityRev'), txt_table(:, 6)), 7);
output_table = [likabilityRev_onset, likabilityRev_end-likabilityRev_onset, likabilityRev_value];
fid = fopen([  root_path,  ['/data_swati_ket/outputs/col3_rsa_run_',num2str(ith_run+1),'_likabilityRev.txt']],'w');
for n = 1:length(output_table(:,1))
    fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
end


% feelings
feelings_onset = num_table(cellfun(@(x) strcmp(x, 'feelings'), txt_table(:, 6)), 8);
feelings_end = num_table(cellfun(@(x) strcmp(x, 'feelings'), txt_table(:, 6)), 9);
feelings_value = ones(length(feelings_onset), 1);
output_table = [feelings_onset, feelings_end-feelings_onset, feelings_value];
fid = fopen([  root_path,  ['/data_swati_ket/outputs/col3_rsa_run_',num2str(ith_run+1),'_feelings.txt']],'w');
for n = 1:length(output_table(:,1))
    fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
end

% fixate
fixate_onset = num_table(cellfun(@(x) strcmp(x, 'fixate'), txt_table(:, 6)), 8);
fixate_end = num_table(cellfun(@(x) strcmp(x, 'fixate'), txt_table(:, 6)), 9);
fixate_value = ones(length(fixate_onset), 1);
output_table = [fixate_onset, fixate_end-fixate_onset, fixate_value];
fid = fopen([  root_path,  ['/data_swati_ket/outputs/col3_rsa_run_',num2str(ith_run+1),'_fixate.txt']],'w');
for n = 1:length(output_table(:,1))
    fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
end


