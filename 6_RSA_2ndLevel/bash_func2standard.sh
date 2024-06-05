# #!/bin/bash

root_path='/Users/bo/Documents/data_dean_lab/sarah_safetyEstimationTask'
roi_list=($root_path/outputs/result_rsa_category/*)


for i in "${roi_list[@]}"; do

    IN=$i
    arrIN=(${IN/result_rsa_category\// })
    filename=${arrIN[1]}

    IN=$i
    arrIN=(${IN/_run/ })
    ind_run=${arrIN[1]}
    IN=$ind_run
    arrIN=(${IN/./ })
    ind_run=${arrIN[0]}

    IN=$i
    arrIN=(${IN/_sub/ })
    ind_sub=${arrIN[1]}
    IN=$ind_sub
    arrIN=(${IN/_run/ })
    ind_sub=${arrIN[0]}

    p1="flirt -in $i "

    p2=" -ref $root_path/code_rsa/ThirdParty_tools/MNI152_T1_2mm_brain.nii.gz "

    p22="-out "$root_path"/outputs/result_rsa_category/standard_"$filename

    p3=" -init "$root_path"/outputs/preprocessing_sub"$ind_sub"_run"$ind_run".feat/reg/example_func2standard.mat -applyxfm"



    $p1$p2$p22$p3

  
done
