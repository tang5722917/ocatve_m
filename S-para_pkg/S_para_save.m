%S_para_save
%V0.0.1  Apr 2022
%save S-para model date by Octave binary format
% 1st var "file_name" is the S-para model save file name "xxxx.mat"
% 2nd var "S_data" is S-para data that import from the function 'S_para_import'

function s_status = S_para_save(file_name, S_data)
try
    if(isstruct(S_data) == 0)
        error("S-para:struct","is not the S-para data");
    endif
    if(S_data.status ==0)
        error("S-para:struct","is not the valid S-para data");
    endif
    temp_S_data = S_data;
    save("-binary",file_name,"-struct","temp_S_data");
    s_status = 1;
catch
    err = lasterror()
end_try_catch

end
