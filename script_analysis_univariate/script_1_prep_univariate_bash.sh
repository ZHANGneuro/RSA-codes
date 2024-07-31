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

    SMOOTH="0"
    TR_INPUT="2"
    root_path=/Users/bo/Documents/data_dean_lab
    TEMPLATE_PATH=$root_path"/data_swati_ket/script_template/feat_template_prep.fsf"
    OUTPUTDIR=$root_path"/data_swati_ket/outputs/preprocessing_sm"$SMOOTH"_sub"$sub"_run"$run
    
    T1_IMAGE=$root_path"/data_swati_ket/image_t1_sub"$sub"_brain.nii.gz"
    BOLD_IMAGE=$root_path"/data_swati_ket/image_raw_bold_sub"$sub"_run"$run".nii"
    Slice_Timing_file=$root_path"/data_swati_ket/slice_timing.txt"
    Standard_brain_dir=$root_path"/data_swati_ket/script_ThirdParty_tools/MNI152_T1_2mm_brain.nii.gz"

    sed -e 's@OUTPUTDIR@'$OUTPUTDIR'@g' \
        -e 's@BOLD_IMAGE@'$BOLD_IMAGE'@g' \
        -e 's@TR_INPUT@'$TR_INPUT'@g' \
        -e 's@T1_IMAGE@'$T1_IMAGE'@g' \
        -e 's@SMOOTH@'$SMOOTH'@g' \
        -e 's@Slice_Timing_file@'$Slice_Timing_file'@g' \
        -e 's@Standard_brain_dir@'$Standard_brain_dir'@g' \
        -e 's@NUM_VOLUME@'$NUM_VOLUME'@g' \
        -e 's@NUM_VOXEL@'$NUM_VOXEL'@g' <$TEMPLATE_PATH> $root_path/data_swati_ket/outputs/fsf_preprocessing/fsf_prep_sm"$SMOOTH"_sub$sub"_s"$run".fsf"


  done
done
