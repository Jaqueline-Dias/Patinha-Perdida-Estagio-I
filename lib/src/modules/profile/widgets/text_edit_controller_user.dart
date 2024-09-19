import 'package:app_patinha/src/core/theme/patinha_perdida_theme.dart';
import 'package:flutter/material.dart';

class TextEditControllerUser extends StatefulWidget {
  const TextEditControllerUser({
    super.key,
    required this.labelText,
    required this.placeholder,
    required this.icon,
  });

  final String labelText;
  final String placeholder;
  final IconData icon;

  @override
  State<TextEditControllerUser> createState() => _TextEditControllerUserState();
}

class _TextEditControllerUserState extends State<TextEditControllerUser> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          contentPadding: const EdgeInsets.all(16),
          labelText: widget.labelText,
          enabled: false,
          labelStyle: TextStyle(
            color: PatinhaPerdidaTheme.violetDark,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.placeholder,
          hintStyle: PatinhaPerdidaTheme.titleDescription,
        ),
      ),
    );
  }
}
