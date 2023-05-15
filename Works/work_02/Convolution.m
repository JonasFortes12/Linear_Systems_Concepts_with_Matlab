
%Gerando os valores de n:
n = 1:200;

%Gerando sinal x(n):
x = sin(0.2*pi*n) + 1.5*sin(0.5*pi*n) + 0.5*sin(0.8*pi*n);
plot(x);
title('Sinal x[n]', 'FontSize', 12, 'FontWeight', 'bold')


%Gerando resposta ao impulso h(n):
figure;
h = zeros(1, length(n)); 
for i=n
    if i>=0 && i<=30 && i~=15
        h(i) = sin(0.3*pi*(i-15))/(pi*(i-15));
    elseif i==15
        h(i) = 0.3;
    end
end
plot(h);
title('Resposta ao impulso h[n]', 'FontSize', 12, 'FontWeight', 'bold');

%Filtrando o sinal (convolução):
figure;
filteredSignal = conv(x,h);
plot(filteredSignal);
title('Sinal Filtrado', 'FontSize', 12, 'FontWeight', 'bold')

%   Questão 4:
%   Observa-se que a convolução entre um sinal de entrada x(n) e a 
%  resposta ao impulso h(n) gerou um sinal periódico com amplitude 
%  constante entre aproximandamente 1 e -1, mesmo que os sinais x(n) e h(n)
%  tenham uma amplitude variada. Isso ocorreu pela operação de
%  multiplicação dos sinais ponto a ponto, de modo que cada produto
%  resultasse em uma amplitude entre 1 e -1 como é observado no sinal
%  filtrado. Dessa forma, ao conhecer o comportamento do sistema pela resposta
%  ao impulso h(n), é possível inferir uma entrada x(n) tal que a saída do
%  sistema seja uma onda de amplitude constante. Ou seja, o sistema filtra
%  um sinal de entrada deixando-o com o comportamento observado na figura
%  do sinal filtrado.
%







