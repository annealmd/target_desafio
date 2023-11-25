

import 'package:flutter/material.dart';

import '../functions/functions.dart';

class PoliticaPrivacidadeButton extends StatelessWidget {
  const PoliticaPrivacidadeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextButton(
        onPressed: callGoogle,
        child: Text(
          'Política de Privacidade',
          style: TextStyle(color: Colors.white),
        ));
  }
}
