% Jonas Fortes - 494513
clear all
clc
close all

%Gerando o sinal x[n]:
x = zeros(1,20);
x(1:6) = 1; % Atribui 1 aos 6 primeiros valores n=(0,...,5) 
plot(x, 'b');

%Filtrando o sinal x[n] usando a equaçao de diferenças:
B = [1 1]; %Coeficientes das entradas
A = [1 -1]; %Coeficientes das saídas
y = filter(B,A,x);
hold on;
plot(y,'r');

legend('Sinal de Entrada', 'Sinal Filtrado');
title('Filtragem x[n] pela equação de diferenças', 'FontSize', 12, 'FontWeight', 'bold')