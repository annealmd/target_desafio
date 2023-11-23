import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
    required this.userController,
  });

  final TextEditingController userController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: userController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autofocus: true,
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
        } else if (!RegExp(r'^[a-zA-Z0-9\s]*[^\s]$').hasMatch(value)) {
          userController.clear();
          return 'Não deve conter espaço em branco no final.';
        } else {
          return null;
        }
      },
    );
  }
}
