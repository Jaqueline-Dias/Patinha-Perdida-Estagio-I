import 'package:app_patinha/src/modules/feed/post/post_page.dart';
import 'package:app_patinha/src/modules/feed/post/post_view_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LoginRouter extends FlutterGetItModulePageRouter {
  const LoginRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => PostViewModule()),
      ];

  @override
  WidgetBuilder get view => (_) => const PostPage();
}
