# #!/bin/bash




for ith_run in {1..4}; do

    for ith_pe in {1..12}; do

        i="/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_sub3_run"$ith_run".feat/stats/pe"$ith_pe".nii.gz"

        p1="flirt -in $i "

        p2=" -ref /Users/bo/Documents/data_dean_lab/data_swati_ket/toolbox_3rdParty/MNI152_T1_2mm_brain.nii.gz "

        p22="-out /Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run"$ith_run"_pe"$ith_pe".nii.gz"

        p3=" -init /Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_sub3_run"$ith_run".feat/reg/example_func2standard.mat -applyxfm"

        $p1$p2$p22$p3
    done 

done 
