import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';
import 'hero.dart';
import 'hero_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'my-hero',
  templateUrl: 'hero_component.html',
  styleUrls: ['hero_component.css'],
  directives: [coreDirectives, formDirectives]
)
class HeroComponent implements OnActivate {
  final HeroService _heroService;
  final Location _location;
  Hero hero;

  HeroComponent(this._heroService, this._location);

  int getId(Map<String, String> parameters) {
    final id = parameters[idParam];
    return id == null ? null : int.tryParse(id);
  }

  Future<void> save() async {
    await _heroService.update(hero);
    goBack();
  }

  void goBack() => _location.back();

  @override
  void onActivate(RouterState previous, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) hero = await (_heroService.get(id));
  }
}