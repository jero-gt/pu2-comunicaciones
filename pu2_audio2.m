%TP UTILITARIO 2 - COMUNICACIONES
addpath(genpath('.'));
clc; close all; clearvars;

%% CREACIÓN DE VARIABLES
[x, fs] = audioread('DBL.wav');

fp=16e3;
Ts=1/fs;
n=0:length(x)-1;

%% ESTUDIO DEL ESPECTRO
[X_s,f] = fft_kit(x,fs);
stemCompleto([-fs/2 fs/2 0 abs(max(X_s))+10], 'f [KHz]', 'Amplitud', 'Espectro de la señal de audio', 20, 'r.', 0.5, f, abs(X_s));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})

%% FILTRO PASABANDA (x1[n])
% save('./filtros/filtroBP_4k-12k.mat','BP1');
load('./filtros/filtroBP_4k-12k.mat');
y1=filter(BP1,x);
stemCompleto([0 n(end) -1  1], 'n', 'Amplitud', 'y1[n]', 20, 'b.',0.5, n, y1);

X_BP_s = fft_kit(y1, fs);
stemCompleto([-fs/2 fs/2 0 abs(max(X_BP_s))+10], 'f [KHz]', 'Amplitud', 'Espectro filtrado (pasabanda)', 20, 'r.', 0.5, f, abs(X_BP_s));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})

%% MODULACIÓN AUDIO 1
theta=pi/3;
yd=(cos(2*pi*fp*n*Ts + theta))';
z1=y1.*yd;
stemCompleto([0 n(end) -1  1], 'n', 'Amplitud', 'z1[n]', 20, 'b.',0.5, n, z1);

Z1_s = fft_kit(z1,fs);
stemCompleto([-fs/2 fs/2 0 (max(abs(Z1_s))*1.1)], 'f [KHz]', 'Amplitud', '|Z1[k]|', 20, 'r.', 0.5, f, abs(Z1_s));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})


% save('./filtros/filtroLP_8k.mat','LP');
load('./filtros/filtroLP_8k.mat');
x1=filter(LP,z1);
