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
