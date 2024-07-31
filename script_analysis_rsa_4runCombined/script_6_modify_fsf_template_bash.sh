#!/bin/bash

# s1_num_volume and s1_num_voxel include number of volume and voxels for each session and subjects
# s1_num_volume[2] represents subject2

for sub in {3..3}; do

  NUM_VOLUME=3053
  NUM_VOXEL=2755726337
  

  root_path=/Users/bo/Documents/data_dean_lab
  TEMPLATE_PATH=$root_path"/data_swati_ket/fsf_template/feat_template_rsa_1st_level.fsf"
  OUTPUTDIR=$root_path"/data_swati_ket/outputs/rsa_1stlevel_sub"$sub
  BOLD_IMAGE=$root_path"/data_swati_ket/image_standard_bold_nosm.nii"
  Standard_brain_dir=$root_path"/data_swati_ket/toolbox_3rdParty/MNI152_T1_2mm_brain.nii.gz"
  
  NUM_EV=61
  NUM_message_level_EV=51
  GLM_setup=""
  for IV in $( seq 1 $NUM_message_level_EV ); do
    GLM_setup+='set fmri(evtitle'$IV') ""\nset fmri(shape'$IV') 3\nset fmri(convolve'$IV') 3\nset fmri(convolve_phase'$IV') 0\nset fmri(tempfilt_yn'$IV') 1\nset\ fmri(deriv_yn'$IV') 0\nset fmri(custom'$IV') '$root_path'/data_swati_ket/outputs/col3_rsa_mess_'$IV'.txt\n'
    for ind_ortho in $( seq 0 $NUM_EV ); do
        GLM_setup+='set fmri(ortho'$IV'.'$ind_ortho') 0\n'
    done
    GLM_setup+='\n'
  done

  IV=52
  GLM_setup+='set fmri(evtitle'$IV') ""\nset fmri(shape'$IV') 3\nset fmri(convolve'$IV') 3\nset fmri(convolve_phase'$IV') 0\nset fmri(tempfilt_yn'$IV') 1\nset\ fmri(deriv_yn'$IV') 0\nset fmri(custom'$IV') '$root_path'/data_swati_ket/outputs/col3_rsa_LikesGiven.txt\n'
  for ind_ortho in $( seq 0 $NUM_EV ); do
      GLM_setup+='set fmri(ortho'$IV'.'$ind_ortho') 0\n'
  done
  GLM_setup+='\n'
  
  IV=53
  GLM_setup+='set fmri(evtitle'$IV') ""\nset fmri(shape'$IV') 3\nset fmri(convolve'$IV') 3\nset fmri(convolve_phase'$IV') 0\nset fmri(tempfilt_yn'$IV') 1\nset\ fmri(deriv_yn'$IV') 0\nset fmri(custom'$IV') '$root_path'/data_swati_ket/outputs/col3_rsa_DislikesGiven.txt\n'
  for ind_ortho in $( seq 0 $NUM_EV ); do
      GLM_setup+='set fmri(ortho'$IV'.'$ind_ortho') 0\n'
  done
  GLM_setup+='\n'

  IV=54
  GLM_setup+='set fmri(evtitle'$IV') ""\nset fmri(shape'$IV') 3\nset fmri(convolve'$IV') 3\nset fmri(convolve_phase'$IV') 0\nset fmri(tempfilt_yn'$IV') 1\nset\ fmri(deriv_yn'$IV') 0\nset fmri(custom'$IV') '$root_path'/data_swati_ket/outputs/col3_rsa_likesReceived.txt\n'
  for ind_ortho in $( seq 0 $NUM_EV ); do
      GLM_setup+='set fmri(ortho'$IV'.'$ind_ortho') 0\n'
  done
  GLM_setup+='\n'

  IV=55
  GLM_setup+='set fmri(evtitle'$IV') ""\nset fmri(shape'$IV') 3\nset fmri(convolve'$IV') 3\nset fmri(convolve_phase'$IV') 0\nset fmri(tempfilt_yn'$IV') 1\nset\ fmri(deriv_yn'$IV') 0\nset fmri(custom'$IV') '$root_path'/data_swati_ket/outputs/col3_rsa_dislikesReceived.txt\n'
  for ind_ortho in $( seq 0 $NUM_EV ); do
      GLM_setup+='set fmri(ortho'$IV'.'$ind_ortho') 0\n'
  done
  GLM_setup+='\n'

  IV=56
  GLM_setup+='set fmri(evtitle'$IV') ""\nset fmri(shape'$IV') 3\nset fmri(convolve'$IV') 3\nset fmri(convolve_phase'$IV') 0\nset fmri(tempfilt_yn'$IV') 1\nset\ fmri(deriv_yn'$IV') 0\nset fmri(custom'$IV') '$root_path'/data_swati_ket/outputs/col3_rsa_likability.txt\n'
  for ind_ortho in $( seq 0 $NUM_EV ); do
      GLM_setup+='set fmri(ortho'$IV'.'$ind_ortho') 0\n'
  done
  GLM_setup+='\n'

  IV=57
  GLM_setup+='set fmri(evtitle'$IV') ""\nset fmri(shape'$IV') 3\nset fmri(convolve'$IV') 3\nset fmri(convolve_phase'$IV') 0\nset fmri(tempfilt_yn'$IV') 1\nset\ fmri(deriv_yn'$IV') 0\nset fmri(custom'$IV') '$root_path'/data_swati_ket/outputs/col3_rsa_likabilityRev.txt\n'
  for ind_ortho in $( seq 0 $NUM_EV ); do
      GLM_setup+='set fmri(ortho'$IV'.'$ind_ortho') 0\n'
  done
  GLM_setup+='\n'

  IV=58
  GLM_setup+='set fmri(evtitle'$IV') ""\nset fmri(shape'$IV') 3\nset fmri(convolve'$IV') 3\nset fmri(convolve_phase'$IV') 0\nset fmri(tempfilt_yn'$IV') 1\nset\ fmri(deriv_yn'$IV') 0\nset fmri(custom'$IV') '$root_path'/data_swati_ket/outputs/col3_rsa_feelings.txt\n'
  for ind_ortho in $( seq 0 $NUM_EV ); do
      GLM_setup+='set fmri(ortho'$IV'.'$ind_ortho') 0\n'
  done
  GLM_setup+='\n'

  IV=59
  GLM_setup+='set fmri(evtitle'$IV') ""\nset fmri(shape'$IV') 3\nset fmri(convolve'$IV') 3\nset fmri(convolve_phase'$IV') 0\nset fmri(tempfilt_yn'$IV') 1\nset\ fmri(deriv_yn'$IV') 0\nset fmri(custom'$IV') '$root_path'/data_swati_ket/outputs/col3_rsa_rewardPunish.txt\n'
  for ind_ortho in $( seq 0 $NUM_EV ); do
      GLM_setup+='set fmri(ortho'$IV'.'$ind_ortho') 0\n'
  done
  GLM_setup+='\n'

  IV=60
  GLM_setup+='set fmri(evtitle'$IV') ""\nset fmri(shape'$IV') 3\nset fmri(convolve'$IV') 3\nset fmri(convolve_phase'$IV') 0\nset fmri(tempfilt_yn'$IV') 1\nset\ fmri(deriv_yn'$IV') 0\nset fmri(custom'$IV') '$root_path'/data_swati_ket/outputs/col3_rsa_fixate.txt\n'
  for ind_ortho in $( seq 0 $NUM_EV ); do
      GLM_setup+='set fmri(ortho'$IV'.'$ind_ortho') 0\n'
  done
  GLM_setup+='\n'

  IV=61
  GLM_setup+='set fmri(evtitle'$IV') ""\nset fmri(shape'$IV') 3\nset fmri(convolve'$IV') 3\nset fmri(convolve_phase'$IV') 0\nset fmri(tempfilt_yn'$IV') 1\nset\ fmri(deriv_yn'$IV') 0\nset fmri(custom'$IV') '$root_path'/data_swati_ket/outputs/col3_rsa_prompt.txt\n'
  for ind_ortho in $( seq 0 $NUM_EV ); do
      GLM_setup+='set fmri(ortho'$IV'.'$ind_ortho') 0\n'
  done
  GLM_setup+='\n'



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
      -e 's@NUM_EV@'"$NUM_EV"'@g' \
      -e 's@Standard_brain_dir@'$Standard_brain_dir'@g' \
      -e 's@NUM_VOLUME@'$NUM_VOLUME'@g' \
      -e 's@NUM_VOXEL@'$NUM_VOXEL'@g' \
      -e 's@required_format_for_contrast_mode1@'"$required_format_for_contrast_mode1"'@g' \
      -e 's@required_format_for_contrast_mode2@'"$required_format_for_contrast_mode2"'@g' \
      -e 's@GLM_setup@'"$GLM_setup"'@g' <$TEMPLATE_PATH> $root_path/data_swati_ket/outputs/fsf_rsa/fsf_rsa_sub$sub".fsf"

done
