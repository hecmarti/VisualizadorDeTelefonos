#!/bin/bash

# Bucle infinito para buscar dispositivos y reproducir la pantalla en VLC
while true; do
    # Buscar dispositivos conectados
    devices=$(adb devices)

    # Si hay algún dispositivo conectado, iniciar la reproducción en VLC
    if [[ $devices == *"device"* ]]; then
        echo "Dispositivo detectado, iniciando reproducción en MPV"
        adb exec-out screenrecord --output-format=h264 - | mpv -
    else
        echo "Esperando a dispositivo..."
    fi
done
