

function label_table = script_10_return_label_matlab(root_path)


% extract values from csv file
[num_table1,TXT,txt_table1] = xlsread([root_path, '/data_swati_ket/beh_block0.xlsx']);
[num_table2,TXT,txt_table2] = xlsread([root_path, '/data_swati_ket/beh_block1.xlsx']);
[num_table3,TXT,txt_table3] = xlsread([root_path, '/data_swati_ket/beh_block2.xlsx']);
[num_table4,TXT,txt_table4] = xlsread([root_path, '/data_swati_ket/beh_block3.xlsx']);

txt_table1 = txt_table1(2:end, :);
txt_table2 = txt_table2(2:end, :);
txt_table3 = txt_table3(2:end, :);
txt_table4 = txt_table4(2:end, :);

num_table = [num_table1; num_table2; num_table3; num_table4];
txt_table = [txt_table1; txt_table2; txt_table3; txt_table4];

for ith_col = 1:5
    for ith_row = 1:length(txt_table)
        txt_table{ith_row, ith_col} = num2str(txt_table{ith_row, ith_col});
    end
end

topic_con = num_table(cellfun(@(x) strcmp(x, 'msgReceived'), txt_table(:, 6)), 3);
partner_con = num_table(cellfun(@(x) strcmp(x, 'msgReceived'), txt_table(:, 6)), 4);

label_table = cell(length(topic_con), 2);
for ith_row = 1:length(topic_con)
    label_table{ith_row, 1} = topic_con(ith_row);
    label_table{ith_row, 2} = partner_con(ith_row);
end





