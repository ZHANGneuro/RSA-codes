#!/bin/bash

# s1_num_volume and s1_num_voxel include number of volume and voxels for each session and subjects
# s1_num_volume[2] represents subject2

declare -a s1
s1_num_volume[1]=1279
s1_num_volume[2]=1286
s1_num_volume[3]=1207
s1_num_volume[4]=1283
s1_num_volume[5]=1273
s1_num_volume[6]=1219
s1_num_volume[7]=1256
s1_num_volume[8]=1251
s1_num_volume[9]=1341
s1_num_volume[10]=1409
s1_num_volume[11]=1187
s1_num_volume[12]=1374
s1_num_volume[13]=1459
s1_num_volume[14]=1367
s1_num_volume[15]=1378
s1_num_volume[16]=1352
s1_num_volume[17]=1309
s1_num_volume[18]=1302
s1_num_volume[19]=1197
s1_num_volume[20]=1351
s1_num_volume[21]=1305
s1_num_volume[22]=1332
s1_num_volume[23]=1358
s1_num_volume[24]=1389
s1_num_volume[25]=1320
s1_num_volume[26]=1403
s1_num_volume[27]=793
s1_num_volume[28]=1393
s1_num_volume[29]=1324
s1_num_volume[30]=1280
s1_num_volume[31]=1240
s1_num_voxel[1]=848683008
s1_num_voxel[2]=853327872
s1_num_voxel[3]=800907264
s1_num_voxel[4]=851337216
s1_num_voxel[5]=844701696
s1_num_voxel[6]=808869888
s1_num_voxel[7]=833421312
s1_num_voxel[8]=830103552
s1_num_voxel[9]=889823232
s1_num_voxel[10]=934944768
s1_num_voxel[11]=787636224
s1_num_voxel[12]=911720448
s1_num_voxel[13]=968122368
s1_num_voxel[14]=907075584
s1_num_voxel[15]=914374656
s1_num_voxel[16]=897122304
s1_num_voxel[17]=868589568
s1_num_voxel[18]=863944704
s1_num_voxel[19]=794271744
s1_num_voxel[20]=896458752
s1_num_voxel[21]=865935360
s1_num_voxel[22]=883851264
s1_num_voxel[23]=901103616
s1_num_voxel[24]=921673728
s1_num_voxel[25]=875888640
s1_num_voxel[26]=930963456
s1_num_voxel[27]=526196736
s1_num_voxel[28]=924327936
s1_num_voxel[29]=878542848
s1_num_voxel[30]=849346560
s1_num_voxel[31]=822804480
declare -a s2
s2_num_volume[1]=1452
s2_num_volume[2]=1315
s2_num_volume[3]=1342
s2_num_volume[4]=1250
s2_num_volume[5]=1335
s2_num_volume[6]=1256
s2_num_volume[7]=1294
s2_num_volume[8]=1264
s2_num_volume[9]=1301
s2_num_volume[10]=1478
s2_num_volume[11]=1196
s2_num_volume[12]=1319
s2_num_volume[13]=1399
s2_num_volume[14]=1355
s2_num_volume[15]=1341
s2_num_volume[16]=1398
s2_num_volume[17]=1200
s2_num_volume[18]=1258
s2_num_volume[19]=1208
s2_num_volume[20]=1317
s2_num_volume[21]=1272
s2_num_volume[22]=1394
s2_num_volume[23]=1353
s2_num_volume[24]=1364
s2_num_volume[25]=1334
s2_num_volume[26]=1390
s2_num_volume[27]=1594
s2_num_volume[28]=1320
s2_num_volume[29]=1289
s2_num_volume[30]=1283
s2_num_volume[31]=1219
s2_num_voxel[1]=963477504
s2_num_voxel[2]=872570880
s2_num_voxel[3]=890486784
s2_num_voxel[4]=829440000
s2_num_voxel[5]=885841920
s2_num_voxel[6]=833421312
s2_num_voxel[7]=858636288
s2_num_voxel[8]=838729728
s2_num_voxel[9]=863281152
s2_num_voxel[10]=980729856
s2_num_voxel[11]=793608192
s2_num_voxel[12]=875225088
s2_num_voxel[13]=928309248
s2_num_voxel[14]=899112960
s2_num_voxel[15]=889823232
s2_num_voxel[16]=927645696
s2_num_voxel[17]=796262400
s2_num_voxel[18]=834748416
s2_num_voxel[19]=801570816
s2_num_voxel[20]=873897984
s2_num_voxel[21]=844038144
s2_num_voxel[22]=924991488
s2_num_voxel[23]=897785856
s2_num_voxel[24]=905084928
s2_num_voxel[25]=885178368
s2_num_voxel[26]=922337280
s2_num_voxel[27]=1057701888
s2_num_voxel[28]=875888640
s2_num_voxel[29]=855318528
s2_num_voxel[30]=851337216
s2_num_voxel[31]=808869888
declare -a s3
s3_num_volume[1]=1382
s3_num_volume[2]=1264
s3_num_volume[3]=1264
s3_num_volume[4]=1268
s3_num_volume[5]=1341
s3_num_volume[6]=1242
s3_num_volume[7]=1239
s3_num_volume[8]=1269
s3_num_volume[9]=1310
s3_num_volume[10]=1536
s3_num_volume[11]=1201
s3_num_volume[12]=1341
s3_num_volume[13]=1312
s3_num_volume[14]=1345
s3_num_volume[15]=1297
s3_num_volume[16]=1299
s3_num_volume[17]=1241
s3_num_volume[18]=1347
s3_num_volume[19]=1242
s3_num_volume[20]=1324
s3_num_volume[21]=1222
s3_num_volume[22]=1511
s3_num_volume[23]=1354
s3_num_volume[24]=1405
s3_num_volume[25]=1321
s3_num_volume[26]=1423
s3_num_volume[27]=1787
s3_num_volume[28]=1274
s3_num_volume[29]=1276
s3_num_volume[30]=1247
s3_num_volume[31]=1198
s3_num_voxel[1]=917028864
s3_num_voxel[2]=838729728
s3_num_voxel[3]=838729728
s3_num_voxel[4]=841383936
s3_num_voxel[5]=889823232
s3_num_voxel[6]=824131584
s3_num_voxel[7]=822140928
s3_num_voxel[8]=842047488
s3_num_voxel[9]=869253120
s3_num_voxel[10]=1019215872
s3_num_voxel[11]=796925952
s3_num_voxel[12]=889823232
s3_num_voxel[13]=870580224
s3_num_voxel[14]=892477440
s3_num_voxel[15]=860626944
s3_num_voxel[16]=861954048
s3_num_voxel[17]=823468032
s3_num_voxel[18]=893804544
s3_num_voxel[19]=824131584
s3_num_voxel[20]=878542848
s3_num_voxel[21]=810860544
s3_num_voxel[22]=1002627072
s3_num_voxel[23]=898449408
s3_num_voxel[24]=932290560
s3_num_voxel[25]=876552192
s3_num_voxel[26]=944234496
s3_num_voxel[27]=1185767424
s3_num_voxel[28]=845365248
s3_num_voxel[29]=846692352
s3_num_voxel[30]=827449344
s3_num_voxel[31]=794935296
declare -a s4
s4_num_volume[1]=1337
s4_num_volume[2]=1230
s4_num_volume[3]=1223
s4_num_volume[4]=1269
s4_num_volume[5]=1315
s4_num_volume[6]=1209
s4_num_volume[7]=1233
s4_num_volume[8]=1218
s4_num_volume[9]=1343
s4_num_volume[10]=1500
s4_num_volume[11]=1186
s4_num_volume[12]=1412
s4_num_volume[13]=1363
s4_num_volume[14]=1378
s4_num_volume[15]=1289
s4_num_volume[16]=1283
s4_num_volume[17]=1248
s4_num_volume[18]=1333
s4_num_volume[19]=1181
s4_num_volume[20]=1285
s4_num_volume[21]=1233
s4_num_volume[22]=1394
s4_num_volume[23]=1361
s4_num_volume[24]=1365
s4_num_volume[25]=1358
s4_num_volume[26]=1497
s4_num_volume[27]=1474
s4_num_volume[28]=1259
s4_num_volume[29]=1215
s4_num_volume[30]=1271
s4_num_volume[31]=1262
s4_num_voxel[1]=887169024
s4_num_voxel[2]=816168960
s4_num_voxel[3]=811524096
s4_num_voxel[4]=842047488
s4_num_voxel[5]=872570880
s4_num_voxel[6]=802234368
s4_num_voxel[7]=818159616
s4_num_voxel[8]=808206336
s4_num_voxel[9]=891150336
s4_num_voxel[10]=995328000
s4_num_voxel[11]=786972672
s4_num_voxel[12]=936935424
s4_num_voxel[13]=904421376
s4_num_voxel[14]=914374656
s4_num_voxel[15]=855318528
s4_num_voxel[16]=851337216
s4_num_voxel[17]=828112896
s4_num_voxel[18]=884514816
s4_num_voxel[19]=783654912
s4_num_voxel[20]=852664320
s4_num_voxel[21]=818159616
s4_num_voxel[22]=924991488
s4_num_voxel[23]=903094272
s4_num_voxel[24]=905748480
s4_num_voxel[25]=901103616
s4_num_voxel[26]=993337344
s4_num_voxel[27]=978075648
s4_num_voxel[28]=835411968
s4_num_voxel[29]=806215680
s4_num_voxel[30]=843374592
s4_num_voxel[31]=837402624

