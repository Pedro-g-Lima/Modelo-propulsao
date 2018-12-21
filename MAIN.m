function [ ] = MAIN(  )
    %Menu de escolha da fonte de energia a analisar os dados
    op = menu('ESCOLHA A FOMTE ENERGÉTICA A ANALISAR', ...
            'Fonte de Tensão', ...
            'Bateria Turnigy Graphene 3S 4Ah',...
            'Futuras coisas', 'Cancelar');
    switch op
        case 1
            energia = 1;        %Fonte de Tensão
        case 2 
            energia = 2;        %Turnigy Graphene 3S 4Ah
        case 3
            energia = 3;
        case 4
            energia = 0;
    end
    
    if energia ~= 0
        Eq_Dif_App           %Aplicação
    end
        
end

