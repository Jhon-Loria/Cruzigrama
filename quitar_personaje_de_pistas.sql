-- ============================================
-- QUITAR LA PALABRA 'Personaje' DE LAS PISTAS
-- ============================================
-- Ejecuta este script en Supabase SQL Editor para actualizar
-- la columna 'pista' en la tabla 'palabras', eliminando la palabra "Personaje"

-- Actualizar todas las pistas que contengan "Personaje"
-- Esto elimina "Personaje" (con mayúscula inicial) y limpia espacios extra
UPDATE palabras
SET pista = TRIM(REGEXP_REPLACE(
  REGEXP_REPLACE(pista, 'Personaje\s+', '', 'g'),
  '\s+', ' ', 'g'
))
WHERE pista ILIKE '%Personaje%';

-- Verificación: Mostrar las pistas actualizadas
SELECT palabra, pista 
FROM palabras 
WHERE pista IS NOT NULL
ORDER BY palabra
LIMIT 20;

