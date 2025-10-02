# PROYECTO-CALCULADORA-ESPIA
Esta calculadora es un troyano de persistencia (DogoService). Al ejecutarse, establece una Reverse Shell con tu servidor (LHOST) e intercepta comandos.  Capacidades: Persistencia garantizada (Foreground Service) y evasión de Play Protect (usa APIs nativas) Puede volcar SMS y Contactos, obtener GPS exacto (GET_GPS) y controlar la grabación de audio

![image_alt](https://github.com/DogoTalei/PROYECTO-CALCULADORA-ESPIA/blob/737645325c8ab4d9f3827a69d4af79ff3a05f683/Gemini_Generated_Image_knicxvknicxvknic.png)

Proyecto DogoService: Auditoría de Seguridad Móvil (Reverse Shell Persistente) 🇪🇹
¡ADVERTENCIA: Este proyecto ha sido creado EXCLUSIVAMENTE con fines Éticos y Educativos, enfocado en la investigación de seguridad ofensiva (Red Teaming) y la defensa de sistemas Android.

Este repositorio contiene la implementación avanzada de un implante de Shell Inversa (Reverse Shell) bajo la apariencia de una aplicación de calculadora. El objetivo principal de esta auditoría es demostrar y documentar la capacidad de persistencia y exfiltración de datos sensibles en entornos modernos de Android.

⚙️ Funcionalidades Clave Demostradas:
Persistencia Garantizada: Utiliza un Foreground Service (DogoService) para asegurar la conexión continua y la reconexión automática (cada 10 segundos), eludiendo los mecanismos de terminación de procesos de Android.

Vigilancia y Volcado de Datos: Control total sobre las funciones más críticas del dispositivo mediante comandos directos desde la shell:

GPS Exacto: Obtención de coordenadas geográficas precisas (GET_GPS).

Audio Ambiental: Grabación y exfiltración de audio (START_MIC / STOP_MIC).

Exfiltración de Datos Personales: Volcado de Contactos (DUMP_CONTACTS) y SMS (DUMP_SMS).

Evasión: Implementación de técnicas que permiten evadir la detección estática de Google Play Protect al basarse exclusivamente en APIs nativas y legítimas del sistema Android.

¡Bajo ninguna circunstancia este código debe ser utilizado contra sistemas o dispositivos que no sean de tu propiedad y bajo tu control!

Descarga	Ve al sitio oficial de Android Studio. La página detectará automáticamente tu sistema operativo (Windows, macOS o Linux).
Enlace	https://developer.android.com/studio?hl=es-419
Instalación	1. Ejecuta el archivo descargado (.exe o .dmg). 2. Sigue el Asistente de Configuración. Asegúrate de instalar el SDK de Android, el Android Virtual Device (AVD) y el Android SDK Platform-Tools (ADB). 3. El proceso te guiará para descargar el SDK más reciente (idealmente API 34 o superior).


Descarga	Ve al sitio oficial de Visual Studio Code. Es un instalador pequeño y rápido.
Enlace	https://code.visualstudio.com/download
Instalación	1. Ejecuta el instalador. 2. Se recomienda aceptar la opción de "Abrir con Code" al hacer clic derecho en archivos (útil para revisar tus archivos Java).
Extensiones Clave	Una vez instalado, busca e instala las extensiones de Java y Gradle dentro del Marketplace de VS Code para que pueda reconocer y resaltar la sintaxis de tu proyecto.

Instrucciones de Uso: Script Unificado de Exfiltración
El script está diseñado para correr en una sola terminal, gestionando el Listener de Control (4444) y el Listener de Recepción de Archivos (5555) simultáneamente.

Antes de ejecutarlo por primera vez, dale permisos de ejecución
chmod +x receptor.sh

Abre tu terminal en la carpeta donde tienes el script y ejecútalo. Déjalo correr en primer plano.
./receptor.sh

Flujo de Control y Grabación (Puerto 4444)
Una vez que el APK se conecta y la sesión está activa, usa estos comandos en la misma terminal, recordando presionar Enter dos veces después de cada comando para asegurar que la raw shell lo procese:

Paso	Comando	Propósito
Inicio de Grabación	START_MIC [Enter][Enter]	Activa la función MediaRecorder de Android.
Tiempo de Espera	Esperar 10-20 segundos.	Captura el audio ambiental.
Detener y Guardar	STOP_MIC [Enter][Enter]	Detiene la grabación y guarda el archivo .mp4 en el dispositivo Android.
Volcar Contactos	DUMP_CONTACTS [Enter][Enter]	Imprime la lista de contactos en la pantalla de la terminal.
Volcar SMS	DUMP_SMS [Enter][Enter]	Imprime el registro de mensajes (entrada/salida) en la pantalla.
Obtener Ubicación	GET_GPS [Enter][Enter]	Muestra las coordenadas GPS exactas (Lat/Lon)
