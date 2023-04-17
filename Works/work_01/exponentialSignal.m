% Questão 04)

%Gerando os valores de n:
n = 0:40;

%Definindo a função x[n]:
Xn = (1/4).^n;

%Plotando o  gráfico:
stem(n, Xn);

%Mantendo o mesmo gráfico
hold on;

% Questão 05)

%Espelhando o sinal
stem(-n, Xn);

%Deslocando o sinal em t0 = -5
stem(n-5, Xn);

%Adicionando legendas:
legend('x[n]','w[n] = x[-n]', 'g[n] = x[n+5]');



