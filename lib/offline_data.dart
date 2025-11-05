/// Datos predeterminados para modo offline
/// Incluye palabras y pistas para cada categoría

class OfflineCategory {
  final String id;
  final String name;
  final String description;
  final List<OfflineWord> words;

  OfflineCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.words,
  });
}

class OfflineWord {
  final String word;
  final String clue;

  OfflineWord({required this.word, required this.clue});
}

final offlineCategories = [
  // Dark Rippers
  OfflineCategory(
    id: 'dark-rippers',
    name: 'Dark Rippers',
    description: 'Personajes y elementos de Dark Rippers',
    words: [
      OfflineWord(word: 'kirito', clue: 'Principal de Sword Art Online'),
      OfflineWord(word: 'eromichi', clue: 'De anime'),
      OfflineWord(word: 'pablini', clue: 'De Dark Rippers'),
      OfflineWord(word: 'secuz', clue: 'O elemento de Dark Rippers'),
      OfflineWord(word: 'niño', clue: 'Joven'),
      OfflineWord(word: 'celismor', clue: 'De Dark Rippers'),
      OfflineWord(word: 'quesuangelito', clue: 'O elemento especial'),
    ],
  ),

  // Deportes
  OfflineCategory(
    id: 'deportes',
    name: 'Deportes',
    description: 'Deportes y equipos deportivos',
    words: [
      OfflineWord(word: 'futbol', clue: 'Deporte con balón'),
      OfflineWord(word: 'basquet', clue: 'Deporte con aro'),
      OfflineWord(word: 'tenis', clue: 'Deporte con raqueta'),
      OfflineWord(word: 'natacion', clue: 'Deporte acuático'),
      OfflineWord(word: 'ciclismo', clue: 'Deporte con bicicleta'),
      OfflineWord(word: 'boxeo', clue: 'Deporte de combate'),
      OfflineWord(word: 'atletismo', clue: 'Deporte de pista'),
      OfflineWord(word: 'volley', clue: 'Deporte con red'),
      OfflineWord(word: 'golf', clue: 'Deporte con palos'),
      OfflineWord(word: 'beisbol', clue: 'Deporte con bate'),
      OfflineWord(word: 'rugby', clue: 'Deporte de contacto'),
      OfflineWord(word: 'hockey', clue: 'Deporte con palo'),
      OfflineWord(word: 'esqui', clue: 'Deporte de nieve'),
      OfflineWord(word: 'surf', clue: 'Deporte acuático'),
      OfflineWord(word: 'karate', clue: 'Arte marcial'),
      OfflineWord(word: 'judo', clue: 'Arte marcial'),
      OfflineWord(word: 'taekwondo', clue: 'Arte marcial coreano'),
      OfflineWord(word: 'gimnasia', clue: 'Deporte acrobático'),
      OfflineWord(word: 'esgrima', clue: 'Deporte con espada'),
      OfflineWord(word: 'remo', clue: 'Deporte acuático'),
      OfflineWord(word: 'vela', clue: 'Deporte náutico'),
      OfflineWord(word: 'motocross', clue: 'Deporte motorizado'),
      OfflineWord(word: 'formula', clue: 'Carreras de autos'),
      OfflineWord(word: 'maraton', clue: 'Carrera de larga distancia'),
      OfflineWord(word: 'triatlon', clue: 'Deporte combinado'),
      OfflineWord(word: 'baloncesto', clue: 'Deporte con aro y balón'),
      OfflineWord(word: 'handball', clue: 'Deporte con balón y mano'),
      OfflineWord(word: 'waterpolo', clue: 'Deporte acuático con balón'),
      OfflineWord(word: 'polo', clue: 'Deporte con caballo'),
      OfflineWord(word: 'cricket', clue: 'Deporte con bate y pelota'),
      OfflineWord(word: 'badminton', clue: 'Deporte con raqueta y volante'),
      OfflineWord(word: 'squash', clue: 'Deporte con raqueta en cancha'),
      OfflineWord(word: 'raquetbol', clue: 'Deporte con raqueta'),
      OfflineWord(word: 'pingpong', clue: 'Deporte de mesa'),
      OfflineWord(word: 'ajedrez', clue: 'Juego de estrategia'),
      OfflineWord(word: 'damas', clue: 'Juego de tablero'),
      OfflineWord(word: 'backgammon', clue: 'Juego de tablero'),
      OfflineWord(word: 'poker', clue: 'Juego de cartas'),
      OfflineWord(word: 'bridge', clue: 'Juego de cartas'),
      OfflineWord(word: 'escalada', clue: 'Deporte de montaña'),
      OfflineWord(word: 'rapel', clue: 'Técnica de descenso'),
      OfflineWord(word: 'paracaidismo', clue: 'Deporte aéreo'),
      OfflineWord(word: 'parapente', clue: 'Deporte aéreo'),
      OfflineWord(word: 'ala', clue: 'Vuelo con ala delta'),
      OfflineWord(word: 'bungee', clue: 'Salto extremo'),
      OfflineWord(word: 'puenting', clue: 'Salto de puente'),
      OfflineWord(word: 'rafting', clue: 'Deporte de río'),
      OfflineWord(word: 'kayak', clue: 'Deporte acuático'),
      OfflineWord(word: 'canoa', clue: 'Deporte acuático'),
      OfflineWord(word: 'piragua', clue: 'Embarcación pequeña'),
      OfflineWord(word: 'windsurf', clue: 'Deporte acuático con vela'),
      OfflineWord(word: 'kitesurf', clue: 'Deporte acuático con cometa'),
      OfflineWord(word: 'wakeboard', clue: 'Deporte acuático'),
      OfflineWord(word: 'esqui', clue: 'Deporte de nieve'),
      OfflineWord(word: 'snowboard', clue: 'Deporte de nieve'),
      OfflineWord(word: 'patinaje', clue: 'Deporte sobre hielo'),
      OfflineWord(word: 'hockey', clue: 'Deporte sobre hielo'),
      OfflineWord(word: 'curling', clue: 'Deporte sobre hielo'),
      OfflineWord(word: 'bobsleigh', clue: 'Deporte sobre hielo'),
      OfflineWord(word: 'luge', clue: 'Deporte sobre hielo'),
      OfflineWord(word: 'skeleton', clue: 'Deporte sobre hielo'),
      OfflineWord(word: 'biathlon', clue: 'Deporte combinado'),
      OfflineWord(word: 'pentatlon', clue: 'Deporte combinado'),
      OfflineWord(word: 'decathlon', clue: 'Deporte combinado'),
      OfflineWord(word: 'heptathlon', clue: 'Deporte combinado'),
      OfflineWord(word: 'salto', clue: 'Disciplina atlética'),
      OfflineWord(word: 'lanzamiento', clue: 'Disciplina atlética'),
      OfflineWord(word: 'carrera', clue: 'Disciplina atlética'),
      OfflineWord(word: 'marcha', clue: 'Disciplina atlética'),
      OfflineWord(word: 'relevos', clue: 'Carrera por equipos'),
    ],
  ),
];

/// Obtiene todas las palabras de una categoría offline
List<String> getOfflineWordsForCategory(String categoryId) {
  final category = offlineCategories.firstWhere(
    (cat) => cat.id == categoryId,
    orElse: () => offlineCategories.first,
  );
  return category.words.map((w) => w.word).toList();
}

/// Obtiene todas las categorías offline
List<OfflineCategory> getOfflineCategories() {
  return offlineCategories;
}

/// Obtiene una categoría offline por ID
OfflineCategory? getOfflineCategoryById(String categoryId) {
  try {
    return offlineCategories.firstWhere((cat) => cat.id == categoryId);
  } catch (e) {
    return null;
  }
}

