# Práctica con Utilitario 2 - Opción D: Comunicaciones
Proyecto de Análisis de Encefalograma y Electrocardiograma en Frecuencia

![Imagen de encabezado](ruta_de_la_imagen.png)

## Descripción del Proyecto

Este proyecto tiene como objetivo realizar el análisis en frecuencia de señales de encefalograma (EEG) y electrocardiograma (ECG) utilizando MATLAB. La idea principal es analizar el espectro de frecuencia de estas señales, aplicar diferentes filtros y realizar diversos análisis para obtener información valiosa sobre el comportamiento cerebral y cardíaco.

## Requisitos Previos

- MATLAB ( version compatible con fdatool).

## Estructura del Proyecto

El repositorio está organizado de la siguiente manera:

```
pu2-comunicaciones/
│
├── filtros/
│   ├── filtroBP_8-13.fda
│   ├── filtroBP_8-13.mat
│   ├── filtroBS-49-53.fda
│   ├── filtroBS-49-53.mat
│   ├── filtroLP-100.fda
│   └── filtroLP-100.mat
├── funciones/
│   └── funciones/
├── pu2_bio_senales.m
├── pu2_eeg.m
└── README.md
```

- **datos/**: En esta carpeta se almacenan los archivos .mat que contienen las señales de encefalograma y electrocardiograma utilizados en el análisis.

- **filtros/**: Esta carpeta contiene los filtros realizados con la herramienta fdatool de MATLAB y sus correspondientes sesiones que los generan.

- **funciones/**: Esta carpeta contiene diversas herrmientas creadas en MATLAB por los autores para trabajar de forma mas comoda a lo largo de los scripts principales.

## Uso del Proyecto

1. Clona este repositorio en tu máquina local:

   ```
   git clone https://gitlab.com/jerogt/pu2-salud.git
   ```

3. Ejecuta los scripts de MATLAB ubicados en el directorio principal para evitar errores de ejecución.

## Autores:

- Nombre: Jeronimo Gomez Tantarelli
- Correo electrónico: jeronimogomeztantarelli@yahoo.com.ar

- Nombre: Ignacio Brittez
- Correo electrónico: ibrittez3@alu.ing.unlp.edu.ar
