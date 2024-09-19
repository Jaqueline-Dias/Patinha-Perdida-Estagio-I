import 'package:app_patinha/src/core/theme/patinha_perdida_theme.dart';
import 'package:flutter/material.dart';

class TextAbout extends StatelessWidget {
  const TextAbout({
    super.key,
    required this.paragraph,
  });

  final String paragraph;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        style: PatinhaPerdidaTheme.titleSubDescription,
        textAlign: TextAlign.justify,
        paragraph,
      ),
    );
  }
}
