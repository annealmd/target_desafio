import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:target_test/core/functions/functions.dart';
import 'package:target_test/core/theme.dart';
import 'package:target_test/core/widgets/widgets.dart';
import 'package:target_test/modules/info/models/info_model.dart';
import 'package:target_test/modules/info/stores/info_store.dart';
import 'functions/functions.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final TextEditingController infoTextController = TextEditingController();
  final _infoStore = Modular.get<InfoStore>();

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
          decoration: backgroundPage,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Observer(builder: (_) {
                    List<InfoModel> list = _infoStore.infoList;
                    return Card(
                      elevation: 8,
                      surfaceTintColor: Colors.white,
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (_, i) {
                            return ListTile(
                              title: Text(
                                list[i].title,
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
                                      infoToBeEdited['text'] = list[i].title;
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
                                      myShowDialog(context, i, _infoStore);

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
                  autofocus: true, //comenta aqui
                  //focusNode: infoFocusNode, // descomenta essa linha
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
                      myShowSnackBar(
                          context: context, message: 'Digite o seu Texto');
                    } else {
                      String infoTitle = infoTextController.text.trim();
                      editText
                          ? _infoStore.editInfo(
                              infoTitle,
                              infoToBeEdited['index'],
                            )
                          : _infoStore.addInfo(infoTitle);
                      infoTextController.clear();
                      editText = false;
                    }
                  },
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomContainer());
  }
}
