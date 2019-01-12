function [zero, primeiro_100,cem] = FUNC_dados_uteis( file_name )

    perc_throttle = xlsread(file_name,1,'C:C');
    cem=0;
    zero=0;
    primeiro_zero = 1;
    primeiro_100=0;
    n = length(perc_throttle);
    for k=1:n 
        if perc_throttle (k) ~= 0    %quando houver o primeiro valor diferente de 0, já não vai contar mais nenhum
            primeiro_zero = 0;
        end
        if perc_throttle (k) == 0 && primeiro_zero == 1
            zero = zero + 1;      %número de dados a throttle 0 - inicio
        end
        if perc_throttle (k) >= 100    %perguntar
            cem = cem + 1;        %numero de dados a throttle 100%
            if primeiro_100==0    
                primeiro_100=k; 
            end
        end
    end  
end

