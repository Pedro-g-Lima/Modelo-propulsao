function [velocidade_mediana, thrust_efetivo] = FUNC_ler_dados( file_name )
  
    [zero, primeiro_100, cem] = FUNC_dados_uteis( file_name );
   
    %Leitura dos valores de DRAG - Thrust a 0%, apenas no inicio
    str_drag_inicial = sprintf('H2:H%d',zero+1);
    drag_inicial = 9.81 * xlsread(file_name,1, str_drag_inicial);
    
    %Leitura dos valores de thrust > 100%
    str_thrust_100 = sprintf('H%d:H%d',primeiro_100, primeiro_100 + cem);
    thrust_100 = 9.81 * xlsread(file_name,1, str_thrust_100);
    
    %Leitura dos dados de velocidade de escoamento a 100% de thrust
    str_veloc_100 = sprintf('J%d:J%d',primeiro_100, primeiro_100 + cem);
    escoamento_100 = xlsread(file_name,1, str_veloc_100);
    
    %Valores médios/medianos  
    drag_medio = mean(drag_inicial);
    thrust_mediano=median(thrust_100); 
    velocidade_mediana = median(escoamento_100);
    
    %Valores de thrust efetivo, sem o drag
    thrust_efetivo = thrust_mediano - drag_medio;  
end

