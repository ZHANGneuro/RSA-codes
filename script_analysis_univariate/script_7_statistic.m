



temp = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate.feat/stats/pe1_s.nii.gz');

ima = temp.vol;

temp.vol = ima;
MRIwrite(temp, '/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate.feat/stats/pe1_s_matlab.nii.gz')




