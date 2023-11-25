import 'package:flutter/material.dart';
import 'package:target_test/modules/info/stores/info_store.dart';



Future<void> myShowDialog(BuildContext context, int i, InfoStore infoStore) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Apagar Informação'),
        content: const Text(
          'A informação será apagada e não será possível recuperá-la.',
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              'Apagar',
              style: TextStyle(color: Color.fromARGB(255, 134, 10, 1)),
            ),
            onPressed: () {
              infoStore.deleteInfo(i);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
