

clear;
root_path = '/Users/bo/Documents/data_dean_lab/';

%% representation extraction
for ind_subject = 3

    % retrieve beta image
    beta_images = script_8_retrieve_betaImage_matlab(root_path, ind_subject);

    % count the number of trial-based beta images
    count_trialtype =  length(beta_images);

    %
    example_brain = beta_images{1}.vol;
    [d1, d2, d3] = ind2sub( size(example_brain),find(example_brain~=0));
    count_voxel = length(d1);

    beta_1d_tp = nan(count_voxel,1);
    beta_1d_tn = nan(count_voxel,1);
    beta_1d_pp = nan(count_voxel,1);
    beta_1d_pn = nan(count_voxel,1);

    %
    labels = script_10_return_label_matlab(root_path);

    parfor (each_voxel = 1:count_voxel)

        corr_2d_matrix = load([root_path, 'data_swati_ket/outputs/searchlight_r_array/sub',num2str(ind_subject),'_6mm_tr',num2str(each_voxel),'.mat']);
        corr_2d_matrix = corr_2d_matrix.variable_name;

        biary_matrix = zeros((count_trialtype * count_trialtype- count_trialtype)/2 , 5);

        counter = 0;
        for col = 1:count_trialtype
            for row = 1:count_trialtype
                if(row > col)
                    counter = counter + 1;
                    % topic positive
                    if labels{col, 1}==1 & labels{row, 1}==1
                        biary_matrix(counter, 1) = 1;
                    end
                    % topic negative
                    if labels{col, 1}==0 & labels{row, 1}==0
                        biary_matrix(counter, 2) = 1;
                    end
                    % partner positive
                    if labels{col, 2}==1 & labels{row, 2}==1
                        biary_matrix(counter, 3) = 1;
                    end
                    % partner negative
                    if labels{col, 2}==0 & labels{row, 2}==0
                        biary_matrix(counter, 4) = 1;
                    end

                    biary_matrix(counter, 5) = corr_2d_matrix(col, row);
                end
            end
        end

        % % check multicollinearity
        %   RHO =corr(biary_matrix(:,1:4));

        % perform GLM
        b = glmfit(biary_matrix(:, 1:4),  biary_matrix(:,5));

        % save beta of each independent variables of current voxel
        beta_1d_tp(each_voxel,1) = b(2);
        beta_1d_tn(each_voxel,1) = b(3);
        beta_1d_pp(each_voxel,1) = b(4);
        beta_1d_pn(each_voxel,1) = b(5);

        disp([num2str(each_voxel)]);
    end
    disp('loop finish');

    volume_3d_tp = zeros(size(example_brain));
    volume_3d_tn = zeros(size(example_brain));
    volume_3d_pp = zeros(size(example_brain));
    volume_3d_pn = zeros(size(example_brain));
    for voxel =  1:count_voxel
        volume_3d_tp(d1(voxel),d2(voxel),d3(voxel)) = beta_1d_tp(voxel);
        volume_3d_tn(d1(voxel),d2(voxel),d3(voxel)) = beta_1d_tn(voxel);
        volume_3d_pp(d1(voxel),d2(voxel),d3(voxel)) = beta_1d_pp(voxel);
        volume_3d_pn(d1(voxel),d2(voxel),d3(voxel)) = beta_1d_pn(voxel);
    end

    beta_images{1,1}.vol = volume_3d_tp;
    MRIwrite(beta_images{1,1},[root_path,  'data_swati_ket/outputs/result_rsa/rsa_tp.nii']);

    beta_images{1,1}.vol = volume_3d_tn;
    MRIwrite(beta_images{1,1},[root_path,  'data_swati_ket/outputs/result_rsa/rsa_tn.nii']);

    beta_images{1,1}.vol = volume_3d_pp;
    MRIwrite(beta_images{1,1},[root_path,  'data_swati_ket/outputs/result_rsa/rsa_pp.nii']);

    beta_images{1,1}.vol = volume_3d_pn;
    MRIwrite(beta_images{1,1},[root_path,  'data_swati_ket/outputs/result_rsa/rsa_pn.nii']);

end















