import 'package:app_patinha/src/modules/report/secondPageReport/second_page_report_page.dart';
import 'package:app_patinha/src/modules/report/secondPageReport/second_page_report_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SecondPageReportRouter extends FlutterGetItModulePageRouter {
  const SecondPageReportRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => SecondPageReportViewModel()),
      ];

  @override
  WidgetBuilder get view => (_) => const SecondPageReportPage();
}
