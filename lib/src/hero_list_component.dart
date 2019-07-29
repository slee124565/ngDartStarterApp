import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:ngDartStarterApp/src/hero_component.dart';
import 'package:ngDartStarterApp/src/route_paths.dart';
import 'hero.dart';
// import 'hero_component.dart';
import 'hero_service.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  directives: [coreDirectives, HeroComponent],
  providers: [ClassProvider(HeroService)],
  pipes: [commonPipes],
)
class HeroListComponent implements OnInit {
  final HeroService _heroService;
  final Router _router;
  List<Hero> heroes;
  Hero selected;

  HeroListComponent(this._heroService, this._router);

  void onSelect(Hero hero) => selected = hero;

  Future<void> _getHeros() async {
    heroes = await _heroService.getAllSlowly();
    // _heroService.getAll().then((heroes) => this.heroes);
  }

  String _heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() => _router.navigate(_heroUrl(selected.id));

  void ngOnInit() => _getHeros();

  Future<void> add(String name) async {
    name = name.trim();
    if (name.isEmpty) return null;
    heroes.add(await _heroService.create(name));
    selected = null;
  }

  Future<void> delete(Hero hero) async {
    await _heroService.delete(hero.id);
    heroes.remove(hero);
    if (selected == hero) selected = null;
  }
}