function [a, b, c] = Regressao(energia)

    fonte = ["escoamento_0","escoamento_7_5","escoamento_8","escoamento_9","escoamento_9_5", ...
             "escoamento_10","escoamento_11","escoamento_11_5","escoamento_13","escoamento_13_5", ...
             "escoamento_14","escoamento_14_5","escoamento_15","escoamento_16"];
         
    turnigy_4 = ["T4_escoamento_0","T4_escoamento_7","T4_escoamento_8_5","T4_escoamento_10",...
                 "T4_escoamento_12","T4_escoamento_13","T4_escoamento_14_5"];

    vel = zeros(1, 14); 
    thrust = zeros(1, 14);
    
    switch energia
        case 1
            fname = fonte;
        case 2 
            fname = turnigy_4;
    end
    
    for i=1:length(fname)
    [vel(i), thrust(i)] = ler_dados(fname(i));
    ficheiros_lidos = i
    end 
    
    switch energia
        case 1
            p = polyfit(vel,thrust,1);
            a = 0;
            b = p(1);
            c = p(2);
        case 2 
            p = polyfit(vel,thrust,2);
            a = p(1);
            b = p(2);
            c = p(3);       
    end
end

