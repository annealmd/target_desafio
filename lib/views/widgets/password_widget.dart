import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        } else if (!RegExp(r'^[a-zA-Z0-9]*[^\\s]$').hasMatch(value)) {
          passwordController.clear();
          return 'Deve conter apenas letras e números';
        } else {
          return null;
        }
      },
    );
  }
}
