# 🚀 Instrucciones de Configuración - Crucigrama Flutter

## 📋 Requisitos Previos

1. Flutter SDK instalado (versión 3.9.0 o superior)
2. Cuenta de Supabase (opcional, para modo online)
3. Archivo de música para el fondo (opcional)

---

## 🔧 Configuración Paso a Paso

### 1. Instalar Dependencias

```bash
flutter pub get
```

### 2. Generar Código (Built Value y Riverpod)

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Configurar Supabase (Opcional - para modo online)

#### Paso 1: Crear proyecto en Supabase
1. Ve a [supabase.com](https://supabase.com)
2. Crea un nuevo proyecto
3. Obtén tu URL y Anon Key desde Settings > API

#### Paso 2: Ejecutar el esquema SQL
1. Ve a SQL Editor en tu proyecto de Supabase
2. Copia y ejecuta todo el contenido de `supabase_schema.sql`
3. Esto creará las tablas: `categorias`, `palabras`, `records`

#### Paso 3: Configurar credenciales en el código
1. Abre `lib/providers/supabase_provider.dart`
2. Reemplaza `TU_SUPABASE_URL` con tu URL de Supabase
3. Reemplaza `TU_SUPABASE_ANON_KEY` con tu Anon Key

```dart
const supabaseUrl = 'https://tu-proyecto.supabase.co';
const supabaseKey = 'tu-anon-key-aqui';
```

### 4. Agregar Música de Fondo (Opcional)

1. Crea la carpeta `assets/audio/` si no existe
2. Agrega un archivo de música llamado `music.mp3` en esa carpeta
3. El archivo debe estar en formato MP3

**Nota:** Si no agregas música, la app funcionará normalmente pero sin música de fondo.

### 5. Ejecutar la Aplicación

```bash
flutter run
```

---

## 📱 Funcionalidades Implementadas

### ✅ Modo Online/Offline
- **Offline:** Usa palabras predeterminadas guardadas localmente
- **Online:** Conecta a Supabase para obtener categorías y palabras dinámicas
- La app detecta automáticamente si hay conexión

### ✅ Sistema de Categorías
- **5 categorías offline incluidas:**
  - Dark Rippers (con las palabras de la imagen)
  - Animales
  - Animes
  - Tecnología
  - Deportes
- **Categorías online:** Se obtienen desde Supabase

### ✅ Temporizador
- Inicia automáticamente cuando el crucigrama está listo
- Se detiene cuando se completa el puzzle
- Muestra el tiempo en formato MM:SS

### ✅ Sistema de Records/Leaderboard
- Guarda el tiempo de cada jugador
- Muestra el leaderboard con los mejores tiempos
- Solo funciona en modo online

### ✅ Música de Fondo
- Botón para silenciar/reactivar música
- La preferencia se guarda localmente

---

## 🗄️ Estructura de Base de Datos

### Tabla: categorias
```sql
- id (UUID)
- nombre (VARCHAR)
- descripcion (TEXT)
- activa (BOOLEAN)
```

### Tabla: palabras
```sql
- id (UUID)
- categoria_id (UUID, FK)
- palabra (VARCHAR)
- pista (TEXT)
```

### Tabla: records
```sql
- id (UUID)
- categoria_id (UUID, FK)
- nombre_jugador (VARCHAR)
- tiempo_segundos (INTEGER)
- fecha_completado (TIMESTAMP)
```

---

## 📝 Agregar Palabras en Supabase

Para agregar palabras a una categoría:

```sql
INSERT INTO palabras (categoria_id, palabra, pista)
VALUES (
  (SELECT id FROM categorias WHERE nombre = 'Dark Rippers'),
  'nuevapalabra',
  'Pista para la nueva palabra'
);
```

---

## 🎮 Cómo Usar la App

1. **Inicio:** La app muestra la pantalla de selección de categorías
2. **Seleccionar categoría:** Toca una categoría para comenzar
3. **Generar crucigrama:** Espera a que se genere el crucigrama
4. **Jugar:** Toca las celdas para ver palabras disponibles y seleccionarlas
5. **Completar:** Cuando completes el puzzle, podrás guardar tu tiempo
6. **Ver leaderboard:** Presiona el botón "Ver Leaderboard" para ver los mejores tiempos

---

## 🔍 Solución de Problemas

### Error: "No se pueden generar los archivos .g.dart"
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### La app no se conecta a Supabase
- Verifica que las credenciales estén correctas en `supabase_provider.dart`
- Verifica que el proyecto de Supabase esté activo
- Verifica tu conexión a internet

### La música no suena
- Verifica que el archivo `assets/audio/music.mp3` exista
- Verifica que el archivo esté en formato MP3
- El botón de música debe mostrar el icono de volumen (no silenciado)

### Error al guardar records
- Solo funciona en modo online
- Verifica que Supabase esté configurado correctamente
- Verifica que las políticas RLS estén configuradas

---

## 📦 Archivos Importantes

- `supabase_schema.sql` - Script SQL para crear tablas
- `lib/offline_data.dart` - Palabras predeterminadas offline
- `lib/providers/supabase_provider.dart` - Configuración de Supabase
- `lib/providers/category_provider.dart` - Gestión de categorías
- `lib/providers/timer_provider.dart` - Temporizador
- `lib/providers/records_provider.dart` - Sistema de records
- `lib/providers/audio_provider.dart` - Control de música

---

## 🎯 Próximos Pasos (Opcional)

1. Agregar más palabras a las categorías offline
2. Personalizar el diseño de la UI
3. Agregar más categorías en Supabase
4. Implementar sistema de pistas (clues)
5. Agregar animaciones adicionales

---

## 📞 Soporte

Si encuentras algún problema, verifica:
1. Que todas las dependencias estén instaladas
2. Que el código generado esté actualizado
3. Que Supabase esté configurado (si usas modo online)
4. Los logs de la consola para errores específicos

---

¡Disfruta del juego! 🎉

