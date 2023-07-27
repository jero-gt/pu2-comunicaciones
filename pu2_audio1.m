%TP UTILITARIO 2 - COMUNICACIONES
addpath(genpath('.'));
clc; close all; clearvars;

%% CREACI�N DE VARIABLES
[x, fs] = audioread('DBL.wav');

fp=8e3;
Ts=1/fs;
n=0:length(x)-1;

%% ESTUDIO DEL ESPECTRO
[X_s,f] = fft_kit(x,fs);
stemCompleto([-fs/2 fs/2 0 abs(max(X_s))+10], 'f [KHz]', 'Amplitud', 'Espectro de la se�al de audio', 20, 'r.', 0.5, f, abs(X_s));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})

%% FILTRO PASABANDA (x1[n])
% save('./filtros_audio1/filtroBP_4k-12k.mat','BP');
load('./filtros_audio1/filtroBP_4k-12k.mat');
y=filter(BP,x);
stemCompleto([0 n(end) -1  1], 'n', 'Amplitud', 'y1[n]', 20, 'b.',0.5, n, y);

X_BP_s = fft_kit(y, fs);
stemCompleto([-fs/2 fs/2 0 abs(max(X_BP_s))+10], 'f [KHz]', 'Amplitud', 'Espectro filtrado (pasabanda)', 20, 'r.', 0.5, f, abs(X_BP_s));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})

%% MODULACI�N AUDIO 1
theta=pi/3;
yd=(cos(2*pi*fp*n*Ts + theta))';
z=y.*yd;
stemCompleto([0 n(end) -1  1], 'n', 'Amplitud', 'z1[n]', 20, 'b.',0.5, n, z);

Z_s = fft_kit(z,fs);
stemCompleto([-fs/2 fs/2 0 (max(abs(Z_s))*1.1)], 'f [KHz]', 'Amplitud', '|Z1[k]|', 20, 'r.', 0.5, f, abs(Z_s));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})


% save('./filtros/filtroLP_8k.mat','LP');
load('./filtros_audio1/filtroLP_8k.mat');
x1=filter(LP,z);










