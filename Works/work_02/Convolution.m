
%Gerando os valores de n:
n = 1:200;

%Gerando sinal x[n]:
x = sin(0.2*pi*n) + 1.5*sin(0.5*pi*n) + 0.5*sin(0.8*pi*n);
plot(x);
title('Sinal x[n]', 'FontSize', 12, 'FontWeight', 'bold')


%Gerando resposta ao impulso h[n]:
figure;
h = zeros(1, length(n)); 
for i=n
    if i>=0 && i<=30 && i~=15
        h(i) = sin(0.3*pi*(i-15)/(pi*(i-15)));
    elseif i==15
        h(i) = 0.3;
    end
end
plot(h);
title('Resposta ao impulso h[n]', 'FontSize', 12, 'FontWeight', 'bold');

%Filtrando o sinal (convolução):
figure();
filterSignal = conv(x,h);
plot(filterSignal);
title('Sinal Filtrado', 'FontSize', 12, 'FontWeight', 'bold')







