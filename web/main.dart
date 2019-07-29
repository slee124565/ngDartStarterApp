import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/http.dart';
import 'package:ngDartStarterApp/app_component.template.dart' as ng;
// import 'package:http/browser_client.dart';
import 'package:ngDartStarterApp/in_memory_data_service.dart';

import 'main.template.dart' as self;

@GenerateInjector([
  routerProvidersHash,
  ClassProvider(Client, useClass: InMemoryDataService),
])
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
