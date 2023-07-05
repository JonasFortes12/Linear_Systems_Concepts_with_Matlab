clear 
close all
clc

%Carregando os sinais de áudio
load 'Yn1.mat';
load 'Yn2.mat';
load 'Yn3.mat';
load 'Ys1.mat';
load 'Ys2.mat';
load 'Ys3.mat';

%sampling rate (Hz)
Fs = 44100;

%Gera a transformada de Fourier dos 6 sinais de áudio
FT_Yn1 = fftshift(fft(Yn1));
FT_Yn2 = fftshift(fft(Yn2));
FT_Yn3 = fftshift(fft(Yn3));
FT_Ys1 = fftshift(fft(Ys1));
FT_Ys2 = fftshift(fft(Ys2));
FT_Ys3 = fftshift(fft(Ys3));

%Gera os vetores das abscissas no dominio da frequencias
freq_vec_FT_Yn1 = linspace(-pi,pi,length(FT_Yn1));
freq_vec_FT_Yn2 = linspace(-pi,pi,length(FT_Yn2));
freq_vec_FT_Yn3 = linspace(-pi,pi,length(FT_Yn3));
freq_vec_FT_Ys1 = linspace(-pi,pi,length(FT_Ys1));
freq_vec_FT_Ys2 = linspace(-pi,pi,length(FT_Ys2));
freq_vec_FT_Ys3 = linspace(-pi,pi,length(FT_Ys3));

%Plota o gráfico do módulo da transformada de Fourier do sinal Yn1
figure,plot(freq_vec_FT_Yn1,abs(FT_Yn1),'k');
ylabel('Espectro de magnitude do ruído');
xlabel('Frquencia em Rad/s');
title('Módulo FT sinal Yn1', 'FontSize', 12, 'FontWeight', 'bold')

%Plota o gráfico do módulo da transformada de Fourier do sinal Yn2
figure,plot(freq_vec_FT_Yn2,abs(FT_Yn2),'k');
ylabel('Espectro de magnitude do ruído');
xlabel('Frquencia em Rad/s');
title('Módulo FT sinal Yn2', 'FontSize', 12, 'FontWeight', 'bold')

%Plota o gráfico do módulo da transformada de Fourier do sinal Yn3
figure,plot(freq_vec_FT_Yn3,abs(FT_Yn3),'k');
ylabel('Espectro de magnitude do ruído');
xlabel('Frquencia em Rad/s');
title('Módulo FT sinal Yn3', 'FontSize', 12, 'FontWeight', 'bold')

%Plota o gráfico do módulo da transformada de Fourier do sinal Ys1
figure,plot(freq_vec_FT_Ys1,abs(FT_Ys1),'k');
ylabel('Espectro de magnitude do ruído');
xlabel('Frquencia em Rad/s');
title('Módulo FT sinal Ys1', 'FontSize', 12, 'FontWeight', 'bold')

%Plota o gráfico do módulo da transformada de Fourier do sinal Ys2
figure,plot(freq_vec_FT_Ys2,abs(FT_Ys2),'k');
ylabel('Espectro de magnitude do ruído');
xlabel('Frquencia em Rad/s');
title('Módulo FT sinal Ys2', 'FontSize', 12, 'FontWeight', 'bold')

%Plota o gráfico do módulo da transformada de Fourier do sinal Ys3
figure,plot(freq_vec_FT_Yn3,abs(FT_Ys3),'k');
ylabel('Espectro de magnitude do ruído');
xlabel('Frquencia em Rad/s');
title('Módulo FT sinal Ys3', 'FontSize', 12, 'FontWeight', 'bold')

%Calcula a soma dos módulos da FT para as baixas frequências dos 6 sinais
FourierLowFreq_Yn1 = sum(abs(FT_Yn1(28344:35144)));
FourierLowFreq_Yn2 = sum(abs(FT_Yn2(28344:35144)));
FourierLowFreq_Yn3 = sum(abs(FT_Yn3(28344:35144)));
FourierLowFreq_Ys1 = sum(abs(FT_Ys1(28344:35144)));
FourierLowFreq_Ys2 = sum(abs(FT_Ys2(28344:35144)));
FourierLowFreq_Ys3 = sum(abs(FT_Ys3(28344:35144)));

%Calcula a soma dos módulos da FT para as altas frequências dos 6 sinais
FourierHighFreq_Yn1 = sum(abs(FT_Yn1(35144:end))) + sum(abs(FT_Yn1(1:28344)));
FourierHighFreq_Yn2 = sum(abs(FT_Yn2(35144:end))) + sum(abs(FT_Yn2(1:28344)));
FourierHighFreq_Yn3 = sum(abs(FT_Yn3(35144:end))) + sum(abs(FT_Yn3(1:28344)));
FourierHighFreq_Ys1 = sum(abs(FT_Ys1(35144:end))) + sum(abs(FT_Ys1(1:28344)));
FourierHighFreq_Ys2 = sum(abs(FT_Ys2(35144:end))) + sum(abs(FT_Ys2(1:28344)));
FourierHighFreq_Ys3 = sum(abs(FT_Ys3(35144:end))) + sum(abs(FT_Ys3(1:28344)));

%Calcula a razão entre soma dos módulos da FT para as altas e baixas frequências
% dos 6 sinais
reason_Yn1 = FourierHighFreq_Yn1 / FourierLowFreq_Yn1;
reason_Yn2 = FourierHighFreq_Yn2 / FourierLowFreq_Yn2;
reason_Yn3 = FourierHighFreq_Yn3 / FourierLowFreq_Yn3;
reason_Ys1 = FourierHighFreq_Ys1 / FourierLowFreq_Ys1;
reason_Ys2 = FourierHighFreq_Ys2 / FourierLowFreq_Ys2;
reason_Ys3 = FourierHighFreq_Ys3 / FourierLowFreq_Ys3;

%Calcula a média dos valores de razão dos 6 sinais
reasonAverage = (reason_Yn1 + reason_Yn2 + reason_Yn3 + reason_Ys1 + reason_Ys2 + reason_Ys3)/6;

%Compara os valores de razão dos 6 sinais com a média das razões
disp("Média das razões dos 6 sinais:");
disp(reasonAverage);

disp("Razões dos sinais 'NÂO': ");
disp(reason_Yn1);
disp(reason_Yn2);
disp(reason_Yn3);

disp("Razões dos sinais 'SIM': ");
disp(reason_Ys1);
disp(reason_Ys2);
disp(reason_Ys3);






















