function Eq_Dif_func(m, g, p, S, c_l, c_d, miu, a, b, c, k, h, counter)

syms v(t)   %m*a(t) = T(v(t)) - D(v(t)) - A(v(t)), com T=thrust, D=Drag e A=Atrito de rolamento
eqn = diff(v,t) == (a*v*v+b*v+c - c_d*0.5*p*S*v*v - miu*(m*g-c_l*0.5*p*S*v*v))/m;   
cond = v(0) == 0;                      %Condicao inicial
v(t) = dsolve(eqn,cond);               %Resolucao da eq diferencial
f = int(v);                            %integracao para obter x(t)
f = f-f(0);                            %para o grafico ter x(0)=0
g = v(f(t));                           %funcao V(X(t))
v=matlabFunction(v);
f=matlabFunction(f);
g=matlabFunction(g);


cstring='rgbcmyk';                            %cor dos graficos
%TESTE

if h==1                                       %logica do switch para manter os graficos
    hold on
else    
    clf
    hold off
end
subplot(2,2,1)                                %plot v(t)
fplot (v, [0 k], cstring(mod(counter,7)+1))
title ('Grafico v(t)')
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)')
grid on

if h==1                                        %logica do switch para manter os graficos 
    hold on
end  
subplot(2,2,2)                                 %plot x(t)
fplot (f, [0 k], cstring(mod(counter,7)+1))
title ('Grafico x(t)')
xlabel('Tempo (s)');
ylabel('Posição (m)')
grid on

if h==1                                      %logica do switch para manter os graficos
    hold on
end 
subplot(2,2,3)                               %plot v(x(t))
fplot (g, [0 k], cstring(mod(counter,7)+1))
title ('Grafico v(x(t))')
xlabel('Posição (m)');
ylabel('Velocidade (m/s)')
grid on
hold off

end





