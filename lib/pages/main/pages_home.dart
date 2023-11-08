import 'package:provaflutter/import_collections.dart';

class $PagesHome extends StatefulWidget {
  const $PagesHome({super.key});

  @override
  State<$PagesHome> createState() => _$PagesHomeState();
}

class _$PagesHomeState extends State<$PagesHome> {
  late final ProvidersHomeState _homeState;
  final String _urlPrivacyPolicy = "https://google.com.br";

  @override
  void initState() {
    super.initState();
    _homeState = context.read<ProvidersHomeState>();
  }

  @override
  Widget build(BuildContext context) {
    final keyboard = MediaQuery.of(context).viewInsets.bottom != 0;

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
                        textList: _homeState.textList,
                        itemBuilder: (context, index) {
                          return Observer(
                            builder: (context) {
                              final textItem = _homeState.textList[index];
                              // ----------------------------------------------- Text Item
                              return Components.textItem(
                                index: index,
                                text: textItem["text"],
                                editMode: textItem["editMode"],
                                deleteMode: textItem["deleteMode"],
                                editAction: _homeState.activeEditMode,
                                deleteAction: _homeState.activeDeleteMode,
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
