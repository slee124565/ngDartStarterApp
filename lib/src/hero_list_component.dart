import 'dart:async';

import 'package:angular/angular.dart';
import 'package:ngDartStarterApp/src/hero_component.dart';
import 'hero.dart';
// import 'hero_component.dart';
import 'hero_service.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  directives: [coreDirectives, HeroComponent],
  providers: [ClassProvider(HeroService)],
)
class HeroListComponent implements OnInit {
  List<Hero> heroes;
  Hero selected;
  final HeroService _heroService;

  HeroListComponent(this._heroService);

  void onSelect(Hero hero) => selected = hero;

  Future<void> _getHeros() async {
    heroes = await _heroService.getAllSlowly();
    // _heroService.getAll().then((heroes) => this.heroes);
  }

  void ngOnInit() => _getHeros();
}