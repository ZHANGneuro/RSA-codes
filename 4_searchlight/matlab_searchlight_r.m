

% step1 
% save to 3d matrix,  2d correlation matrix, 3d means voxel.

clear;
root_path = '/Users/bo/Documents/data_dean_lab/';
output_path = '/Users/bo/Documents/data_dean_lab/sarah_safetyEstimationTask/outputs/searchlight_r_array/';

% independent analysis for each run and subject
for ind_subject = 1
    for ind_run = 4

        % retrieve beta image
        beta_images = matlab_retrieve_betaImage_from_fsl(root_path, ind_subject, ind_run);

        % count the number of trial-based beta images
        count_trialtype =  length(beta_images);

        % define spheric coordinate, 2 denotes 2mm, 6 denotes radius in mm 
        spherec_coordinate = sphericalRelativeRoi(6,[2 2 2]);

        % retrieve brain coordinates in MNI format
        example_brain = beta_images{1}.vol;
        [fir_di, sec_di, thi_di] = size(example_brain);
        [d1, d2, d3] = ind2sub([fir_di, sec_di, thi_di],find(example_brain~=0));
        voxel_array = [d1, d2, d3];
 
        % make a 3d correlation array (2d correlation array + voxels of brain)
        % for each voxel, do pair-wise correlation across 81 trial type
        count_voxel = length(voxel_array);
        corr_3d_array = nan(count_trialtype, count_trialtype, count_voxel);
        parfor (voxel_index = 1:count_voxel)
            spherec = repmat(voxel_array(voxel_index,:), size(spherec_coordinate,1), 1) + spherec_coordinate;
            % exclude coordinate outside of brain
            [row_ind, col_ind] = find(spherec(:,1) < 1 | spherec(:,2) < 1 | spherec(:,3) < 1 | spherec(:,1)>fir_di | spherec(:,2)>sec_di | spherec(:,3)>thi_di);
            spherec (row_ind, :) = [];
            
            % make beta_value by trial_type array
            eachspherec_by_trial = nan(length(spherec(:,1)), count_trialtype);
            for trialtype_ind = 1:count_trialtype
                ima = beta_images{trialtype_ind}.vol;
                for voxel_ind = 1:length(spherec(:,1))
                    eachspherec_by_trial(voxel_ind, trialtype_ind) = ima(spherec(voxel_ind,1), spherec(voxel_ind,2), spherec(voxel_ind,3));
                end
            end
            eachspherec_by_trial(find(isnan(eachspherec_by_trial(:,1)) | eachspherec_by_trial(:,1)==0),:)=[]; % remove nan
            % remove if number of voxel in sphere less than 10
            if(isempty(eachspherec_by_trial) | length(eachspherec_by_trial(:,1))<10)
                corr_3d_array(:,:,voxel_index) = nan(count_trialtype, count_trialtype);
            % otherwise perforam pair-wise correlation across 81 trial types
            else
                [rho,pval] = corr(eachspherec_by_trial, 'Type','Pearson');
                t_rho = 0.5 * (log((1+rho)./(1-rho)));
                corr_3d_array(:,:,voxel_index) = t_rho;
            end
            % show progress
            disp( ['corr_matrix -- sub-',num2str(ind_subject), '-voxel-',num2str(voxel_index)]);
        end
        save([output_path, 'sub' , num2str(ind_subject), '_6mm_s', num2str(ind_run),'.mat'], 'corr_3d_array', '-v7.3');
        clear beta_images;
        clear example_brain;
        clear corr_3d_array;
    end
end








