%% TP UTILITARIO 2 - COMUNICACIONES - AUDIO 1
addpath(genpath('.'));
clc; close all; clearvars;

%% CREACIÓN DE VARIABLES
[x, fs] = audioread('DBL.wav');

fp=8e3;
Ts=1/fs;
n=0:length(x)-1;

%% ESTUDIO DEL ESPECTRO
[X_s,f] = fft_kit(x,fs);
stemCompleto([-fs/2 fs/2 0 abs(max(X_s))+10], 'f [KHz]', '', 'Espectro de la señal DBL.wav', 20, 'r.', 0.5, f, abs(X_s));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})

%% FILTRO PASABANDA (x1[n])
load('./filtros_audio1/filtroBP_4k-12k.mat');
plotFiltros(BP, f, fs, [-fs/2 fs/2 0 1.5], "Filtro PB 4KHz-12KHz")
y=filter(BP,x);
plotCompleto([0 n(end)./fs -1  1], 't[s]', '', 'DBL.wav filtrada (PB 4kHz-12kHz)', 20, 'b',0.5, n./fs, y);

X_BP_s = fft_kit(y, fs);
stemCompleto([-fs/2 fs/2 0 abs(max(X_BP_s))+10], 'f [KHz]', '', 'Espectro filtrado (PB 4kHz-12kHz)', 20, 'r.', 0.5, f, abs(X_BP_s));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})

%% MODULACIÓN AUDIO 1
theta = pi/2;
yd = (cos(2*pi*fp*n*Ts + theta))';
z = y.*yd;
plotCompleto([0 n(end)./fs -1  1], 't[s]', '', 'DBL.wav modulada _{(fp = 8KHz)}', 20, 'b',0.5, n./fs, z);

Z_s = fft_kit(z,fs);
stemCompleto([-fs/2 fs/2 0 (max(abs(Z_s))*1.1)], 'f [KHz]', '', 'DBL.wav modulada _{(fp = 8KHz)}', 20, 'r.', 0.5, f, abs(Z_s));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})

%% Theta variable.
%Definimos funcion "plot_comp_theta" para poder graficar lo calculado en la
%seccion anterior para distintos valores de theta
thetas_pos = [0, pi/2, pi, 3/2*pi];

plot_comp_theta(1,"y[n]|_{\theta = \alpha}",thetas_pos, fp, n, Ts, y);
plot_comp_theta(2,"|Z[k]| |_{\theta = \alpha}",thetas_pos, fp, n, Ts, y);

%% Filtro Pasabajos final.
% save('./filtros/filtroLP_8k.mat','LP');
load('./filtros_audio1/filtroLP_8k.mat');
plotFiltros(LP, f, fs, [-fs/2 fs/2 0 1.5], 'Filtro LP 8KHz')
xticks([-22.05e3, -8e3, 0, 8e3, 22.05e3]);xticklabels({'-22.05', '-8', '0', '8', '22.05'});xlabel("f[KHz]");


x1=filter(LP,z);

X1_s = fft_kit(x1,fs);
stemCompleto([-fs/2 fs/2 0 (max(abs(X1_s))*1.1)], 'f [KHz]', '', '|X_1[k]|', 20, 'r.', 0.5, f, abs(X1_s));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})

sound(x1,fs);