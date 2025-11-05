-- ============================================
-- INSERTAR TODAS LAS PALABRAS EN SUPABASE
-- ============================================
-- Ejecutar este script en Supabase SQL Editor
-- para agregar todas las palabras de todas las categorías
-- 
-- Este script inserta todas las palabras que están en el código offline
-- para que tu profesor pueda verlas en Supabase

-- ============================================
-- 1. PALABRAS DE DARK RIPPERS
-- ============================================
INSERT INTO palabras (categoria_id, palabra, pista) VALUES
  ((SELECT id FROM categorias WHERE nombre = 'Dark Rippers'), 'kirito', 'Personaje principal de Sword Art Online'),
  ((SELECT id FROM categorias WHERE nombre = 'Dark Rippers'), 'eromichi', 'Personaje de anime'),
  ((SELECT id FROM categorias WHERE nombre = 'Dark Rippers'), 'pablini', 'Personaje de Dark Rippers'),
  ((SELECT id FROM categorias WHERE nombre = 'Dark Rippers'), 'secuz', 'Personaje o elemento de Dark Rippers'),
  ((SELECT id FROM categorias WHERE nombre = 'Dark Rippers'), 'niño', 'Personaje joven'),
  ((SELECT id FROM categorias WHERE nombre = 'Dark Rippers'), 'celismor', 'Personaje de Dark Rippers'),
  ((SELECT id FROM categorias WHERE nombre = 'Dark Rippers'), 'quesuangelito', 'Personaje o elemento especial')
ON CONFLICT (categoria_id, palabra) DO NOTHING;

-- ============================================
-- 2. PALABRAS DE ANIMALES (60 palabras)
-- ============================================
INSERT INTO palabras (categoria_id, palabra, pista) VALUES
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'gato', 'Felino doméstico'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'perro', 'Mejor amigo del hombre'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'leon', 'Rey de la selva'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'tigre', 'Felino rayado'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'oso', 'Animal peludo grande'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'aguila', 'Ave rapaz'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'delfin', 'Mamífero marino inteligente'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'elefante', 'Animal con trompa'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'jirafa', 'Animal de cuello largo'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'caballo', 'Animal de montar'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'conejo', 'Animal de orejas largas'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'pajaro', 'Ave voladora'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'pez', 'Animal acuático'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'cerdo', 'Animal de granja'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'vaca', 'Animal que da leche'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'oveja', 'Animal con lana'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'gallina', 'Ave de corral'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'raton', 'Roedor pequeño'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'serpiente', 'Reptil sin patas'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'cocodrilo', 'Reptil acuático'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'tortuga', 'Reptil con caparazón'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'rana', 'Anfibio saltador'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'mariposa', 'Insecto con alas'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'abeja', 'Insecto que hace miel'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'hormiga', 'Insecto trabajador'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'lobo', 'Canino salvaje'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'zorro', 'Canino astuto'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'lince', 'Felino salvaje'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'ciervo', 'Animal con cornamenta'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'jabali', 'Cerdo salvaje'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'ardilla', 'Roedor de árboles'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'castor', 'Roedor constructor'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'canguro', 'Marsupial saltador'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'koala', 'Marsupial de eucalipto'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'panda', 'Oso de bambú'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'pinguino', 'Ave no voladora'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'flamenco', 'Ave rosada'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'pato', 'Ave acuática'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'cisne', 'Ave elegante'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'buitre', 'Ave carroñera'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'halcon', 'Ave rapaz pequeña'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'buho', 'Ave nocturna'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'buey', 'Bovino de trabajo'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'toro', 'Bovino macho'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'camello', 'Animal del desierto'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'llama', 'Camelido andino'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'alpaca', 'Camelido lanudo'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'vicuña', 'Camelido silvestre'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'tapir', 'Mamífero tropical'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'rinoceronte', 'Animal con cuerno'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'hipopotamo', 'Animal acuático grande'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'cangrejo', 'Crustáceo con pinzas'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'langosta', 'Crustáceo marino'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'pulpo', 'Molusco con tentáculos'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'calamar', 'Molusco cefalópodo'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'medusa', 'Cnidario acuático'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'estrella', 'Equinodermo marino'),
  ((SELECT id FROM categorias WHERE nombre = 'Animales'), 'erizo', 'Equinodermo espinoso')
ON CONFLICT (categoria_id, palabra) DO NOTHING;

