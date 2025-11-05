-- ============================================
-- ESQUEMA DE BASE DE DATOS PARA CRUCIGRAMA
-- ============================================
-- Ejecutar estos scripts en Supabase SQL Editor
-- para crear las tablas necesarias

-- ============================================
-- 1. TABLA: categorias
-- ============================================
CREATE TABLE IF NOT EXISTS categorias (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nombre VARCHAR(100) NOT NULL UNIQUE,
  descripcion TEXT,
  activa BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 2. TABLA: palabras
-- ============================================
CREATE TABLE IF NOT EXISTS palabras (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  categoria_id UUID NOT NULL REFERENCES categorias(id) ON DELETE CASCADE,
  palabra VARCHAR(100) NOT NULL,
  pista TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(categoria_id, palabra)
);

-- Índice para búsquedas rápidas
CREATE INDEX IF NOT EXISTS idx_palabras_categoria ON palabras(categoria_id);
CREATE INDEX IF NOT EXISTS idx_palabras_palabra ON palabras(palabra);

-- ============================================
-- 3. TABLA: scores
-- ============================================
CREATE TABLE IF NOT EXISTS scores (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  categoria_id UUID NOT NULL REFERENCES categorias(id) ON DELETE CASCADE,
  nombre_jugador VARCHAR(100) NOT NULL,
  tiempo_segundos INTEGER NOT NULL,
  fecha_completado TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Índices para el leaderboard
CREATE INDEX IF NOT EXISTS idx_scores_categoria ON scores(categoria_id);
CREATE INDEX IF NOT EXISTS idx_scores_tiempo ON scores(tiempo_segundos);
CREATE INDEX IF NOT EXISTS idx_scores_categoria_tiempo ON scores(categoria_id, tiempo_segundos);

-- ============================================
-- 4. FUNCIÓN: Actualizar updated_at automáticamente
-- ============================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Triggers para actualizar updated_at
CREATE TRIGGER update_categorias_updated_at BEFORE UPDATE ON categorias
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_palabras_updated_at BEFORE UPDATE ON palabras
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- 5. DATOS INICIALES: Categorías
-- ============================================
INSERT INTO categorias (nombre, descripcion) VALUES
  ('Dark Rippers', 'Personajes y elementos de Dark Rippers'),
  ('Deportes', 'Deportes y equipos deportivos')
ON CONFLICT (nombre) DO NOTHING;

-- ============================================
-- 6. DATOS INICIALES: Palabras para Dark Rippers
-- ============================================
-- Nota: Necesitarás obtener el ID de la categoría "Dark Rippers" primero
-- o usar una subquery

INSERT INTO palabras (categoria_id, palabra, pista) VALUES
  ((SELECT id FROM categorias WHERE nombre = 'Dark Rippers'), 'kirito', 'Principal de Sword Art Online'),
  ((SELECT id FROM categorias WHERE nombre = 'Dark Rippers'), 'eromichi', 'De anime'),
  ((SELECT id FROM categorias WHERE nombre = 'Dark Rippers'), 'pablini', 'De Dark Rippers'),
  ((SELECT id FROM categorias WHERE nombre = 'Dark Rippers'), 'secuz', 'O elemento de Dark Rippers'),
  ((SELECT id FROM categorias WHERE nombre = 'Dark Rippers'), 'niño', 'Joven'),
  ((SELECT id FROM categorias WHERE nombre = 'Dark Rippers'), 'celismor', 'De Dark Rippers'),
  ((SELECT id FROM categorias WHERE nombre = 'Dark Rippers'), 'quesuangelito', 'O elemento especial')
ON CONFLICT (categoria_id, palabra) DO NOTHING;

-- ============================================
-- 7. POLÍTICAS RLS (Row Level Security)
-- ============================================
-- Habilitar RLS
ALTER TABLE categorias ENABLE ROW LEVEL SECURITY;
ALTER TABLE palabras ENABLE ROW LEVEL SECURITY;
ALTER TABLE scores ENABLE ROW LEVEL SECURITY;

-- Política: Todos pueden leer categorías activas
CREATE POLICY "Categorías públicas" ON categorias
  FOR SELECT USING (activa = true);

-- Política: Todos pueden leer palabras
CREATE POLICY "Palabras públicas" ON palabras
  FOR SELECT USING (true);

-- Política: Todos pueden insertar scores
CREATE POLICY "Insertar scores públicos" ON scores
  FOR INSERT WITH CHECK (true);

-- Política: Todos pueden leer scores
CREATE POLICY "Leer scores públicos" ON scores
  FOR SELECT USING (true);

-- ============================================
-- 8. VISTAS ÚTILES
-- ============================================
-- Vista para obtener palabras con categoría
CREATE OR REPLACE VIEW palabras_categorias AS
SELECT 
  p.id,
  p.palabra,
  p.pista,
  c.id as categoria_id,
  c.nombre as categoria_nombre
FROM palabras p
JOIN categorias c ON p.categoria_id = c.id
WHERE c.activa = true;

-- Vista para el leaderboard
CREATE OR REPLACE VIEW leaderboard AS
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
ORDER BY r.categoria_id, r.tiempo_segundos ASC;

