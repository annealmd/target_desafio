import 'package:flutter/material.dart';
import 'package:target_test/controllers/info_controller.dart';
import 'package:target_test/core/theme.dart';

import 'widgets/politica_privacidade_button.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final InfoController controller = InfoController();
  final TextEditingController infoTextController = TextEditingController();

  final FocusNode infoFocusNode = FocusNode();

  @override
  void dispose() {
    infoTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> list = controller.infoList;

    var infoToBeEdited = {'text': '', 'index': 0};
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
                child: Card(
                  elevation: 8,
                  surfaceTintColor: Colors.white,
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (_, i) {
                        infoToBeEdited['text'] = list[i];
                        infoToBeEdited['index'] = i;
                        debugPrint('Editing $infoToBeEdited');
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
                                onPressed: () {},
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
                                onPressed: () {},
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, _) =>
                          const Divider(),
                      itemCount: list.length),
                ),
              ),
              const SizedBox(height: 50),
              TextField(
                autofocus: true,
                //focusNode: infoFocusNode,
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
                //focusNode: infoFocusNode,
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
}
