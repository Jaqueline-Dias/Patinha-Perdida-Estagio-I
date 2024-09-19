import 'package:app_patinha/src/modules/auth/login/login_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class AuthModule extends FlutterGetItModule {
  /*@override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserLoginService>(
            (i) => UserLoginServiceImpl())
      ];*/

  @override
  String get moduleRouteName => '/auth';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/login': (_) => const LoginRouter(),
      };
}
