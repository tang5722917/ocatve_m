%S_para_import
%V0.0.1  Apr 2022
%Import S-para model file into Octave
% 1st var "file_name" is the S-para model file name "xxxx.snp"
% 2nd var "N" equals 'N' of 'snp'
% Return var S is the S-para data structure

function S = S_para_import(file_name,N)
    if (nargin != 2)
    error ("not enough input arguments");
    endif
    fprintf("File name : %s \n", file_name);

    S.status = 0;
    S.MA_data = {};
    S.PH_data = {};
    S.Fre = [];
    S.fre_num = 0;
    S.Num = N;
    S_maxtri_perfre = N*N+1;
    data_item_num = 0;
    Fre_point = N*N*2+1;
    Fre_num = 0;
    temp_vari_ma = 1;
    temp_varj_ma = 1;
    temp_vari_ph = 1;
    temp_varj_ph = 1;
    try
        fid = fopen(file_name,'r');
        if (fid == -1)
            error ("S-para:Open","not open S-para model file");
        endif
        fprintf("S-para Model Tile :\n");
        while ( ! feof (fid) )
            str = fgetl(fid);
            if( strncmp(str,'#',1) == 1)
                fprintf("%s\n", str);
            elseif ( strncmp(str,'!',1) == 1)
                fprintf("%s\n", str);
            else
                str_sp = strtrim(str);
                str_sp1 = strsplit(str_sp);
                for i = 1:length(str_sp1);
                    if(isspace(str_sp1{i}) == 0)
                        item_data = str2num(str_sp1{i});
                        data_item_num++;
                        if(rem(data_item_num,Fre_point) == 1)
                            S.Fre = [S.Fre item_data];
                            Fre_num++;
                            S.MA_data{Fre_num} = zeros(N,N);
                            S.PH_data{Fre_num} = zeros(N,N);
                            temp_vari_ma = 1;
                            temp_varj_ma = 1;
                            temp_vari_ph = 1;
                            temp_varj_ph = 1;
                        elseif((rem (rem(data_item_num,Fre_point)+1,2) == 1)&&(rem(data_item_num,Fre_point)!=0))
                            S.MA_data{Fre_num}(temp_varj_ma,temp_vari_ma) = item_data;
                            temp_vari_ma++;
                            if(temp_vari_ma == N+1)
                                temp_vari_ma=1;
                                temp_varj_ma++;
                            endif
                        elseif( (rem(rem(data_item_num,Fre_point)+1,2) ==0)||(rem(data_item_num,Fre_point) == 0))
                            S.PH_data{Fre_num}(temp_varj_ph,temp_vari_ph) = item_data;
                            temp_vari_ph++;
                            if(temp_vari_ph == N+1)
                                temp_vari_ph=1;
                                temp_varj_ph++;
                            endif
                        endif
                     endif
                endfor
            endif
        endwhile
        fprintf("S-para Model data number %d \n",data_item_num);
        if (rem (data_item_num, N*N*2+1 ) != 0 )
            error("S-para:DATA","The data doesn't match ");
        endif
        S.fre_num = data_item_num / (N*N*2+1);
        fprintf("S-para Model frequency point number %d \n",S.fre_num);

        fclose(fid);
        S.status = 1;
    catch
        err = lasterror()
    end_try_catch
end
