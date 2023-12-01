import 'package:flutter_modular/flutter_modular.dart';
import 'package:target_test/modules/login/views/login_page.dart';

import 'info/views/info_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

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