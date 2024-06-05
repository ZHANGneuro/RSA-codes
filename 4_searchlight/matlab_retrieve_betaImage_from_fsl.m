

function beta_images = matlab_retrieve_betaImage_from_fsl(root_path, ind_subject, ind_run)

path_beta = [root_path, 'sarah_safetyEstimationTask/outputs/rsa_1stlevel_sub',num2str(ind_subject),'_run', num2str(ind_run),'.feat/stats/'];
beta_dir = dir(fullfile(path_beta, 'pe*.nii'));
if isempty(beta_dir)
    beta_dir = dir(fullfile(path_beta, 'pe*.nii.gz'));
    beta_list = strcat(path_beta,  {beta_dir.name}');
    for n = 1:length(beta_list(:,1))
        gunzip(beta_list{n});
    end
end
beta_dir = dir(fullfile(path_beta, 'pe*.nii'));
beta_list = strcat(path_beta,  {beta_dir.name}');
temp_rank_ith = zeros(length(beta_list),1);
str1 = [root_path, 'sarah_safetyEstimationTask/outputs/rsa_1stlevel_sub',num2str(ind_subject),'_run', num2str(ind_run),'.feat/stats/pe'];
str2 = '.nii';
for n = 1:length(beta_list)
    temp_name = extractBetween(beta_list{n}, str1, str2);
    temp_rank_ith(n,1) = str2double(temp_name{1});
end
[ranked,sort_index] = sort(temp_rank_ith);
beta_list = beta_list(sort_index);
% beta_list = beta_list(1:81);

beta_images = cell(length(beta_list), 1);
for n = 1:length(beta_list)
    beta_images{n} = MRIread(beta_list{n});
end





