

function label_table = matlab_return_label_4_category(root_path, ind_subject, ind_run)


%% extract labels from csv file

labels = csvimport([root_path, ['sarah_safetyEstimationTask/WA_00',num2str(ind_subject),'_Task_Run',num2str(ind_run),'_Shock.csv']], ...
    'columns', [4,5,6,8], 'noHeader', true);

% exclude header
labels = labels(2:end, :);

% exclude empty cells
labels = labels(cellfun(@(x) ~isempty(x), labels(:,1)), :);


safety_list = {'fist', 'stick', 'gun', 'grenade'};

threat_list = {'cat', 'goose', 'grizzly', 'lion'};


label_table = cell(length(labels), 4);
for ith_row = 1:length(labels)

    % protection: fist, stick, gun, grenade
    % threat: cat, goose, grizzly, lion
    
    stim1 = extractBetween(labels{ith_row, 1}, 'img/', '.png');
    stim2 = extractBetween(labels{ith_row, 2}, 'img/', '.png');
    outcome = extractBetween(labels{ith_row, 3}, 'img/', '.png');
    stim1 = stim1{1,1};
    stim2 = stim2{1,1};
    outcome = outcome{1,1};

    %
    label_table{ith_row, 1} = stim1;
    label_table{ith_row, 2} = stim2;

    % safety 
    if sum(contains(safety_list, stim1))
        label_table{ith_row, 3} = 'protection';
        index = find(strcmp(safety_list,stim1));
        label_table{ith_row, 4} = double(index>=2);
    end
    % threat
    if sum(contains(threat_list, stim1))
        label_table{ith_row, 5} = 'threat';
        index = find(strcmp(threat_list,stim1));
        label_table{ith_row, 6} = double(index>=2);
    end

    % safety 
    if sum(contains(safety_list, stim2))
        label_table{ith_row, 3} = 'protection';
        index = find(strcmp(safety_list,stim2));
        label_table{ith_row, 4} = double(index>=2);
    end
    % threat
    if sum(contains(threat_list, stim2))
        label_table{ith_row, 5} = 'threat';
        index = find(strcmp(threat_list,stim2));
        label_table{ith_row, 6} = double(index>=2);
    end

    label_table{ith_row, 7} = outcome;
    label_table{ith_row, 8} = labels{ith_row, 4};

end


for ith_row = 1:length(labels)

    % dangerous weapon + safe animal 
    if label_table{ith_row, 4}==1 & label_table{ith_row, 6}==0
        label_table{ith_row, 9} = 1;
    else
        label_table{ith_row, 9} = 0;
    end
    % dangerous weapon + dangerous animal 
    if label_table{ith_row, 4}==1 & label_table{ith_row, 6}==1
        label_table{ith_row, 10} = 1;
    else
        label_table{ith_row, 10} = 0;
    end

    % safe weapon + safe animal 
    if label_table{ith_row, 4}==0 & label_table{ith_row, 6}==0
        label_table{ith_row, 11} = 1;
    else
        label_table{ith_row, 11} = 0;
    end

    % safe weapon + dangerous animal 
    if label_table{ith_row, 4}==0 & label_table{ith_row, 6}==1
        label_table{ith_row, 12} = 1;
    else
        label_table{ith_row, 12} = 0;
    end

end



