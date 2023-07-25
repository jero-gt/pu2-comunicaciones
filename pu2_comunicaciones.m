%TP UTILITARIO 2 - COMUNICACIONES
addpath(genpath('.'));
clc; close all; clearvars;

%% CREACIÓN DE VARIABLES
[x, fs] = audioread('DBL.wav');

fp1=8e3;
fp2=16e3;
Ts=1/fs;
n=0:length(x)-1;

%% ESTUDIO DEL ESPECTRO
[X,X_shift,f] = fft_kit(x,fs);
stemCompleto([-fs/2 fs/2 0 abs(max(X))+10], 'f [KHz]', 'Amplitud', 'Espectro de la señal de audio', 20, 'r.', 0.5, f, abs(X_shift));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})

%% FILTRO PASABANDA (x1[n])
%save('./filtros/filtroBP_4k-12k.mat','BP');
load('./filtros/filtroBP_4k-12k.mat');
y1=filter(BP,x);
stemCompleto([0 n(end) -1  1], 'n', 'Amplitud', 'y1[n]', 20, 'b.',0.5, n, y1);

[X_BP,X_BP_shift]=fft_kit(y1, fs);
stemCompleto([-fs/2 fs/2 0 abs(max(X_BP))+10], 'f [KHz]', 'Amplitud', 'Espectro filtrado (pasabanda)', 20, 'r.', 0.5, f, abs(X_BP_shift));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})

%% -
theta=7*pi/4;
yd=(cos(2*pi*fp1*n*Ts + theta))';
z1=y1.*yd;
stemCompleto([0 n(end) -1  1], 'n', 'Amplitud', 'z1[n]', 20, 'b.',0.5, n, z1);

[Z1,Z1_shift,~]=fft_kit(z1,fs);
stemCompleto([-fs/2 fs/2 0 (max(abs(Z1))*1.1)], 'f [KHz]', 'Amplitud', '|Z1[k]|', 20, 'r.', 0.5, f, abs(Z1_shift));
xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})


% save('./filtros/filtroLP_8k.mat','LP');
load('./filtros/filtroLP_8k.mat');
x1=filter(LP,z1);
sound(x1,fs);


