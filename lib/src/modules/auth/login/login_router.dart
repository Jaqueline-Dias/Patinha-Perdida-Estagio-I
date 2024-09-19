import 'package:app_patinha/src/modules/auth/login/login_page.dart';
import 'package:app_patinha/src/modules/auth/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LoginRouter extends FlutterGetItModulePageRouter {
  const LoginRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => LoginViewModel(userLoginRepository: i())),
      ];

  @override
  WidgetBuilder get view => (_) => const LoginPage();
}
