%% TP UTILITARIO 2 - COMUNICACIONES - AUDIO 2
addpath(genpath('.'));
clc; close all; clearvars;

%% CREACIÓN DE VARIABLES
[x, fs] = audioread('DBL.wav');

fp=16e3;
Ts=1/fs;
n=0:length(x)-1;

%% ESTUDIO DEL ESPECTRO
[X_s,f] = fft_kit(x,fs);
stemCompleto([-fs/2 fs/2 0 abs(max(X_s))+10], 'f [KHz]', '', 'Espectro de la señal DBL.wav', 20, 'r.', 0.5, f, abs(X_s));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})

%% FILTRO PASABANDA (x2[n])
load('./filtros_audio2/filtroBP_12k-20k.mat');
y=filter(BP,x);
plotCompleto([0 n(end)./fs -1  1], 't[s]', '', 'DBL.wav filtrada (PB 12kHz-20kHz)', 20, 'b',0.5, n./fs, y);

X_BP_s = fft_kit(y, fs);
plotFiltros(BP, f, fs, [-22.05e3 22.05e3 0 1.2], 'Filtro PB 12k-20k');
xticks([-20e3, -12e3, 0, 12e3, 20e3]);xticklabels({'-20', '-12', '0', '12', '20'});xlabel("f[KHz]");

stemCompleto([-fs/2 fs/2 0 abs(max(X_BP_s))+10], 'f [KHz]', '', 'Espectro filtrado (PB 12kHz-20kHz)', 20, 'r.', 0.5, f, abs(X_BP_s));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})

%% MODULACIÓN AUDIO 2
theta = 0;
yd = (cos(2*pi*fp*n*Ts + theta))';
z = y.*yd;
plotCompleto([0 n(end)./fs -1  1], 't[s]', '', 'DBL.wav modulada _{(fp = 16KHz)}', 20, 'b',0.5, n./fs, z);

Z_s = fft_kit(z,fs);
stemCompleto([-fs/2 fs/2 0 (max(abs(Z_s))*1.1)], 'f [KHz]', '', 'DBL.wav modulada _{(fp = 16KHz)}', 20, 'r.', 0.5, f, abs(Z_s));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})

%% Theta variable.
%Definimos funcion "plot_comp_theta" para poder graficar lo calculado en la
%seccion anterior para distintos valores de theta
thetas_pos = [0, pi/2, pi, 3/2*pi];



%PARA VERSIONES DE MATLAB 2018A O MÁS ACTUALES
plot_comp_theta(1,"y[n]|_{\theta = \alpha}",thetas_pos, fp, n, Ts, y);
plot_comp_theta(2,"|Z[k]| |_{\theta = \alpha}",thetas_pos, fp, n, Ts, y);


%PARA VERSIONES DE MATLAB 2017 O PREVIAS
% plot_comp_theta_2017(1,"y[n]|_{\theta = \alpha}",thetas_pos, fp, n, Ts, y);
% plot_comp_theta_2017(2,"|Z[k]| |_{\theta = \alpha}",thetas_pos, fp, n, Ts, y);
%% Filtro Pasabajos final.
% save('./filtros_audio2/filtroLP_8k.mat','LP');
load('./filtros_audio2/filtroLP_8k.mat');
x2=filter(LP,z);

plotFiltros(LP, f, fs, [-22.05e3 22.05e3 0 1.2], 'Filtro LP 8k');
xticks([-22.05e3, -8e3, 0, 8e3, 22.05e3]);xticklabels({'-22.05', '-8', '0', '8', '22.05'});xlabel("f[KHz]");

X2_s = fft_kit(x2,fs);
stemCompleto([-fs/2 fs/2 0 (max(abs(X2_s))*1.1)], 'f [KHz]', '', '|X_2[k]|', 20, 'r.', 0.5, f, abs(X2_s));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})

%sound(x2,fs);