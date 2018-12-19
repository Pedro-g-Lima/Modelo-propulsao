
function Eq_Dif_func(m, g, rho, S, c_l, c_d, miu, a, b, c, h, counter)

% -- VARIAVEIS INPUT -- 
% m - Massa
% g - Aceleracao gravitica
% S - Area da asa
% C_l - Coeficiente de sustentacao (constante)
% C_d - Coeficiente de resistencia aerodinamica (constante)
% miu - Coeficiente de atrito superficial entre as rodas e o alcatrao
% a,b,c - Parametros da regressao T(v(t))
% k - Limite superior do dominio do tempo, em segundos
% h - Faz hold dos graficos
% counter - Cor do grafico


syms v(t)   %m*a(t) = T(v(t)) - D(v(t)) - A(v(t)), com T=thrust, D=Drag e A=Atrito de rolamento
eqn = diff(v,t) == (v*v)*(1/m)*(a+rho*S*0.5*(miu*c_l-c_d))+v*(b/m)+(c/m-miu*g);   
cond = v(0) == 0;                      %Condicao inicial
v(t) = dsolve(eqn,cond);               %Resolucao da eq diferencial
f = int(v);                            %integracao para obter x(t)
g = v(f(t)-f(0));                           %funcao v(x(t))
TOT = vpasolve(f(t)-f(0)==55, t,10);   %Instante de descolagem t, que e solucao de (x(t)=55m)

v=matlabFunction(v);
x=matlabFunction(f-f(0));
g=matlabFunction(g);

vpa(v(t),6)                            %Expressao algebrica v(t)
vpa(x,6)                               %Expressao algebrica x(t)
vpa(TOT,5)                             %Tempo decorrido ate descolagem
vpa(v(TOT),5)                          %Velocidade a descolagem

T=double(TOT);

cstring='rgbcmyk';                     %Cor dos graficos

if h==1                                %logica do switch para manter os graficos
    hold on
else    
    clf
    hold off
end
subplot(2,2,1)                         %plot v(t)
fplot (v, [0 T], cstring(mod(counter,7)+1))
title ('Grafico v(t)')
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)')
grid on

if h==1                                %logica do switch para manter os graficos 
    hold on
end  
subplot(2,2,2)                         %plot x(t)
fplot (x, [0 T], cstring(mod(counter,7)+1))
title ('Grafico x(t)')
xlabel('Tempo (s)');
ylabel('Posição (m)')
grid on

if h==1                                %logica do switch para manter os graficos
    hold on
end 
subplot(2,2,3)                         %plot v(x)
fplot (g, [0 T], cstring(mod(counter,7)+1))
title ('Grafico v(x(t))')
xlabel('Posição (m)');
ylabel('Velocidade (m/s)')
grid on
hold off

end
