
import 'package:angular/angular.dart';

import 'hero.dart';
import 'hero_service.dart';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  directives: [coreDirectives],
)
class DashboardComponent implements OnInit {
  List<Hero> heroes;
  final HeroService _heroService;

  DashboardComponent(this._heroService);

  @override
  void ngOnInit() async {
    heroes = (await _heroService.getAllSlowly()).skip(1).take(4).toList();
  }
}