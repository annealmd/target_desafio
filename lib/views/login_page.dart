import 'package:flutter/material.dart';
import 'package:target_test/core/theme.dart';

import 'widgets/politica_privacidade_button.dart';

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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [colorOne, colorTwo],
          ),
        ),
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
                TextFormField(
                  controller: userController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe um nome de usuário';
                    } else if (value.length > 21) {
                      userController.clear();
                      return 'Deve ter no máximo 20 caracteres';
                    } else if (!RegExp(r'^[a-zA-Z0-9\s]*[^\s]$')
                        .hasMatch(value)) {
                      userController.clear();
                      return 'Não deve conter espaço em branco no final.';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Senha',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 2) {
                      passwordController.clear();
                      return 'Deve ter no mínimo 2 caracteres';
                    } else if (value.length > 21) {
                      passwordController.clear();
                      return 'Deve ter no máximo 20 caracteres';
                    } else if (!RegExp(r'^[a-zA-Z0-9]*[^\\s]$')
                        .hasMatch(value)) {
                      passwordController.clear();
                      return 'Deve conter apenas letras e números';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.popAndPushNamed(context, '/infopage');
                      } else {
                        //TODO POPUP
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
