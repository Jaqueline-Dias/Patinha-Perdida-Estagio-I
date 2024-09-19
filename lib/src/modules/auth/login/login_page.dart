import 'package:app_patinha/src/core/helpears/messages.dart';
import 'package:app_patinha/src/core/theme/patinha_perdida_theme.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MessageViewMixin {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  // final controller = Injector.get<LoginViewModel>();
/*
  @override
  void initState() {
    messageListener(controller);

    effect(() {
      if (controller.logged) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
    super.initState();
  }*/

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: PatinhaPerdidaTheme.violetDark,
      body: SingleChildScrollView(
        child: SizedBox(
          height: sizeOf.height,
          width: sizeOf.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/icone-patinha-perdida.png',
                          width: 200,
                        ),
                        const Center(
                          child: Text(
                            'Login',
                            style: Colors.pink,
                          ),
                        ),
                      ],
                    ),
                  ),

//Formulário
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
//---------------------------------CAMPOS DE EMAIL E SENHA----------------------------------
                          TextFormField(
                            controller: emailEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('Email obrigatório'),
                              Validatorless.email('Email inválido'),
                            ]),
                            decoration: const InputDecoration(
                              label: Text(
                                'Email',
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 24,
                          ),
                          Watch(
                            (_) {
                              return TextFormField(
                                // obscureText: controller.obscurePassword,
                                controller: passwordEC,
                                validator:
                                    Validatorless.required('Senha obrigatória'),
                                decoration: const InputDecoration(
                                  label: Text('Password'),
                                  /*suffixIcon: IconButton(
                                    onPressed: () {
                                   //   controller.passwordToggle();
                                    },
                                    icon: controller.obscurePassword
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off),
                                  ),*/
                                ),
                              );
                            },
                          ),

//Botão esqueceu a senha
                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Esqueceu sua senha?',
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          SizedBox(
                            width: sizeOf.width * .8,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                final valid =
                                    formKey.currentState?.validate() ?? false;

                                if (valid) {
                                  //   controller.login(
                                  //       emailEC.text, passwordEC.text);
                                }
                              },
                              child: const Text('ENTRAR'),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),

//Divisor
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.withAlpha(90),
                                    thickness: 2,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: Text('Ou'),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.withAlpha(90),
                                    thickness: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),

//------------------------------BOTÃO PARA LOGIN COM REDES SOCIAIS-------------------------------------------------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                    'assets/images/icone-patinha-perdida.png',
                                    width: 50,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              SizedBox(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                    'assets/images/icone-patinha-perdida.png',
                                    width: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 18,
                          ),

                          GestureDetector(
                            onTap: () {
                              //Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Não tem uma conta? Criar.',
                              style: PatinhaPerdidaTheme.subTitleSmallStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

//Botão para voltar
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
