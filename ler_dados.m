function [velocidade_mediana, thrust_efetivo] = ler_dados( file_name )
  
    [zero, primeiro_100, cem] = dados_uteis( file_name );
   
    str_drag_inicial = sprintf('H2:H%d',zero+1);
    drag_inicial = xlsread(file_name,1, str_drag_inicial);
    
    str_thrust_100 = sprintf('H%d:H%d',primeiro_100, primeiro_100 + cem);
    thrust_100 = xlsread(file_name,1, str_thrust_100);
    
    str_veloc_100 = sprintf('J%d:J%d',primeiro_100, primeiro_100 + cem);
    escoamento_100 = xlsread(file_name,1, str_veloc_100);
    
    drag_medio = mean(drag_inicial);
    thrust_mediano=median(thrust_100); 
   
    thrust_efetivo = thrust_mediano - drag_medio;
    velocidade_mediana = median(escoamento_100);    
end

