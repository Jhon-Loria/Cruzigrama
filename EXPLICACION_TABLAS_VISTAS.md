# 📊 Explicación de Tablas y Vistas - Base de Datos Crucigrama

## 🔗 Estructura y Conexiones

```
┌─────────────────┐
│   categorias    │ ← Tabla PRINCIPAL (raíz)
└────────┬────────┘
         │
         ├─────────────────┬─────────────────┐
         │                 │                 │
         ▼                 ▼                 ▼
┌──────────────┐  ┌──────────────┐  ┌──────────────┐
│   palabras   │  │    scores    │  │  (vistas)    │
│              │  │              │  │              │
│ categoria_id │  │ categoria_id │  │              │
│  (FK)        │  │  (FK)        │  │              │
└──────────────┘  └──────────────┘  └──────────────┘
```

---

## 📋 Tablas Principales

### 1. **`categorias`** (Tabla)
**¿Qué hace?**
- Almacena las diferentes categorías de crucigramas disponibles
- Ejemplos: "Dark Rippers", "Animales", "Animes", "Tecnología", "Deportes"

**Campos:**
- `id` (UUID) - Identificador único
- `nombre` (VARCHAR) - Nombre de la categoría
- `descripcion` (TEXT) - Descripción de la categoría
- `activa` (BOOLEAN) - Si la categoría está activa o no
- `created_at`, `updated_at` - Fechas de creación y actualización

**Conexiones:**
- ✅ **Conectada con:** `palabras` y `scores` (ambas usan `categoria_id`)
- 🔵 **Tipo de conexión:** Foreign Key (FK) - Una categoría puede tener muchas palabras y muchos scores

**RLS (Seguridad):**
- ✅ RLS habilitado
- ✅ Política: Todos pueden leer categorías activas (`activa = true`)
- 🔴 **NO está marcada en rojo** porque tiene políticas RLS definidas

---

### 2. **`palabras`** (Tabla)
**¿Qué hace?**
- Almacena las palabras y sus pistas que se usan para generar los crucigramas
- Cada palabra pertenece a una categoría

**Campos:**
- `id` (UUID) - Identificador único
- `categoria_id` (UUID, FK) - **CONECTADA** con `categorias.id`
- `palabra` (VARCHAR) - La palabra para el crucigrama
- `pista` (TEXT) - La pista/hint para esa palabra
- `created_at`, `updated_at` - Fechas

**Conexiones:**
- ✅ **Conectada con:** `categorias` (a través de `categoria_id`)
- 🔵 **Tipo:** Foreign Key con `ON DELETE CASCADE` (si eliminas una categoría, se eliminan sus palabras)

**RLS (Seguridad):**
- ✅ RLS habilitado
- ✅ Política: Todos pueden leer palabras (`SELECT USING (true)`)
- 🔴 **NO está marcada en rojo** porque tiene políticas RLS definidas

---

### 3. **`scores`** (Tabla)
**¿Qué hace?**
- Almacena los puntajes/tiempos de los jugadores cuando completan crucigramas
- Cada score pertenece a una categoría

**Campos:**
- `id` (UUID) - Identificador único
- `categoria_id` (UUID, FK) - **CONECTADA** con `categorias.id`
- `nombre_jugador` (VARCHAR) - Nombre del jugador
- `tiempo_segundos` (INTEGER) - Tiempo en segundos que tardó
- `fecha_completado` (TIMESTAMP) - Cuándo completó el puzzle
- `created_at` - Fecha de creación

**Conexiones:**
- ✅ **Conectada con:** `categorias` (a través de `categoria_id`)
- 🔵 **Tipo:** Foreign Key con `ON DELETE CASCADE`

**RLS (Seguridad):**
- ✅ RLS habilitado
- ✅ Política: Todos pueden leer scores (`SELECT USING (true)`)
- ✅ Política: Todos pueden insertar scores (`INSERT WITH CHECK (true)`)
- 🔴 **NO está marcada en rojo** porque tiene políticas RLS definidas

---

## 👁️ Vistas (Views)

### 4. **`palabras_categorias`** (Vista) 🔴 **MARCADA EN ROJO**
**¿Qué hace?**
- Combina datos de `palabras` y `categorias` en una sola consulta
- Facilita obtener palabras junto con el nombre de su categoría sin hacer JOINs manuales

**Consulta base:**
```sql
SELECT 
  p.id,
  p.palabra,
  p.pista,
  c.id as categoria_id,
  c.nombre as categoria_nombre
FROM palabras p
JOIN categorias c ON p.categoria_id = c.id
WHERE c.activa = true
```

