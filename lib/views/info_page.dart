import 'package:flutter/material.dart';
import 'package:target_test/core/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target_test/stores/info_store.dart';
import 'package:target_test/views/functions/functions.dart';

import 'widgets/politica_privacidade_button.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final TextEditingController infoTextController = TextEditingController();
  final _infoStore = InfoStore();

  final FocusNode infoFocusNode = FocusNode();
  bool editText = false;
  Map infoToBeEdited = {'text': '', 'index': -1};

  @override
  void dispose() {
    infoTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    infoFocusNode.requestFocus();
    return Scaffold(
      backgroundColor: colorTwo,
      body: Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [colorOne, colorTwo],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Observer(builder: (_) {
                  List<String> list = _infoStore.infoList;
                  return Card(
                    elevation: 8,
                    surfaceTintColor: Colors.white,
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (_, i) {
                          return ListTile(
                            title: Text(
                              list[i],
                              style: const TextStyle(
                                  overflow: TextOverflow.clip,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              maxLines: 5,
                            ),
                            trailing: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              alignment: WrapAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    editText = true;
                                    infoToBeEdited['text'] = list[i];
                                    infoToBeEdited['index'] = i;

                                    infoTextController.text =
                                        infoToBeEdited['text'];
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 30,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Color.fromARGB(255, 187, 16, 4)),
                                  ),
                                  onPressed: () {
                                    myShowDialog(context, i);

                                    //
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, _) =>
                            const Divider(),
                        itemCount: list.length),
                  );
                }),
              ),
              const SizedBox(height: 50),
              TextField(
                autofocus: true,
                //focusNode: infoFocusNode,
                showCursor: true,
                controller: infoTextController,
                maxLength: 50,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(5),
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  hintText: 'Digite seu texto',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onSubmitted: (value) {
                  if (infoTextController.text.isEmpty) {
                    //TODO popup
                  } else {
                    editText
                        ? _infoStore.editInfo(infoToBeEdited['index'],
                            infoTextController.text.trim())
                        : _infoStore.addInfo(infoTextController.text.trim());
                    infoTextController.clear();
                    editText = false;
                  }
                },
              )
            ],
          ),
        ),
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

  Future<void> myShowDialog(BuildContext context, int i) {
    return showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                            const Text('Apagar Informação'),
                                        content: const Text(
                                          'A informação será apagada e não será possível recuperá-la.',
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                            child: const Text('Cancelar'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                            child: const Text(
                                              'Apagar',
                                              style: TextStyle(
                                                  color: Color.fromARGB(255, 134, 10, 1)),
                                            ),
                                            onPressed: () {
                                              _infoStore.deleteInfo(i);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
  }
}
