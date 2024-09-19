import 'package:app_patinha/src/modules/report/firstPageReport/first_page_report_page.dart';
import 'package:app_patinha/src/modules/report/firstPageReport/first_page_report_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class FirstPageReportRouter extends FlutterGetItModulePageRouter {
  const FirstPageReportRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => FirstPageReportViewModel()),
      ];

  @override
  WidgetBuilder get view => (_) => const FirstPageReportPage();
}
