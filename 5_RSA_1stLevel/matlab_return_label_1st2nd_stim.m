

function label_table = matlab_return_label_1st_stim(root_path, ind_subject, ind_run)


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
        label_table{ith_row, 4} = find(strcmp(safety_list,stim1));
    end

    % threat
    if sum(contains(threat_list, stim1))
        label_table{ith_row, 3} = 'threat';
        label_table{ith_row, 4} = find(strcmp(threat_list,stim1));
    end

    % safety 
    if sum(contains(safety_list, stim2))
        label_table{ith_row, 5} = 'protection';
        label_table{ith_row, 6} = find(strcmp(safety_list,stim2));
    end
    % threat
    if sum(contains(threat_list, stim2))
        label_table{ith_row, 5} = 'threat';
        label_table{ith_row, 6} = find(strcmp(threat_list,stim2));
    end

    % outcome 
    if strcmp(outcome, 'won')
        label_table{ith_row, 7} = 1;
    else
        label_table{ith_row, 7} = 0;
    end

    label_table{ith_row, 8} = str2double(labels{ith_row, 4});


end






