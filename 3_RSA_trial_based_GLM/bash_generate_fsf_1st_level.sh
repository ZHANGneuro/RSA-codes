#!/bin/bash

# s1_num_volume and s1_num_voxel include number of volume and voxels for each session and subjects
# s1_num_volume[2] represents subject2



for sub in {1..1}; do

  declare -a s1
  s1_num_volume[$sub]=1279
  s1_num_voxel[$sub]=848683008
  declare -a s2
  s2_num_volume[$sub]=1452
  s2_num_voxel[$sub]=963477504
  declare -a s3
  s3_num_volume[$sub]=1382
  s3_num_voxel[$sub]=917028864
  declare -a s4
  s4_num_volume[$sub]=1337
  s4_num_voxel[$sub]=887169024

  for run in {1..4}; do
    if [ $run -eq 1 ];then
      NUM_VOLUME=${s1_num_volume[$sub]}
      NUM_VOXEL=${s1_num_voxel[$sub]}
      NUM_EV=92
    fi
    if [ $run -eq 2 ];then
      NUM_VOLUME=${s2_num_volume[$sub]}
      NUM_VOXEL=${s2_num_voxel[$sub]}
      NUM_EV=112
    fi
    if [ $run -eq 3 ];then
      NUM_VOLUME=${s3_num_volume[$sub]}
      NUM_VOXEL=${s3_num_voxel[$sub]}
      NUM_EV=112
    fi
    if [ $run -eq 4 ];then
      NUM_VOLUME=${s4_num_volume[$sub]}
      NUM_VOXEL=${s4_num_voxel[$sub]}
      NUM_EV=112
    fi

    root_path=/Users/bo/Documents/data_dean_lab
    TEMPLATE_PATH=$root_path"/sarah_safetyEstimationTask/code_rsa/3_RSA_trial_based_GLM/feat_template_1st_level.fsf"
    OUTPUTDIR=$root_path"/sarah_safetyEstimationTask/outputs/rsa_1stlevel_sub"$sub"_run"$run
    BOLD_IMAGE=$root_path"/sarah_safetyEstimationTask/outputs/preprocessing_sub"$sub"_run"$run".feat/filtered_func_data.nii.gz"
    Standard_brain_dir=$root_path"/sarah_safetyEstimationTask/code_rsa/ThirdParty_tools/MNI152_T1_2mm_brain.nii.gz"
    

    GLM_setup=""
    for IV in $( seq 1 $NUM_EV ); do
      GLM_setup+='set fmri(evtitle'$IV') ""\nset fmri(shape'$IV') 3\nset fmri(convolve'$IV') 3\nset fmri(convolve_phase'$IV') 0\nset fmri(tempfilt_yn'$IV') 1\nset\ fmri(deriv_yn'$IV') 0\nset fmri(custom'$IV') '$root_path'/sarah_safetyEstimationTask/outputs/txt_3_cols/sub'$sub'_run'$run'_trial'$IV'.txt\n'
      for ind_ortho in $( seq 0 $NUM_EV ); do
          GLM_setup+='set fmri(ortho'$IV'.'$ind_ortho') 0\n'
      done
      GLM_setup+='\n'
    done

    required_format_for_contrast_mode1=""
    for cur_ind in $( seq 2 $NUM_EV ); do
        required_format_for_contrast_mode1+='set fmri(con_real1.'$cur_ind') 0\n'
    done
    required_format_for_contrast_mode2=""
    for cur_ind in $( seq 2 $NUM_EV ); do
        required_format_for_contrast_mode2+='set fmri(con_orig1.'$cur_ind') 0\n'
    done

    sed -e 's@OUTPUTDIR@'$OUTPUTDIR'@g' \
        -e 's@BOLD_IMAGE@'$BOLD_IMAGE'@g' \
        -e 's@GLM_setup@'"$GLM_setup"'@g' \
        -e 's@NUM_EV@'"$NUM_EV"'@g' \
        -e 's@required_format_for_contrast_mode1@'"$required_format_for_contrast_mode1"'@g' \
        -e 's@required_format_for_contrast_mode2@'"$required_format_for_contrast_mode2"'@g' \
        -e 's@Standard_brain_dir@'$Standard_brain_dir'@g' \
        -e 's@NUM_VOLUME@'$NUM_VOLUME'@g' \
        -e 's@NUM_VOXEL@'$NUM_VOXEL'@g' <$TEMPLATE_PATH> $root_path/sarah_safetyEstimationTask/outputs/fsf_files_glm_1st_level/fsf_sub$sub"_s"$run".fsf"

  done
done
