

#!/bin/bash

# prep
# fsf_list=(/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/fsf_preprocessing/fsf_prep*)

# for i in "${fsf_list[@]}"; do
#   (
#     feat $i
#   )&
#   if (( $(wc -w <<<$(jobs -p)) % 8 == 0 )); then wait; fi 
# done


# # univariate
# feat /Users/bo/Documents/data_dean_lab/data_swati_ket/script_template/feat_template_univariate.fsf

fsf_list=(/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/fsf_univariate/fsf_*)

for i in "${fsf_list[@]}"; do
  (
    feat $i
  )&
  if (( $(wc -w <<<$(jobs -p)) % 4 == 0 )); then wait; fi 
done
