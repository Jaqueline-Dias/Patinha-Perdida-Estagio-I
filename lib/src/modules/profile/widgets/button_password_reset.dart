import 'package:app_patinha/src/core/theme/patinha_perdida_theme.dart';
import 'package:flutter/material.dart';

class ButtonPasswordReset extends StatelessWidget {
  const ButtonPasswordReset({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: PatinhaPerdidaTheme.violetDark,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