-- ============================================
-- 3. PALABRAS DE ANIMES (70 palabras)
-- ============================================
INSERT INTO palabras (categoria_id, palabra, pista) VALUES
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'naruto', 'Ninja con demonio zorro'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'goku', 'Saiyan de Dragon Ball'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'luffy', 'Capitán de los piratas'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'ichigo', 'Portador de Shinigami'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'pikachu', 'Pokémon eléctrico amarillo'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'sakura', 'Ninja kunoichi'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'eren', 'Portador del Titán'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'midoriya', 'Estudiante de héroe'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'sasuke', 'Ninja del clan Uchiha'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'vegeta', 'Príncipe Saiyan'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'zoro', 'Espadachín de One Piece'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'nami', 'Navegante de One Piece'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'usopp', 'Francotirador de One Piece'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'sanji', 'Cocinero de One Piece'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'chopper', 'Médico de One Piece'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'robin', 'Arqueóloga de One Piece'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'franky', 'Carpintero de One Piece'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'brook', 'Músico de One Piece'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'jinbe', 'Hombres pez de One Piece'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'yamato', 'Hijo de Kaido'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'tanjiro', 'Cazador de demonios'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'nezuko', 'Hermana de Tanjiro'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'zenitsu', 'Cazador de demonios'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'inosuke', 'Cazador con máscara'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'itadori', 'Estudiante con poder'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'gon', 'Cazador de Hunter'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'killua', 'Asesino de Hunter'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'hisoka', 'Mago de Hunter'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'kurapika', 'Miembro de Hunter'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'leorio', 'Médico de Hunter'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'edward', 'Alquimista de acero'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'alphonse', 'Alquimista de armadura'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'roy', 'Alquimista de fuego'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'winry', 'Mecánica automail'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'rin', 'Shinobi de Naruto'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'neji', 'Ninja de Hyuga'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'rock', 'Lee de Naruto'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'gaara', 'Kazekage de arena'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'shikamaru', 'Ninja estratega'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'ino', 'Ninja de Yamanaka'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'chouji', 'Ninja de Akimichi'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'kiba', 'Ninja con perro'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'hinata', 'Ninja de Hyuga'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'shino', 'Ninja de Aburame'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'tenten', 'Ninja de armas'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'kakashi', 'Ninja copiador'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'guy', 'Ninja de taijutsu'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'jiraiya', 'Sannin legendario'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'tsunade', 'Hokage quinta'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'orochimaru', 'Sannin traidor'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'minato', 'Hokage cuarto'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'hashirama', 'Hokage primero'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'tobirama', 'Hokage segundo'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'hiruzen', 'Hokage tercero'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'madara', 'Uchiha legendario'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'obito', 'Uchiha con máscara'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'itachi', 'Uchiha hermano mayor'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'shisui', 'Uchiha del teleporte'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'izuna', 'Uchiha hermano'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'kushina', 'Uzumaki madre'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'nagato', 'Pain de Akatsuki'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'konan', 'Akatsuki de papel'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'kisame', 'Akatsuki de espada'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'deidara', 'Akatsuki de explosiones'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'sasori', 'Akatsuki de marionetas'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'hidan', 'Akatsuki inmortal'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'kakuzu', 'Akatsuki de corazones'),
  ((SELECT id FROM categorias WHERE nombre = 'Animes'), 'zetsu', 'Akatsuki espía')
ON CONFLICT (categoria_id, palabra) DO NOTHING;

-- ============================================
-- 4. PALABRAS DE TECNOLOGÍA (60 palabras)
-- ============================================
INSERT INTO palabras (categoria_id, palabra, pista) VALUES
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'flutter', 'Framework de desarrollo móvil'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'android', 'Sistema operativo móvil'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'ios', 'Sistema de Apple'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'python', 'Lenguaje de programación'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'javascript', 'Lenguaje web'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'react', 'Biblioteca de JavaScript'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'node', 'Runtime de JavaScript'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'sql', 'Lenguaje de bases de datos'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'api', 'Interfaz de programación'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'cloud', 'Computación en la nube'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'docker', 'Plataforma de contenedores'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'kubernetes', 'Orquestador de contenedores'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'github', 'Plataforma de código'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'git', 'Sistema de control de versiones'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'html', 'Lenguaje de marcado'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'css', 'Lenguaje de estilos'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'java', 'Lenguaje de programación'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'csharp', 'Lenguaje de Microsoft'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'php', 'Lenguaje de servidor'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'ruby', 'Lenguaje de programación'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'go', 'Lenguaje de Google'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'rust', 'Lenguaje de sistemas'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'swift', 'Lenguaje de Apple'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'kotlin', 'Lenguaje de Android'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'dart', 'Lenguaje de Flutter'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'vue', 'Framework JavaScript'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'angular', 'Framework de Google'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'svelte', 'Framework compilado'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'nextjs', 'Framework de React'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'nuxt', 'Framework de Vue'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'remix', 'Framework web'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'astro', 'Framework de contenido'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'solid', 'Framework reactivo'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'qwik', 'Framework rápido'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'deno', 'Runtime de JavaScript'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'bun', 'Runtime rápido'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'vite', 'Build tool rápido'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'webpack', 'Bundler de módulos'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'rollup', 'Bundler de ES6'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'esbuild', 'Bundler rápido'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'turbo', 'Build system'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'nx', 'Monorepo tool'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'lerna', 'Monorepo manager'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'yarn', 'Package manager'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'pnpm', 'Package manager eficiente'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'npm', 'Package manager oficial'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'pip', 'Package manager Python'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'cargo', 'Package manager Rust'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'composer', 'Package manager PHP'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'gradle', 'Build tool Java'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'maven', 'Build tool Java'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'sbt', 'Build tool Scala'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'cmake', 'Build system C++'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'make', 'Build tool Unix'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'ninja', 'Build system rápido'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'bazel', 'Build system Google'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'buck', 'Build system Facebook'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'pants', 'Build system Python'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'meson', 'Build system moderno'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'wasm', 'Web Assembly'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'wasmtime', 'Runtime WASM'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'wasmer', 'Runtime WASM'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'wasi', 'Sistema WASM'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'emscripten', 'Compilador WASM'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'blazor', 'Framework .NET'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'aspnet', 'Framework .NET'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'dotnet', 'Framework Microsoft'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'core', '.NET Core'),
  ((SELECT id FROM categorias WHERE nombre = 'Tecnología'), 'maui', 'Framework multiplataforma')
