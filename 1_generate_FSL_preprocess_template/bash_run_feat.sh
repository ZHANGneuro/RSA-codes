#!/bin/bash

# "5" in line 11 means 5 parallel process (cpus), please choose the # based on the performance of your (super) computer

fsf_list=(/Users/bo/Documents/data_dean_lab/sarah_safetyEstimationTask/outputs/fsf_files_preprocessing/fsf_sub1_s4*)

for i in "${fsf_list[@]}"; do
  (
    feat $i
  )&
  if (( $(wc -w <<<$(jobs -p)) % 4 == 0 )); then wait; fi 
done






