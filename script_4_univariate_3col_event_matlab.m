

root_path = '/Users/bo/Documents/data_dean_lab';

for ith = 0:3

    [NUM,TXT,block] = xlsread([root_path, ['/data_swati_ket/beh_block', num2str(ith),'.xlsx']]);
    block = block(2:end, :);
    
    for ith_col = 1:5
        for ith_row = 1:length(block)
            block{ith_row, ith_col} = num2str(block{ith_row, ith_col});
        end
    end


    % message actor pos
    mess_onset = NUM(cellfun(@(x,y) strcmp(x, 'msgReceived') & strcmp(y, '1'), block(:, 6), block(:, 4)), 8);
    mess_end = NUM(cellfun(@(x,y) strcmp(x, 'msgReceived') & strcmp(y, '1'), block(:, 6), block(:, 4)), 9);
    mess_value = ones(length(mess_onset), 1);
    
    output_table = [mess_onset, mess_end-mess_onset, mess_value];
    fid = fopen([  root_path,  ['/data_swati_ket/outputs/univariate_run',num2str(ith+1),'_actor_pos.txt']],'w');
    for n = 1:length(output_table(:,1))
        fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
    end
    fclose(fid);
    

    % message actor neg
    mess_onset = NUM(cellfun(@(x,y) strcmp(x, 'msgReceived') & strcmp(y, '0'), block(:, 6), block(:, 4)), 8);
    mess_end = NUM(cellfun(@(x,y) strcmp(x, 'msgReceived') & strcmp(y, '0'), block(:, 6), block(:, 4)), 9);
    mess_value = ones(length(mess_onset), 1);
    
    output_table = [mess_onset, mess_end-mess_onset, mess_value];
    fid = fopen([  root_path,  ['/data_swati_ket/outputs/univariate_run',num2str(ith+1),'_actor_neg.txt']],'w');
    for n = 1:length(output_table(:,1))
        fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
    end
    fclose(fid);
    

    % likesReceivedTotal
    likesReceivedTotal_onset = NUM(cellfun(@(x) strcmp(x, 'likesReceivedTotal'), block(:, 6)), 8);
    likesReceivedTotal_end = NUM(cellfun(@(x) strcmp(x, 'likesReceivedTotal'), block(:, 6)), 9);
    likesReceivedTotal_value = NUM(cellfun(@(x) strcmp(x, 'likesReceivedTotal'), block(:, 6)), 7);
    output_table = [likesReceivedTotal_onset, likesReceivedTotal_end-likesReceivedTotal_onset, likesReceivedTotal_value];
    fid = fopen([  root_path,  ['/data_swati_ket/outputs/univariate_run',num2str(ith+1),'_likesReceived.txt']],'w');
    for n = 1:length(output_table(:,1))
        fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
    end
    
    % dislikesReceived
    dislikesReceived_onset = NUM(cellfun(@(x) strcmp(x, 'dislikesReceived'), block(:, 6)), 8);
    dislikesReceived_end = NUM(cellfun(@(x) strcmp(x, 'dislikesReceived'), block(:, 6)), 9);
    dislikesReceived_value = NUM(cellfun(@(x) strcmp(x, 'dislikesReceived'), block(:, 6)), 7);
    output_table = [dislikesReceived_onset, dislikesReceived_end-dislikesReceived_onset, dislikesReceived_value];
    fid = fopen([  root_path,  ['/data_swati_ket/outputs/univariate_run',num2str(ith+1),'_dislikesReceived.txt']],'w');
    for n = 1:length(output_table(:,1))
        fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
    end
    
    
    % LikesGiven
    LikesGiven_onset = NUM(cellfun(@(x) strcmp(x, 'totalLikesGiven'), block(:, 6)), 8);
    LikesGiven_end = NUM(cellfun(@(x) strcmp(x, 'totalLikesGiven'), block(:, 6)), 9);
    LikesGiven_value = NUM(cellfun(@(x) strcmp(x, 'totalLikesGiven'), block(:, 6)), 7);
    output_table = [LikesGiven_onset, LikesGiven_end-LikesGiven_onset, LikesGiven_value];
    fid = fopen([  root_path,  ['/data_swati_ket/outputs/univariate_run',num2str(ith+1),'_LikesGiven.txt']],'w');
    for n = 1:length(output_table(:,1))
        fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
    end
    
    
    % totalDislikesGiven
    DislikesGiven_onset = NUM(cellfun(@(x) strcmp(x, 'totalDislikesGiven'), block(:, 6)), 8);
    DislikesGiven_end = NUM(cellfun(@(x) strcmp(x, 'totalDislikesGiven'), block(:, 6)), 9);
    DislikesGiven_value = NUM(cellfun(@(x) strcmp(x, 'totalDislikesGiven'), block(:, 6)), 7);
    output_table = [DislikesGiven_onset, DislikesGiven_end-DislikesGiven_onset, DislikesGiven_value];
    fid = fopen([  root_path,  ['/data_swati_ket/outputs/univariate_run',num2str(ith+1),'_DislikesGiven.txt']],'w');
    for n = 1:length(output_table(:,1))
        fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
    end
    
    
    % rewardPunish
    rewardPunish_onset = NUM(cellfun(@(x) strcmp(x, 'rewardPunish'), block(:, 6)), 8);
    rewardPunish_end = NUM(cellfun(@(x) strcmp(x, 'rewardPunish'), block(:, 6)), 9);
    rewardPunish_value = NUM(cellfun(@(x) strcmp(x, 'rewardPunish'), block(:, 6)), 7);
    output_table = [rewardPunish_onset, rewardPunish_end-rewardPunish_onset, rewardPunish_value];
    fid = fopen([  root_path,  ['/data_swati_ket/outputs/univariate_run',num2str(ith+1),'_rewardPunish.txt']],'w');
    for n = 1:length(output_table(:,1))
        fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
    end
    
    
    % likabilityRev
    likabilityRev_onset = NUM(cellfun(@(x) strcmp(x, 'likabilityRev'), block(:, 6)), 8);
    likabilityRev_end = NUM(cellfun(@(x) strcmp(x, 'likabilityRev'), block(:, 6)), 9);
    likabilityRev_value = NUM(cellfun(@(x) strcmp(x, 'likabilityRev'), block(:, 6)), 7);
    output_table = [likabilityRev_onset, likabilityRev_end-likabilityRev_onset, likabilityRev_value];
    fid = fopen([  root_path,  ['/data_swati_ket/outputs/univariate_run',num2str(ith+1),'_likabilityRev.txt']],'w');
    for n = 1:length(output_table(:,1))
        fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
    end
    
    
    % likability
    likability_onset = NUM(cellfun(@(x) strcmp(x, 'likability'), block(:, 6)), 8);
    likability_end = NUM(cellfun(@(x) strcmp(x, 'likability'), block(:, 6)), 9);
    likability_value = NUM(cellfun(@(x) strcmp(x, 'likability'), block(:, 6)), 7);
    output_table = [likability_onset, likability_end-likability_onset, likability_value];
    fid = fopen([  root_path,  ['/data_swati_ket/outputs/univariate_run',num2str(ith+1),'_likability.txt']],'w');
    for n = 1:length(output_table(:,1))
        fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
    end
    
    
    % feelings
    feelings_onset = NUM(cellfun(@(x) strcmp(x, 'feelings'), block(:, 6)), 8);
    feelings_end = NUM(cellfun(@(x) strcmp(x, 'feelings'), block(:, 6)), 9);
    feelings_value = ones(length(feelings_onset), 1);
    output_table = [feelings_onset, feelings_end-feelings_onset, feelings_value];
    fid = fopen([  root_path,  ['/data_swati_ket/outputs/univariate_run',num2str(ith+1),'_feelings.txt']],'w');
    for n = 1:length(output_table(:,1))
        fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
    end
    
    
    % fixate
    fixate_onset = NUM(cellfun(@(x) strcmp(x, 'fixate'), block(:, 6)), 8);
    fixate_end = NUM(cellfun(@(x) strcmp(x, 'fixate'), block(:, 6)), 9);
    fixate_value = ones(length(fixate_onset), 1);
    output_table = [fixate_onset, fixate_end-fixate_onset, fixate_value];
    fid = fopen([  root_path,  ['/data_swati_ket/outputs/univariate_run',num2str(ith+1),'_fixate.txt']],'w');
    for n = 1:length(output_table(:,1))
        fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
    end
    
    % prompt
    prompt_onset = NUM(cellfun(@(x) strcmp(x, 'prompt'), block(:, 6)), 8);
    prompt_end = NUM(cellfun(@(x) strcmp(x, 'prompt'), block(:, 6)), 9);
    prompt_value = ones(length(prompt_onset), 1);
    output_table = [prompt_onset, prompt_end-prompt_onset, prompt_value];
    fid = fopen([  root_path,  ['/data_swati_ket/outputs/univariate_run',num2str(ith+1),'_prompt.txt']],'w');
    for n = 1:length(output_table(:,1))
        fprintf(fid,'%f\t  %f\t  %d\n',output_table(n,:));
    end





end










