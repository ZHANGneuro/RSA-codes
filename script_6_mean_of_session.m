

struct_template = MRIread('/Users/bo/Documents/brainmask/mask_wholebrain.nii');
ima_template = struct_template.vol;
index_template = find(ima_template==0);




struct1 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run1_pe3.nii.gz');
struct2 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run2_pe3.nii.gz');
struct3 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run3_pe3.nii.gz');
struct4 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run4_pe3.nii.gz');
cur_ima = (struct1.vol+struct2.vol+struct3.vol+struct4.vol)/4;
cur_ima(index_template) = 0;
struct1.vol = cur_ima;
MRIwrite(struct1, '/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/LikesGiven.nii')



struct1 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run1_pe4.nii.gz');
struct2 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run2_pe4.nii.gz');
struct3 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run3_pe4.nii.gz');
struct4 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run4_pe4.nii.gz');
cur_ima = (struct1.vol+struct2.vol+struct3.vol+struct4.vol)/4;
cur_ima(index_template) = 0;
struct1.vol = cur_ima;
MRIwrite(struct1, '/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/dislikesGiven.nii')


struct1 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run1_pe5.nii.gz');
struct2 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run2_pe5.nii.gz');
struct3 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run3_pe5.nii.gz');
struct4 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run4_pe5.nii.gz');
cur_ima = (struct1.vol+struct2.vol+struct3.vol+struct4.vol)/4;
cur_ima(index_template) = 0;
struct1.vol = cur_ima;
MRIwrite(struct1, '/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/likesReceived.nii')


struct1 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run1_pe6.nii.gz');
struct2 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run2_pe6.nii.gz');
struct3 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run3_pe6.nii.gz');
struct4 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run4_pe6.nii.gz');
cur_ima = (struct1.vol+struct2.vol+struct3.vol+struct4.vol)/4;
cur_ima(index_template) = 0;
struct1.vol = cur_ima;
MRIwrite(struct1, '/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/dislikesReceived.nii')


struct1 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run1_pe11.nii.gz');
struct2 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run2_pe11.nii.gz');
struct3 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run3_pe11.nii.gz');
struct4 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run4_pe11.nii.gz');
cur_ima = (struct1.vol+struct2.vol+struct3.vol+struct4.vol)/4;
cur_ima(index_template) = 0;
struct1.vol = cur_ima;
MRIwrite(struct1, '/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/fixate.nii')



%
struct1 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run1_pe1.nii.gz');
struct2 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run3_pe1.nii.gz');
cur_ima = (struct1.vol+struct2.vol)/2;
cur_ima(index_template) = 0;
struct1.vol = cur_ima;
MRIwrite(struct1, '/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/neg_topic_pos_gpt.nii')

%
struct1 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run1_pe2.nii.gz');
struct2 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run3_pe2.nii.gz');
cur_ima = (struct1.vol+struct2.vol)/2;
cur_ima(index_template) = 0;
struct1.vol = cur_ima;
MRIwrite(struct1, '/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/neg_topic_neg_gpt.nii')


%
struct1 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run2_pe1.nii.gz');
struct2 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run4_pe1.nii.gz');
cur_ima = (struct1.vol+struct2.vol)/2;
cur_ima(index_template) = 0;
struct1.vol = cur_ima;
MRIwrite(struct1, '/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/pos_topic_pos_gpt.nii')


%
struct1 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run2_pe2.nii.gz');
struct2 = MRIread('/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/standard_sub3_run4_pe2.nii.gz');
cur_ima = (struct1.vol+struct2.vol)/2;
cur_ima(index_template) = 0;
struct1.vol = cur_ima;
MRIwrite(struct1, '/Users/bo/Documents/data_dean_lab/data_swati_ket/outputs/univariate_beta/pos_topic_neg_gpt.nii')


