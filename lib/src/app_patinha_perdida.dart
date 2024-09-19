import 'package:app_patinha/src/core/patinha_perdida_config.dart';
import 'package:app_patinha/src/modules/about/about_module.dart';
import 'package:app_patinha/src/modules/auth/auth_module.dart';
import 'package:app_patinha/src/modules/developers/developers_module.dart';
import 'package:app_patinha/src/modules/feed/feed_module.dart';
import 'package:app_patinha/src/modules/help/help_module.dart';
import 'package:app_patinha/src/modules/home/home_module.dart';
import 'package:app_patinha/src/modules/profile/profile_module.dart';
import 'package:app_patinha/src/modules/report/report_module.dart';
import 'package:app_patinha/src/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class PatinhaPerdidaApp extends StatelessWidget {
  const PatinhaPerdidaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PatinhaPerdidaConfig(
      title: 'Patinha Perdida',
      // binding: LabClinicasApplicationBinding(),
      pagesBuilders: [
        FlutterGetItPageBuilder(
          page: (_) => const Splash(),
          path: '/',
        ),
      ],
      modules: [
        HomeModule(),
        AuthModule(),
        FeedModule(),
        HelpModule(),
        ReportModule(),
        AboutModule(),
        DevelopersModule(),
        ProfileModule(),
      ],
    );
  }
}
