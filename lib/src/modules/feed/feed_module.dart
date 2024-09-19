import 'package:app_patinha/src/modules/feed/post/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class FeedModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/feed';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/post': (context) => const PostPage(),
      };
}
