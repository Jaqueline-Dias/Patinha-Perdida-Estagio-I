import 'package:app_patinha/src/modules/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class ProfileModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/user';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/profile': (context) => const ProfilePage(),
      };
}
