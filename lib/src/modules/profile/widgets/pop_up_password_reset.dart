import 'package:app_patinha/src/core/theme/patinha_perdida_theme.dart';
import 'package:flutter/material.dart';

class PopUpPasswordReset extends StatelessWidget {
  const PopUpPasswordReset({
    super.key,
    required this.onPressed,
    required this.emailEC,
  });
  final TextEditingController? emailEC;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Redefinir senha",
        style: PatinhaPerdidaTheme.titleAlertDialog,
        textAlign: TextAlign.center,
      ),
      content: Text(
        "Enviar email para redefinição de sua senha de acesso a aplicação.",
        style: PatinhaPerdidaTheme.titleDescription,
        textAlign: TextAlign.justify,
      ),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Campo de email
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextField(
                controller: emailEC,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Informe seu email",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: Text("Enviar email"),
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancelar",
                style: PatinhaPerdidaTheme.subTitleSmallStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
