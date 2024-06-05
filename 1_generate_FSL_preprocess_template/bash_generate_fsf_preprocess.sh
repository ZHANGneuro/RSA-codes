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
  */8233333333330.
  .
  
  declare -a s4
  s4_num_volume[$sub]=1337
  s4_num_voxel[$sub]=887169024

  for run in {1..4}; do
    if [ $run -eq 1 ];then
      NUM_VOLUME=${s1_num_volume[$sub]}
      NUM_VOXEL=${s1_num_voxel[$sub]}
    fi
    if [ $run -eq 2 ];then
      NUM_VOLUME=${s2_num_volume[$sub]}
      NUM_VOXEL=${s2_num_voxel[$sub]}
    fi
    if [ $run -eq 3 ];then
      NUM_VOLUME=${s3_num_volume[$sub]}
      NUM_VOXEL=${s3_num_voxel[$sub]}
    fi
    if [ $run -eq 4 ];then
      NUM_VOLUME=${s4_num_volume[$sub]}s
      NUM_VOXEL=${s4_num_voxel[$sub]}
    fi

    root_path=/Users/bo/Documents/data_dean_lab
    TEMPLATE_PATH=$root_path"/sarah_safetyEstimationTask/code_rsa/2_generate_FSL_preprocess_template/feat_template_preprocessing.fsf"
    OUTPUTDIR=$root_path"/sarah_safetyEstimationTask/outputs/preprocessing_sub"$sub"_run"$run
    T1_IMAGE=$root_path"/sarah_safetyEstimationTask/sub-00"$sub"/sub-00"$sub"_T1w_brain.nii.gz"
    BOLD_IMAGE=$root_path"/sarah_safetyEstimationTask/sub-00"$sub"/sub-00"$sub"_run-0"$run"_bold.nii.gz"
    Slice_Timing_file=$root_path"/sarah_safetyEstimationTask/outputs/slice_timing.txt"
    Standard_brain_dir=$root_path"/sarah_safetyEstimationTask/code_rsa/ThirdParty_tools/MNI152_T1_2mm_brain.nii.gz"

    sed -e 's@OUTPUTDIR@'$OUTPUTDIR'@g' \
        -e 's@T1_IMAGE@'$T1_IMAGE'@g' \
        -e 's@BOLD_IMAGE@'$BOLD_IMAGE'@g' \
        -e 's@Slice_Timing_file@'$Slice_Timing_file'@g' \
        -e 's@Standard_brain_dir@'$Standard_brain_dir'@g' \
        -e 's@NUM_VOLUME@'$NUM_VOLUME'@g' \
        -e 's@NUM_VOXEL@'$NUM_VOXEL'@g' <$TEMPLATE_PATH> $root_path/sarah_safetyEstimationTask/outputs/fsf_files_preprocessing/fsf_sub$sub"_s"$run".fsf"

  done
done
