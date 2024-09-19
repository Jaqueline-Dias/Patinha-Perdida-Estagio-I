import 'package:app_patinha/src/modules/profile/widgets/button_password_reset.dart';
import 'package:app_patinha/src/modules/profile/widgets/container_profile.dart';
import 'package:app_patinha/src/modules/profile/widgets/pop_up_password_reset.dart';
import 'package:app_patinha/src/modules/profile/widgets/positioned_profile.dart';
import 'package:app_patinha/src/modules/profile/widgets/text_edit_controller_user.dart';
import 'package:app_patinha/src/modules/widgets/icon_button_patinha_perdida.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _emailEC = TextEditingController();
  final teste = null;

  //final isObscurePassword = signal(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButtonPatinhaPerdida(),
        title: const Text(
          "Perfil de usuário",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 15,
          top: 20,
          right: 15,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    //Imagem da foto e decoração do container
                    ContainerProfile(),

                    //Botão de editar perfil
                    PositionedProfile(
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              //Campos com os dados retornados do usuário
              TextEditControllerUser(
                labelText: "Nome completo",
                placeholder: teste ?? "Sem nome",
                icon: Icons.person,
              ),

              TextEditControllerUser(
                labelText: "Email",
                placeholder: teste ?? "Sem email",
                icon: Icons.email,
              ),

              //Botão de redefinição de senha
              ButtonPasswordReset(
                onPressed: () {
                  updatePassword();
                },
                text: "Redefinir senha",
              ),
            ],
          ),
        ),
      ),
    );
  }

//Redefinir senha
  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return PopUpPasswordReset(
          emailEC: _emailEC,
          onPressed: () {},
        );
      },
    );
  }
}
