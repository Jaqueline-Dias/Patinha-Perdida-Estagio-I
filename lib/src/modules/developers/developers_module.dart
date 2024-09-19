import 'package:app_patinha/src/modules/developers/developers_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class DevelopersModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/info';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/developers': (context) => const DevelopersPage(),
      };
}
