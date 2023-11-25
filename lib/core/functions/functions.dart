import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchUrl() async {
  final Uri url = Uri.parse('https://google.com.br');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

Future<void> callGoogle() async {
  await _launchUrl();
}

Future<void> myDialogBuilder({
  required BuildContext context,
  required String title,
  required String content,
  Function? buttonAction,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(
          content,
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cancelar'),
            onPressed: () {
              //buttonAction;
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Apagar'),
            onPressed: () {
              buttonAction;
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

myShowSnackBar(
    {required BuildContext context,
    required String message,
    bool isError = true}) {
  var snackBar = SnackBar(
    elevation: 8,
    backgroundColor: isError
        ? const Color.fromARGB(255, 153, 12, 2)
        : const Color.fromARGB(255, 1, 90, 49),
    content: Text(message),
    duration: const Duration(seconds: 3),
    showCloseIcon: true,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
