

clear;
root_path = '/Users/bo/Documents/data_dean_lab/';

number_of_subject = 1;
number_of_run = 4;

% create beta (activity pattern) array
ima_dwea_sani = cell(number_of_subject,number_of_run);
ima_dwea_dani = cell(number_of_subject,number_of_run);
ima_swea_sani = cell(number_of_subject,number_of_run);
ima_swea_dani = cell(number_of_subject,number_of_run);

%% representation extraction
for ind_subject = 1
    for ind_run = 1:number_of_run

        % retrieve label
        labels = matlab_return_label_4_category(root_path, ind_subject, ind_run);

        % retrieve beta image
        beta_images = matlab_retrieve_betaImage_from_fsl(root_path, ind_subject, ind_run);

        % count the number of trial-based beta images
        count_trialtype =  length(beta_images);

        %
        example_brain = beta_images{1}.vol;
        [d1, d2, d3] = ind2sub( size(example_brain),find(example_brain~=0));
        count_voxel = length(d1);

        beta_dwea_sani = nan(count_voxel,1);
        beta_dwea_dani = nan(count_voxel,1);
        beta_swea_sani = nan(count_voxel,1);
        beta_swea_dani = nan(count_voxel,1);

        corr_3d_array = load([root_path, 'sarah_safetyEstimationTask/outputs/searchlight_r_array/sub',num2str(ind_subject),'_6mm_s',num2str(ind_run),'.mat']);
        corr_3d_array = corr_3d_array.corr_3d_array;

        parfor (each_voxel = 1:count_voxel)
            corr_2d_matrix = corr_3d_array(:,:,each_voxel);

            biary_matrix = zeros((count_trialtype * count_trialtype- count_trialtype)/2 , 7);

            counter = 0;
            for col = 1:count_trialtype
                for row = 1:count_trialtype
                    if(row > col)
                        counter = counter + 1;

                        % dwea_sani
                        if labels{col, 9} == labels{row, 9}
                            biary_matrix(counter, 1) = 1;
                        end
                        % dwea_dani
                        if labels{col, 10} == labels{row, 10}
                            biary_matrix(counter, 2) = 1;
                        end
                        % swea_sani
                        if labels{col, 11} == labels{row, 11}
                            biary_matrix(counter, 3) = 1;
                        end
                        % swea_dani
                        if labels{col, 12} == labels{row, 12}
                            biary_matrix(counter, 4) = 1;
                        end

                        % outcome
                        if strcmp(labels{col, 7}, labels{row, 7})
                            biary_matrix(counter, 5) = 1;
                        end
                        % shock
                        if labels{col, 8} == labels{row, 8}
                            biary_matrix(counter, 6) = 1;
                        end
                        biary_matrix(counter, 7) = corr_2d_matrix(col, row);

                    end
                end
            end

            % % check multicollinearity
            % RHO =corr(biary_matrix(:,1:6));

            % perform GLM
            b = glmfit(biary_matrix(:, 1:6),  biary_matrix(:,7));

            % save beta of each independent variables of current voxel
            beta_dwea_sani(each_voxel,1) = b(2);
            beta_dwea_dani(each_voxel,1) = b(3);
            beta_swea_sani(each_voxel,1) = b(4);
            beta_swea_dani(each_voxel,1) = b(5);

            disp([num2str(ind_subject), '-', num2str(ind_run) '-',num2str(each_voxel)]);
        end
        clear corr_3d_array;
        disp('loop finish');


        % save beta of each independent variables of whole brain
        ima_dwea_sani{ind_subject,ind_run} = beta_dwea_sani;
        ima_dwea_dani{ind_subject,ind_run} = beta_dwea_dani;
        ima_swea_sani{ind_subject,ind_run} = beta_swea_sani;
        ima_swea_dani{ind_subject,ind_run} = beta_swea_dani;

    end
end






%% transform beta array into brain MNI format and export
% ima_dwea_sani = cell(number_of_subject,number_of_run);
% ima_dwea_dani = cell(number_of_subject,number_of_run);
% ima_swea_sani = cell(number_of_subject,number_of_run);
% ima_swea_dani = cell(number_of_subject,number_of_run);

for ind_subject = 1
    for ind_run = 1:number_of_run

        % retrieve beta image
        beta_images = matlab_retrieve_betaImage_from_fsl(root_path, ind_subject, ind_run);

        % % count the number of trial-based beta images
        % count_trialtype =  length(beta_images);

        %
        example_brain = beta_images{1}.vol;
        [d1, d2, d3] = ind2sub( size(example_brain),find(example_brain~=0));
        count_voxel = length(d1);

        %
        volume_dwea_sani = zeros(size(example_brain));
        volume_dwea_dani = zeros(size(example_brain));
        volume_swea_sani = zeros(size(example_brain));
        volume_swea_dani = zeros(size(example_brain));

        for voxel =  1:count_voxel
            volume_dwea_sani(d1(voxel),d2(voxel),d3(voxel)) = ima_dwea_sani{ind_subject,ind_run}(voxel);
            volume_dwea_dani(d1(voxel),d2(voxel),d3(voxel)) = ima_dwea_dani{ind_subject,ind_run}(voxel);
            volume_swea_sani(d1(voxel),d2(voxel),d3(voxel)) = ima_swea_sani{ind_subject,ind_run}(voxel);
            volume_swea_dani(d1(voxel),d2(voxel),d3(voxel)) = ima_swea_dani{ind_subject,ind_run}(voxel);
        end

        beta_images{1,1}.vol = volume_dwea_sani;
        MRIwrite(beta_images{1,1},[root_path,  'sarah_safetyEstimationTask/outputs/result_rsa_category/dwea_sani_sub',num2str(ind_subject), '_run', num2str(ind_run),'.nii']);

        beta_images{1,1}.vol = volume_dwea_dani;
        MRIwrite(beta_images{1,1},[root_path,  'sarah_safetyEstimationTask/outputs/result_rsa_category/dwea_dani_sub',num2str(ind_subject), '_run', num2str(ind_run),'.nii']);

        beta_images{1,1}.vol = volume_swea_sani;
        MRIwrite(beta_images{1,1},[root_path,  'sarah_safetyEstimationTask/outputs/result_rsa_category/swea_sani_sub',num2str(ind_subject), '_run', num2str(ind_run),'.nii']);

        beta_images{1,1}.vol = volume_swea_dani;
        MRIwrite(beta_images{1,1},[root_path,  'sarah_safetyEstimationTask/outputs/result_rsa_category/swea_dani_sub',num2str(ind_subject), '_run', num2str(ind_run),'.nii']);

        disp([num2str(ind_subject),'-',num2str(ind_run)]);
    end
end












