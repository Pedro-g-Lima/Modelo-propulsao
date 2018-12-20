function [ ] = MAIN(  )
    
    op = menu('ESCOLHA A FOMTE ENERGÉTICA A ANALISAR', ...
            'Fonte de Tensão', ...
            'Bateria Turnigy Bolt 4000mAh',...
            'Futuras coisas', 'Cancelar');
    switch op
        case 1
            energia = 1;
        case 2 
            energia = 2;
        case 3
            energia = 3;
        case 4
            energia = 0;
    end
    
    if energia ~= 0
        Eq_Dif_App
    end
        
end

