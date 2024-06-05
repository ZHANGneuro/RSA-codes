

clear;
root_path = '/Users/bo/Documents/data_dean_lab/';

number_of_subject = 1;
number_of_run = 4;

% create beta (activity pattern) array
ima_stim1_protec = cell(number_of_subject,number_of_run);
ima_stim1_threat = cell(number_of_subject,number_of_run);
ima_stim1_outcome = cell(number_of_subject,number_of_run);
ima_stim1_shock = cell(number_of_subject,number_of_run);

%% representation extraction
for ind_subject = 1
    for ind_run = 1:number_of_run

        % retrieve label
        labels = matlab_return_label_1st2nd_stim(root_path, ind_subject, ind_run);
        index_target = find(cellfun(@(x,y) strcmp(x, 'threat') & strcmp(y, 'protection'), labels(:,3), labels(:,5)));
        labels = labels(index_target, :);
        [num_row, num_col] = size(labels);

        corr_3d_array = load([root_path, 'sarah_safetyEstimationTask/outputs/searchlight_r_array/sub',num2str(ind_subject),'_6mm_s',num2str(ind_run),'.mat']);
        corr_3d_array = corr_3d_array.corr_3d_array;
        corr_3d_array = corr_3d_array(index_target, index_target, :);

        % retrieve beta image
        beta_images = matlab_retrieve_betaImage_from_fsl(root_path, ind_subject, ind_run);
        beta_images = beta_images(index_target);

        % count the number of trial-based beta images
        count_trialtype =  num_row;

        %
        example_brain = beta_images{1}.vol;
        [d1, d2, d3] = ind2sub( size(example_brain),find(example_brain~=0));
        count_voxel = length(d1);

        beta_1dbrain_protec = nan(count_voxel,1);
        beta_1dbrain_threat = nan(count_voxel,1);
        beta_1dbrain_outcome = nan(count_voxel,1);
        beta_1dbrain_shock = nan(count_voxel,1);


        parfor (each_voxel = 1:count_voxel)
            corr_2d_matrix = corr_3d_array(:,:,each_voxel);

            biary_matrix = zeros((count_trialtype * count_trialtype- count_trialtype)/2 , 5);

            counter = 0;
            for col = 1:count_trialtype
                for row = 1:count_trialtype
                    if(row > col)
                        counter = counter + 1;

                        % stim 1, protection
                        if (strcmp(labels{col, 5}, 'protection')  & strcmp(labels{row, 5}, 'protection') & (labels{col, 6}==labels{row, 6}))
                            biary_matrix(counter, 1) = 1;
                        end
                        % stim 1, threat
                        if (strcmp(labels{col, 3}, 'threat')  & strcmp(labels{row, 3}, 'threat') & (labels{col, 4}==labels{row, 4}))
                            biary_matrix(counter, 2) = 1;
                        end
                        % outcome
                        if (labels{col, 7} == labels{row, 7})
                            biary_matrix(counter, 3) = 1;
                        end
                        % shock
                        if (labels{col, 8} == labels{row, 8})
                            biary_matrix(counter, 4) = 1;
                        end
                        biary_matrix(counter, 5) = corr_2d_matrix(col, row);

                    end
                end
            end

            % % check multicollinearity
            % RHO =corr(biary_matrix(:,1:4));

            % perform GLM
            b = glmfit(biary_matrix(:, 1:4),  biary_matrix(:,5));

            % save beta of each independent variables of current voxel
            beta_1dbrain_protec(each_voxel,1) = b(2);
            beta_1dbrain_threat(each_voxel,1) = b(3);
            beta_1dbrain_outcome(each_voxel,1) = b(4);
            beta_1dbrain_shock(each_voxel,1) = b(5);

            disp([num2str(ind_subject), '-', num2str(ind_run) '-',num2str(each_voxel)]);
        end
        clear corr_3d_array;
        disp('loop finish');
        % save beta of each independent variables of whole brain
        ima_stim1_protec{ind_subject,ind_run} = beta_1dbrain_protec;
        ima_stim1_threat{ind_subject,ind_run} = beta_1dbrain_threat;
        ima_stim1_outcome{ind_subject,ind_run} = beta_1dbrain_outcome;
        ima_stim1_shock{ind_subject,ind_run} = beta_1dbrain_shock;

    end
end






%% transform beta array into brain MNI format and export
% ima_stim1_protec = cell(number_of_subject,number_of_run);
% ima_stim1_threat = cell(number_of_subject,number_of_run);
% ima_stim1_outcome = cell(number_of_subject,number_of_run);
% ima_stim1_shock = cell(number_of_subject,number_of_run);

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
        volume_protec = zeros(size(example_brain));
        volume_threat = zeros(size(example_brain));
        volume_outcome = zeros(size(example_brain));
        volume_shock = zeros(size(example_brain));

        for voxel =  1:count_voxel
            volume_protec(d1(voxel),d2(voxel),d3(voxel)) = ima_stim1_protec{ind_subject,ind_run}(voxel);
            volume_threat(d1(voxel),d2(voxel),d3(voxel)) = ima_stim1_threat{ind_subject,ind_run}(voxel);
            volume_outcome(d1(voxel),d2(voxel),d3(voxel)) = ima_stim1_outcome{ind_subject,ind_run}(voxel);
            volume_shock(d1(voxel),d2(voxel),d3(voxel)) = ima_stim1_shock{ind_subject,ind_run}(voxel);
        end

        beta_images{1,1}.vol = volume_protec;
        MRIwrite(beta_images{1,1},[root_path,  'sarah_safetyEstimationTask/outputs/result_rsa_secondstim_protection_after_threat/protec_sub',num2str(ind_subject), '_run', num2str(ind_run),'.nii']);

        beta_images{1,1}.vol = volume_threat;
        MRIwrite(beta_images{1,1},[root_path,  'sarah_safetyEstimationTask/outputs/result_rsa_secondstim_protection_after_threat/threat_sub',num2str(ind_subject), '_run', num2str(ind_run),'.nii']);

        beta_images{1,1}.vol = volume_outcome;
        MRIwrite(beta_images{1,1},[root_path,  'sarah_safetyEstimationTask/outputs/result_rsa_secondstim_protection_after_threat/outcome_sub',num2str(ind_subject), '_run', num2str(ind_run),'.nii']);

        beta_images{1,1}.vol = volume_shock;
        MRIwrite(beta_images{1,1},[root_path,  'sarah_safetyEstimationTask/outputs/result_rsa_secondstim_protection_after_threat/shock_sub',num2str(ind_subject), '_run', num2str(ind_run),'.nii']);

        disp([num2str(ind_subject),'-',num2str(ind_run)]);
    end
end












