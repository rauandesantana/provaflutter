import 'package:provaflutter/import_collections.dart';

class $PagesHome extends StatefulWidget {
  const $PagesHome({super.key});

  @override
  State<$PagesHome> createState() => _$PagesHomeState();
}

class _$PagesHomeState extends State<$PagesHome> {
  final String _urlPrivacyPolicy = "https://google.com.br";

  @override
  Widget build(BuildContext context) {
    final keyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final List<String> textList = ["Rauan", "Rauan2"];

    // ------------------------------------------------------------------------- Edit Action
    void editAction(int index) {

    }

    // ------------------------------------------------------------------------- Delete Action
    void deleteAction(int index) {

    }

    return Scaffold(
      body: Components.bodyGradient(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ------------------------------------------------------- Text List
                      Components.textList(
                        textList: textList,
                        itemBuilder: (context, index) {
                          return Observer(
                            builder: (context) {
                              // ----------------------------------------------- Text Item
                              return Components.textItem(
                                index: index,
                                text: textList[index],
                                editMode: false,
                                deleteMode: false,
                                editAction: editAction,
                                deleteAction: deleteAction,
                              );
                            },
                          );
                        },
                      ),
                      // ------------------------------------------------------- Text Field
                      Components.textFormField(
                        hintText: "Digite seu texto",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !keyboard,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(bottom: 25)),
                  // ----------------------------------------------------------- Privacy Policy Button
                  GestureDetector(
                    onTap: () => Services.launcherUrl.open(_urlPrivacyPolicy),
                    child: Text(Languages.current.privacyPolicy),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 25)),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            FloatingActionButton(
              onPressed: () {
                final appState = context.read<ProvidersAppState>();
                appState.signOut();
              },
              child: const Icon(Icons.logout_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
