%S_para_load
%V0.0.1  Apr 2022
%save S-para model date by Octave binary format
% 1st var "file_name" is the S-para model save file name "xxxx.mat"
% return var "S_data" is S-para data that load from .mat file

function S_data = S_para_save(file_name)
try
    temp_S_data = load(file_name);
    if(isstruct(temp_S_data) == 0)
        error("S-para:struct","is not the S-para data");
    endif
    if(temp_S_data.status ==0)
        error("S-para:struct","is not the valid S-para data");
    endif
    S_data = temp_S_data ;
catch
    err = lasterror()
end_try_catch

end
