import 'package:flutter_modular/flutter_modular.dart';
import 'package:target_test/modules/info/services/info_service.dart';
import 'package:target_test/modules/info/stores/info_store.dart';
import 'package:target_test/modules/login/views/login_page.dart';
import 'package:http/http.dart' as http;
import 'info/services/i_service.dart';
import 'info/views/info_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addInstance<http.Client>(http.Client());
    i.add<IService>(InfoService.new);
    i.addSingleton<InfoStore>(InfoStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
    r.child('/infopage',
        child: (context) => const InfoPage(),
        transition: TransitionType.leftToRightWithFade,
        duration: const Duration(seconds: 1));
  }
}

//r.module => ModuleRoute.