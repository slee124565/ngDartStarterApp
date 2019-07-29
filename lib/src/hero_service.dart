import 'dart:async';

import 'hero.dart';
import 'mock_heros.dart';

class HeroService {
  // List<Hero> getAll() => mockHeros;
  Future<List<Hero>> getAll() async => mockHeros;

  Future<List<Hero>> getAllSlowly() {
    return Future.delayed(Duration(seconds: 2), getAll);
  }

  Future<Hero> get(int id) async => 
  (await getAll()).firstWhere((hero) => hero.id == id);
}