ON CONFLICT (categoria_id, palabra) DO NOTHING;

-- ============================================
-- 5. PALABRAS DE DEPORTES (75 palabras)
-- ============================================
INSERT INTO palabras (categoria_id, palabra, pista) VALUES
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'futbol', 'Deporte con balón'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'basquet', 'Deporte con aro'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'tenis', 'Deporte con raqueta'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'natacion', 'Deporte acuático'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'ciclismo', 'Deporte con bicicleta'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'boxeo', 'Deporte de combate'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'atletismo', 'Deporte de pista'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'volley', 'Deporte con red'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'golf', 'Deporte con palos'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'beisbol', 'Deporte con bate'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'rugby', 'Deporte de contacto'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'hockey', 'Deporte con palo'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'esqui', 'Deporte de nieve'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'surf', 'Deporte acuático'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'karate', 'Arte marcial'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'judo', 'Arte marcial'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'taekwondo', 'Arte marcial coreano'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'gimnasia', 'Deporte acrobático'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'esgrima', 'Deporte con espada'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'remo', 'Deporte acuático'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'vela', 'Deporte náutico'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'motocross', 'Deporte motorizado'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'formula', 'Carreras de autos'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'maraton', 'Carrera de larga distancia'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'triatlon', 'Deporte combinado'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'baloncesto', 'Deporte con aro y balón'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'handball', 'Deporte con balón y mano'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'waterpolo', 'Deporte acuático con balón'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'polo', 'Deporte con caballo'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'cricket', 'Deporte con bate y pelota'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'badminton', 'Deporte con raqueta y volante'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'squash', 'Deporte con raqueta en cancha'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'raquetbol', 'Deporte con raqueta'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'pingpong', 'Deporte de mesa'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'ajedrez', 'Juego de estrategia'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'damas', 'Juego de tablero'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'backgammon', 'Juego de tablero'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'poker', 'Juego de cartas'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'bridge', 'Juego de cartas'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'escalada', 'Deporte de montaña'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'rapel', 'Técnica de descenso'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'paracaidismo', 'Deporte aéreo'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'parapente', 'Deporte aéreo'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'ala', 'Vuelo con ala delta'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'bungee', 'Salto extremo'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'puenting', 'Salto de puente'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'rafting', 'Deporte de río'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'kayak', 'Deporte acuático'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'canoa', 'Deporte acuático'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'piragua', 'Embarcación pequeña'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'windsurf', 'Deporte acuático con vela'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'kitesurf', 'Deporte acuático con cometa'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'wakeboard', 'Deporte acuático'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'snowboard', 'Deporte de nieve'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'patinaje', 'Deporte sobre hielo'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'curling', 'Deporte sobre hielo'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'bobsleigh', 'Deporte sobre hielo'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'luge', 'Deporte sobre hielo'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'skeleton', 'Deporte sobre hielo'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'biathlon', 'Deporte combinado'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'pentatlon', 'Deporte combinado'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'decathlon', 'Deporte combinado'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'heptathlon', 'Deporte combinado'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'salto', 'Disciplina atlética'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'lanzamiento', 'Disciplina atlética'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'carrera', 'Disciplina atlética'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'marcha', 'Disciplina atlética'),
  ((SELECT id FROM categorias WHERE nombre = 'Deportes'), 'relevos', 'Carrera por equipos')
ON CONFLICT (categoria_id, palabra) DO NOTHING;

-- ============================================
-- VERIFICACIÓN: Contar palabras por categoría
-- ============================================
-- Puedes ejecutar esta consulta para ver cuántas palabras hay en cada categoría
SELECT 
  c.nombre as categoria,
  COUNT(p.id) as total_palabras
FROM categorias c
LEFT JOIN palabras p ON p.categoria_id = c.id
WHERE c.activa = true
GROUP BY c.id, c.nombre
ORDER BY c.nombre;

-- ============================================
-- VER TODAS LAS PALABRAS CON SUS CATEGORÍAS
-- ============================================
-- Esta consulta muestra todas las palabras organizadas por categoría
SELECT 
  c.nombre as categoria,
  p.palabra,
  p.pista
FROM categorias c
JOIN palabras p ON p.categoria_id = c.id
WHERE c.activa = true
ORDER BY c.nombre, p.palabra;

