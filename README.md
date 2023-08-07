# Práctica con Utilitario 2 - Opción D: Comunicaciones
Proyecto de Análisis de Encefalograma y Electrocardiograma en Frecuencia

![Imagen de encabezado](./figuras/encabezado.jpg)

## Descripción del Proyecto

Este proyecto tiene como objetivo realizar el análisis en frecuencia de señales de encefalograma (EEG) y electrocardiograma (ECG) utilizando MATLAB. La idea principal es analizar el espectro de frecuencia de estas señales, aplicar diferentes filtros y realizar diversos análisis para obtener información valiosa sobre el comportamiento cerebral y cardíaco.

## Requisitos Previos

- MATLAB ( version compatible con fdatool).

## Estructura del Proyecto:

El repositorio está organizado de la siguiente manera:

```
pu2-comunicaciones/
│
├── Archivos_PU2d/
│   └── DBL.wav
├── filtros_audio1/
│   ├── filtroBP_4k-12k.fda
│   ├── filtroBP_4k-12k.mat
│   ├── filtroLP_8k.fda
│   └── filtroLP_8k.mat
├── filtros_audio2/
│   ├── filtroBP_12k-20k.fda
│   ├── filtroBP_12k-20k.mat
│   ├── filtroLP_8k.fda
│   └── filtroLP_8k.mat
├── funciones/
│   ├── utilidades/
│   └── plot_comp_theta.m
├── pu2_audio1.m
├── pu2_audio2.m
└── README.md
```

- **Archivos_PU2d/**: En esta carpeta se almacenan los archivos .mat que contienen las señales de encefalograma y electrocardiograma utilizados en el análisis.

- **filtros_audiox/**: Esta carpeta contiene los filtros realizados con la herramienta fdatool de MATLAB y sus correspondientes sesiones que los generan.

- **funciones/**: Esta carpeta contiene diversas herrmientas creadas en MATLAB por los autores para trabajar de forma mas comoda a lo largo de los scripts principales.

## Uso del Proyecto

1. Clona este repositorio en tu máquina local:

   ```
   git clone https://gitlab.com/jerogt/pu2-comunicaciones.git
   ```

3. Ejecuta los scripts de MATLAB ubicados en el directorio principal para evitar errores de ejecución.

## Autores:

- Nombre: Jeronimo Gomez Tantarelli
- Correo electrónico: jeronimogomeztantarelli@yahoo.com.ar

- Nombre: Ignacio Brittez
- Correo electrónico: ibrittez3@alu.ing.unlp.edu.ar
