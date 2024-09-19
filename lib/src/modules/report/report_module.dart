import 'package:app_patinha/src/modules/report/firstPageReport/first_page_report_router.dart';
import 'package:app_patinha/src/modules/report/secondPageReport/second_page_report_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class ReportModule extends FlutterGetItModule {
  /*@override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserLoginService>(
            (i) => UserLoginServiceImpl())
      ];*/

  @override
  String get moduleRouteName => '/report';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/first': (_) => const FirstPageReportRouter(),
        '/second': (_) => const SecondPageReportRouter(),
      };
}
