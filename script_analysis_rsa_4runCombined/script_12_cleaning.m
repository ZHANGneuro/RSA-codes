




mask_struct = MRIread('/Users/bo/Documents/brainmask/mask_wholebrain.nii');
mask_ima= mask_struct.vol;
mask_index = find(mask_ima==0);



pn_struct = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/result_rsa/rsa_pn.nii');
ima_pn= pn_struct.vol;
ima_pn(mask_index)=0;
pn_struct.vol = ima_pn;
MRIwrite(pn_struct, '/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/result_rsa/rsa_pn_brain.nii');


pp_struct = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/result_rsa/rsa_pp.nii');
ima_pp= pp_struct.vol;
ima_pp(mask_index)=0;
pp_struct.vol = ima_pp;
MRIwrite(pp_struct, '/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/result_rsa/rsa_pp_brain.nii');


tn_struct = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/result_rsa/rsa_tn.nii');
ima_tn= tn_struct.vol;
ima_tn(mask_index)=0;
tn_struct.vol = ima_tn;
MRIwrite(tn_struct, '/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/result_rsa/rsa_tn_brain.nii');


tp_struct = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/result_rsa/rsa_tp.nii');
ima_tp= tp_struct.vol;
ima_tp(mask_index)=0;
tp_struct.vol = ima_tp;
MRIwrite(tp_struct, '/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/result_rsa/rsa_tp_brain.nii');