**Conexiones:**
- ✅ **Usa datos de:** `palabras` y `categorias`
- 🔵 **Tipo:** JOIN entre ambas tablas

**¿Por qué está marcada en ROJO con "Unrestricted"?**
- 🔴 **Las vistas NO tienen políticas RLS propias**
- 🔴 Las vistas heredan las políticas RLS de las tablas que usan
- 🔴 Como `palabras` y `categorias` tienen políticas públicas (todos pueden leer), la vista también es pública
- ✅ **Esto es CORRECTO y SEGURO** - Es intencional que todos puedan ver las palabras y categorías

---

### 5. **`leaderboard`** (Vista) 🔴 **MARCADA EN ROJO**
**¿Qué hace?**
- Genera un ranking automático de los mejores tiempos por categoría
- Calcula el ranking (posición) usando `ROW_NUMBER()`
- Ordena por tiempo de menor a mayor (los más rápidos primero)

**Consulta base:**
```sql
SELECT 
  r.id,
  r.nombre_jugador,
  r.tiempo_segundos,
  r.fecha_completado,
  c.nombre as categoria_nombre,
  c.id as categoria_id,
  ROW_NUMBER() OVER (PARTITION BY r.categoria_id ORDER BY r.tiempo_segundos ASC) as ranking
FROM scores r
JOIN categorias c ON r.categoria_id = c.id
ORDER BY r.categoria_id, r.tiempo_segundos ASC
```

**Conexiones:**
- ✅ **Usa datos de:** `scores` y `categorias`
- 🔵 **Tipo:** JOIN entre ambas tablas

**¿Por qué está marcada en ROJO con "Unrestricted"?**
- 🔴 **Las vistas NO tienen políticas RLS propias**
- 🔴 Las vistas heredan las políticas RLS de las tablas que usan
- 🔴 Como `scores` y `categorias` tienen políticas públicas (todos pueden leer), la vista también es pública
- ✅ **Esto es CORRECTO y SEGURO** - Es intencional que todos puedan ver el leaderboard

---

## ✅ Verificación de Conexiones

### ¿Están todas conectadas correctamente?

| Tabla/Vista | Conectada con | Tipo de Conexión | Estado |
|-------------|---------------|------------------|--------|
| `categorias` | (raíz) | - | ✅ OK |
| `palabras` | `categorias` | Foreign Key | ✅ OK |
| `scores` | `categorias` | Foreign Key | ✅ OK |
| `palabras_categorias` | `palabras` + `categorias` | JOIN (vista) | ✅ OK |
| `leaderboard` | `scores` + `categorias` | JOIN (vista) | ✅ OK |

**✅ TODAS están conectadas correctamente**

---

## 🔴 ¿Por qué están marcadas en ROJO?

### Explicación del "Unrestricted"

**En Supabase, el color ROJO con "Unrestricted" significa:**

1. **Las vistas NO tienen políticas RLS directas**
   - Las políticas RLS solo se aplican a **tablas**, no a vistas
   - Las vistas heredan las políticas de las tablas que consultan

2. **Las tablas subyacentes tienen políticas públicas**
   - `palabras` → Todos pueden leer (`SELECT USING (true)`)
   - `categorias` → Todos pueden leer categorías activas
   - `scores` → Todos pueden leer (`SELECT USING (true)`)

3. **Por lo tanto, las vistas son públicas**
   - Como las tablas permiten lectura pública, las vistas también son públicas
   - Esto es **intencional y correcto** para una app de crucigramas

4. **¿Es seguro?**
   - ✅ **SÍ**, es seguro porque:
     - Solo permite **lectura** (no se puede modificar/eliminar desde la vista)
     - Las tablas base tienen RLS habilitado
     - Solo se pueden insertar nuevos scores (no modificar/eliminar existentes)

---

## 📝 Resumen

| Entidad | Tipo | Propósito | Conexión | Estado RLS |
|---------|------|-----------|----------|------------|
| `categorias` | Tabla | Almacenar categorías | Raíz | ✅ Protegida |
| `palabras` | Tabla | Almacenar palabras y pistas | → categorias | ✅ Protegida |
| `scores` | Tabla | Almacenar puntajes | → categorias | ✅ Protegida |
| `palabras_categorias` | Vista | Unir palabras + categorías | JOIN palabras + categorias | 🔴 Unrestricted (OK) |
| `leaderboard` | Vista | Ranking de puntajes | JOIN scores + categorias | 🔴 Unrestricted (OK) |

**✅ Todo está correctamente configurado y conectado**

