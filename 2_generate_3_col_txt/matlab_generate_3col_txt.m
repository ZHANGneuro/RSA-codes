

root_path = '/Users/bo/Documents/data_dean_lab';


check_table = cell(31*4, 3);
counter = 1;
for ind_subject = 1:31
    for ind_run = 1:4

        % extract values from csv file
        [firststim_image_started, iti_started, jitter_iti, wait_started] ...
            = csvimport([root_path, ['/sarah_safetyEstimationTask/WA_',num2str(ind_subject),'_Task_Run',num2str(ind_run),'_Shock.csv']], ...
            'columns', {'firststim_image.started', 'iti.started', 'jitter_iti', 'wait.started'});
        
        % exclude empty cells
        firststim_image_started = firststim_image_started(cellfun(@(x) ~isempty(x), firststim_image_started));
        iti_started = iti_started(cellfun(@(x) ~isempty(x), iti_started));
        jitter_iti = jitter_iti(cellfun(@(x) ~isempty(x), jitter_iti));
        wait_started = wait_started(cellfun(@(x) ~isempty(x), wait_started));

        checker = min([length(firststim_image_started), length(iti_started), length(jitter_iti)]);
        check_table{counter, 1} = ind_subject;
        check_table{counter, 2} = ind_run;
        check_table{counter, 3} = checker;
        counter = counter + 1;
        
        firststim_image_started = firststim_image_started(1:checker);
        iti_started = iti_started(1:checker);
        jitter_iti = jitter_iti(1:checker);
        

        % transform string to number
        firststim_image_started = str2double(firststim_image_started);
        iti_started = str2double(iti_started);
        jitter_iti = str2double(jitter_iti);
        wait_started = str2double(wait_started);

        % time correction
        firststim_image_started = firststim_image_started - wait_started;
        iti_started = iti_started - wait_started;


        % reorganize, combine block1-3 into single array
        trial_onset = firststim_image_started;
        trial_end = iti_started+jitter_iti;
        trial_duration = trial_end - trial_onset;


        %% single-trial regressors
        for ind_trial = 1:length(trial_onset)
            export_txt = [trial_onset(ind_trial), trial_duration(ind_trial), 1];
            fid = fopen([  root_path,  ['/sarah_safetyEstimationTask/outputs/txt_3_cols/sub',num2str(ind_subject), '_run', num2str(ind_run), '_trial', num2str(ind_trial), '.txt']],'w');
            for n = 1:length(export_txt(:,1))
                fprintf(fid,'%f\t  %f\t  %d\n',export_txt(n,:));
            end
            fclose(fid);
        end


    end
end
