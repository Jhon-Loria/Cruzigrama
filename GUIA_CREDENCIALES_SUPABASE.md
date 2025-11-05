# 🔑 Guía para Configurar tus Credenciales de Supabase

## 📝 Pasos para Obtener tus Credenciales

### 1. Crear/Acceder a tu Proyecto en Supabase

1. Ve a [https://supabase.com](https://supabase.com)
2. Si no tienes cuenta, créala (es gratis)
3. Crea un nuevo proyecto o selecciona uno existente
4. Espera a que el proyecto termine de inicializarse (puede tardar 1-2 minutos)

### 2. Obtener las Credenciales

1. En tu proyecto de Supabase, ve a **Settings** (Configuración) en el menú lateral
2. Haz clic en **API** en el submenú
3. Ahí encontrarás:
   - **Project URL**: Es algo como `https://xxxxx.supabase.co`
   - **anon public key**: Es una clave larga que empieza con `eyJhbGc...`

### 3. Configurar en el Proyecto

1. Abre el archivo: `lib/providers/supabase_provider.dart`
2. Busca estas líneas (alrededor de la línea 24-25):
   ```dart
   const supabaseUrl = 'TU_SUPABASE_URL_AQUI';
   const supabaseKey = 'TU_SUPABASE_ANON_KEY_AQUI';
   ```
3. Reemplaza con tus credenciales:
   ```dart
   const supabaseUrl = 'https://tu-proyecto.supabase.co';  // Tu Project URL
   const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';  // Tu anon key
   ```

### 4. Configurar la Base de Datos (Opcional pero Recomendado)

Si quieres usar el modo online completo, también necesitas crear las tablas:

1. En Supabase, ve a **SQL Editor**
2. Copia todo el contenido del archivo `supabase_schema.sql`
3. Pégalo en el editor SQL de Supabase
4. Haz clic en **Run** (o presiona Ctrl+Enter)
5. Esto creará las tablas: `categorias`, `palabras`, `records`

### 5. Verificar que Funciona

1. Ejecuta la app:
   ```bash
   flutter run
   ```
2. Si ves en la consola: `✅ Supabase inicializado correctamente` → ¡Todo está bien!
3. Si ves: `⚠️ Supabase no configurado` → Revisa que hayas reemplazado las credenciales correctamente

## ⚠️ Importante

- **NUNCA** compartas tu `anon key` públicamente (aunque es relativamente segura)
- La app funcionará en **modo offline** si no configuras Supabase
- Puedes usar solo las categorías offline sin configurar nada

## 🆘 Si tienes Problemas

1. **Error de conexión**: Verifica que tu proyecto de Supabase esté activo
2. **Error de autenticación**: Verifica que copiaste la key completa sin espacios
3. **Las tablas no existen**: Ejecuta el script `supabase_schema.sql` en SQL Editor

---

¡Listo! Ahora tu proyecto usa tus propias credenciales de Supabase. 🎉

