import 'package:flutter/material.dart';
import 'package:target_test/core/theme.dart';

import 'widgets/politica_privacidade_button.dart';


class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

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
        child: const SingleChildScrollView(),
      ),
      bottomNavigationBar: Container(
        color: colorTwo,
        width: double.infinity,
        alignment: Alignment.center,
        height: 80,
        child: const PoliticaPrivacidadeButton(),
      ),
    );
  }
}