for sub in {30..31}; do
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

    NUM_EV=112
    if [ $sub -eq 1 ] && [ $run -eq 1 ];then
      NUM_EV=92
    fi
    if [ $sub -eq 7 ] && [ $run -eq 1 ];then
      NUM_EV=35
    fi
    if [ $sub -eq 18 ] && [ $run -eq 2 ];then
      NUM_EV=111
    fi
    if [ $sub -eq 27 ] && [ $run -eq 1 ];then
      NUM_EV=64
    fi
    if [ $sub -eq 29 ] && [ $run -eq 4 ];then
      NUM_EV=105
    fi


    root_path=/central/groups/mobbslab/bo
    TEMPLATE_PATH=/Users/bo/Documents/data_dean_lab/sarah_safetyEstimationTask/code_rsa/3_RSA_trial_based_GLM/feat_template_1st_level.fsf
    OUTPUTDIR=$root_path"/rsa_output/rsa_1stlevel_sub"$sub"_run"$run
    BOLD_IMAGE=$root_path"/rsa_output/filtered_sub"$sub"_run"$run".nii.gz"
    Standard_brain_dir=$root_path"/template/MNI152_T1_2mm_brain.nii.gz"


    GLM_setup=""
    for IV in $( seq 1 $NUM_EV ); do
      GLM_setup+='set fmri(evtitle'$IV') ""\nset fmri(shape'$IV') 3\nset fmri(convolve'$IV') 3\nset fmri(convolve_phase'$IV') 0\nset fmri(tempfilt_yn'$IV') 1\nset\ fmri(deriv_yn'$IV') 0\nset fmri(custom'$IV') '$root_path'/txt_3_cols/sub'$sub'_run'$run'_trial'$IV'.txt\n'
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

    echo $sub"-"$run"-"$NUM_EV

    sed -e 's@OUTPUTDIR@'$OUTPUTDIR'@g' \
        -e 's@GLM_setup@'"$GLM_setup"'@g' \
        -e 's@BOLD_IMAGE@'$BOLD_IMAGE'@g' \
        -e 's@NUM_EV@'"$NUM_EV"'@g' \
        -e 's@required_format_for_contrast_mode1@'"$required_format_for_contrast_mode1"'@g' \
        -e 's@required_format_for_contrast_mode2@'"$required_format_for_contrast_mode2"'@g' \
        -e 's@Standard_brain_dir@'$Standard_brain_dir'@g' \
        -e 's@NUM_VOLUME@'$NUM_VOLUME'@g' \
        -e 's@NUM_VOXEL@'$NUM_VOXEL'@g' <$TEMPLATE_PATH> /Users/bo/Documents/data_dean_lab/sarah_safetyEstimationTask/outputs/fsf_files_glm_1st_level/fsf_sub$sub"_s"$run".fsf"



  done
done
