# 🎵 Música de Fondo

Coloca aquí tu archivo de música de fondo para la aplicación de crucigramas.

## 📁 Ubicación del archivo:

```
crucigrama/
├── assets/
│   ├── audio/
│   │   └── music.mp3  ← COLOCA TU ARCHIVO AQUÍ
│   └── words.txt
└── pubspec.yaml
```

## ✅ Requisitos:

- **Nombre del archivo:** `music.mp3` (debe llamarse exactamente así)
- **Formato:** MP3 (recomendado)
- **Tamaño recomendado:** < 5MB para no afectar el tamaño de la app
- **Ubicación:** `assets/audio/music.mp3`

## 📝 Instrucciones paso a paso:

1. **Obtén un archivo de música MP3** (puede ser cualquier música de fondo que te guste)

2. **Renombra el archivo** a `music.mp3` (si tiene otro nombre)

3. **Copia el archivo** a esta carpeta:
   ```
   C:\crucigrama\assets\audio\music.mp3
   ```

4. **Verifica que el archivo esté en la ubicación correcta:**
   - La ruta completa debe ser: `assets/audio/music.mp3`
   - No debe estar en `assets/music.mp3` (solo en la carpeta `audio`)

5. **¡Listo!** La música se reproducirá automáticamente cuando inicies la app

## 🎮 Funcionalidades:

- ✅ La música se inicia automáticamente al abrir la app
- ✅ Botón de volumen en la barra superior para silenciar/reactivar
- ✅ El estado de mute se guarda (si silencias, se mantiene al cerrar/abrir la app)

## ⚠️ Nota importante:

- Si no agregas el archivo `music.mp3`, la app funcionará normalmente pero mostrará un error en la consola (no afecta la funcionalidad)
- El archivo debe llamarse exactamente `music.mp3` (en minúsculas)
- Si usas otro formato (WAV, OGG), también funciona, pero asegúrate de cambiar el nombre en el código

## 🔧 Solución de problemas:

**Si la música no suena:**
1. Verifica que el archivo se llame `music.mp3`
2. Verifica que esté en `assets/audio/` (no en `assets/`)
3. Ejecuta `flutter clean` y luego `flutter pub get`
4. Reinicia la app completamente

