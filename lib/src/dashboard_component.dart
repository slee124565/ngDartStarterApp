
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:ngDartStarterApp/src/hero_search_component.dart';

import 'route_paths.dart';
import 'hero.dart';
import 'hero_service.dart';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  styleUrls: ['dashboard_component.css'],
  directives: [coreDirectives, HeroSearchComponent, routerDirectives],
)
class DashboardComponent implements OnInit {
  List<Hero> heroes;
  final HeroService _heroService;

  DashboardComponent(this._heroService);

  String heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  @override
  void ngOnInit() async {
    heroes = (await _heroService.getAllSlowly()).skip(1).take(4).toList();
  }
}