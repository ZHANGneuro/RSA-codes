#!/bin/bash

# s1_num_volume and s1_num_voxel include number of volume and voxels for each session and subjects
# s1_num_volume[2] represents subject2


for sub in {3..3}; do

  declare -a s1
  s1_num_volume[$sub]=840
  s1_num_voxel[$sub]=311808000

  declare -a s2
  s2_num_volume[$sub]=781
  s2_num_voxel[$sub]=289907200

  declare -a s3
  s3_num_volume[$sub]=803
  s3_num_voxel[$sub]=298073600

  declare -a s4
  s4_num_volume[$sub]=629
  s4_num_voxel[$sub]=233484800


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
      NUM_VOLUME=${s4_num_volume[$sub]}
      NUM_VOXEL=${s4_num_voxel[$sub]}
    fi

    root_path=/Users/bo/Documents/data_dean_lab
    TEMPLATE_PATH=$root_path"/data_swati_ket/fsf_template/feat_template_univariate.fsf"
    OUTPUTDIR=$root_path"/data_swati_ket/outputs/univariate_sub"$sub"_run"$run

    BOLD_IMAGE=$root_path"/data_swati_ket/outputs/preprocessing_sm5_sub"$sub"_run"$run".feat/filtered_func_data.nii.gz"
    Standard_brain_dir=$root_path"/data_swati_ket/toolbox_3rdParty/MNI152_T1_2mm_brain.nii.gz"
    CURRUN=$run

    sed -e 's@OUTPUTDIR@'$OUTPUTDIR'@g' \
        -e 's@BOLD_IMAGE@'$BOLD_IMAGE'@g' \
        -e 's@CURRUN@'$CURRUN'@g' \
        -e 's@Standard_brain_dir@'$Standard_brain_dir'@g' \
        -e 's@NUM_VOLUME@'$NUM_VOLUME'@g' \
        -e 's@NUM_VOXEL@'$NUM_VOXEL'@g' <$TEMPLATE_PATH> $root_path/data_swati_ket/outputs/fsf_univariate/fsf_sub$sub"_s"$run".fsf"


  done
done
