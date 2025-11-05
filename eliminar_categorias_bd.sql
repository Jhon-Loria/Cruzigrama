-- ============================================
-- ELIMINAR CATEGORÍAS: Tecnología, Animes y Animales
-- ============================================
-- Ejecuta este script en Supabase SQL Editor para eliminar
-- las categorías y sus palabras relacionadas de la base de datos

-- IMPORTANTE: Como la tabla 'palabras' tiene ON DELETE CASCADE,
-- al eliminar las categorías, AUTOMÁTICAMENTE se eliminarán:
-- ✅ Todas las palabras de esas categorías (de la tabla 'palabras')
-- ✅ Todos los scores relacionados (de la tabla 'scores')
-- ✅ Y automáticamente desaparecerán de la vista 'palabras_categorias'
--    (porque la vista es dinámica y se genera a partir de las tablas)

-- Eliminar las categorías (esto eliminará automáticamente todo lo relacionado)
DELETE FROM categorias 
WHERE nombre IN ('Tecnología', 'Animes', 'Animales');

-- Verificación 1: Mostrar las categorías restantes
SELECT 'Categorías restantes:' as info;
SELECT nombre, descripcion, activa 
FROM categorias 
ORDER BY nombre;

-- Verificación 2: Contar palabras restantes (deberían ser solo de Dark Rippers y Deportes)
SELECT 'Total de palabras restantes:' as info;
SELECT COUNT(*) as total_palabras FROM palabras;

-- Verificación 3: Ver palabras por categoría (solo Dark Rippers y Deportes)
SELECT 'Palabras por categoría:' as info;
SELECT c.nombre as categoria, COUNT(p.id) as total_palabras
FROM categorias c
LEFT JOIN palabras p ON p.categoria_id = c.id
GROUP BY c.id, c.nombre
ORDER BY c.nombre;

