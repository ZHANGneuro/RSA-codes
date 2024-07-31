#!/bin/bash

fsf_list=(/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/bold_native_nosm/raw_*)

for i in "${fsf_list[@]}"; do
  (

      IN=$i
      arrIN=(${IN//ima/ })
      cur_path=${arrIN[0]}
      file_name=${arrIN[1]}
      IN=$file_name
      arrIN=(${IN//./ })
      tr_info=${arrIN[0]}

      IN=$i
      arrIN=(${IN//_sm/ })
      IN=${arrIN[1]}
      arrIN=(${IN//_run/ })
      sm_info=${arrIN[0]}

      IN=$i
      arrIN=(${IN//_run/ })
      IN=${arrIN[1]}
      arrIN=(${IN//_ima/ })
      run_info=${arrIN[0]}

      input="/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/bold_native_nosm/raw_sm"$sm_info"_run"$run_info"_ima"$tr_info".nii"
      
      output="/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/bold_standard_nosm/standard_sm"$sm_info"_run"$run_info"_ima"$tr_info".nii"

      p3="/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/preprocessing_sm"$sm_info"_sub3_run"$run_info".feat/reg/example_func2standard.mat"

      flirt -in $input -ref /Users/bo/Documents/brainmask/fsl_standard/MNI152_T1_2mm_brain.nii.gz -out $output  -init $p3 -applyxfm

  )&
  if (( $(wc -w <<<$(jobs -p)) % 8 == 0 )); then wait; fi
done








