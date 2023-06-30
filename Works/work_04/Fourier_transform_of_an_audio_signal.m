clear all
close all
clc

%carrega o sinal sonoro 
load chirp.mat;

%reproduz o som
sound(y, Fs);

%plota o sinal y
figure, plot(y);
title('Sinal de áudio', 'FontSize', 12, 'FontWeight', 'bold')

%Gera a transformada de Fourier do Sinal y(som chirp.mat)
Y = fftshift(fft(y));

%Gera o vetor do domínio da frequencias do Sinal
freq_vec = linspace(-pi,pi,length(y));

%Gera o módulo da transformada de Fourier
Y_module = abs(Y);

%Plotando o gráfico do módulo da transformada de Fourier
figure,plot(freq_vec,Y_module,'k')
ylabel('Espectro de magnitude do sinal')
xlabel('Frquencia em Rad/s')
title('Módulo FT do sinal de áudio', 'FontSize', 12, 'FontWeight', 'bold')

%Variância do ruído
noise_variance = sqrt(0.05);

%Tamanho do sinal N
N = length(y);

%Gera um ruído branco gaussiano
noise = randn(N, 1) * noise_variance;

%Reproduz o ruído
sound(noise, Fs);

%Plota o ruído
figure, plot(noise);
title('Ruído', 'FontSize', 12, 'FontWeight', 'bold')

%Gera a transformada de Fourier do Sinal ruido
NOISE = fftshift(fft(noise));

%Gera o vetor do dominio da frequencias do Sinal ruido
noise_freq_vec = linspace(-pi,pi,length(noise));

%Plotando o gráfico do módulo da transformada de Fourier do ruído
figure,plot(noise_freq_vec,abs(NOISE),'k');
ylabel('Espectro de magnitude do ruído');
xlabel('Frquencia em Rad/s');
title('Módulo FT do ruído', 'FontSize', 12, 'FontWeight', 'bold')


%Adiciona o ruído ao sinal de áudio e reproduz:
noisy_signal = y + noise;
sound(noisy_signal, Fs);

%Gera o gráfico do sinal ruidoso
figure,plot(noisy_signal,'b');
title('Sinal ruidoso', 'FontSize', 12, 'FontWeight', 'bold')

%Gera a transformada de Fourier do Sinal ruidoso
NOISY_SIGNAL = fftshift(fft(noisy_signal));

%Gera o vetor do dominio da frequencias do Sinal ruido
noisy_signal_freq_vec = linspace(-pi,pi,length(noisy_signal));

%Plotando o gráfico do módulo da transformada de Fourier do ruído
figure,plot(noise_freq_vec,abs(NOISY_SIGNAL),'k');
ylabel('Espectro de magnitude do sinal ruidoso');
xlabel('Frquencia em Rad/s');
title('Módulo FT do sinal ruidoso', 'FontSize', 12, 'FontWeight', 'bold')




