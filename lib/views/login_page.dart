import 'package:flutter/material.dart';
import 'package:target_test/core/theme.dart';

import 'functions/functions.dart';
import 'widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorTwo,
      body: Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: backgroundPage,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Usuário',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                UserWidget(userController: userController),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Senha',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                PasswordWidget(passwordController: passwordController),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.popAndPushNamed(context, '/infopage');
                      } else {
                        myShowSnackBar(
                            context: context,
                            message: 'Preencha os campos corretamente.');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorButton,
                      foregroundColor: Colors.white,
                      elevation: 8,
                      minimumSize: const Size(200, 40),
                    ),
                    child: const Text('Entrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
          color: colorTwo,
          width: double.infinity,
          alignment: Alignment.center,
          height: 80,
          child: const PoliticaPrivacidadeButton()),
    );
  }
}
