import 'package:provaflutter/import_collections.dart';

class $PagesHome extends StatefulWidget {
  const $PagesHome({super.key});

  @override
  State<$PagesHome> createState() => _$PagesHomeState();
}

class _$PagesHomeState extends State<$PagesHome> {
  late final ProvidersHomeState _homeState;
  final String _urlPrivacyPolicy = "https://google.com.br";
  final _textController = TextEditingController();
  final _focusNode = FocusNode(
    canRequestFocus: true,
    skipTraversal: true,
  );

  // --------------------------------------------------------------------------- Edit Action
  void _editAction(int index) {
    final textItem = _homeState.activeEditMode(index);

    if (textItem != null) {
      _textController.text = textItem["text"];
      _focusNode.requestFocus();
    } else {
      _textController.clear();
      _focusNode.unfocus();
    }
  }

  // --------------------------------------------------------------------------- Delete Action
  void _deleteAction(int index) {
    _textController.clear();
    final textItem = _homeState.activeDeleteMode(index);
    if (textItem != null) {
      Services.messages.showBottomSheet(
        context: context,
        child: Components.bottomSheet(
          height: 180,
          onWillPop: () => _homeState.deselectMode(),
          cancelAction: () => _homeState.deselectMode(),
          confirmAction: () => _homeState.deleteItem(),
          children: [
            Text(
              Languages.current.deletionConfirmationText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              textItem["text"],
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
  }

  // --------------------------------------------------------------------------- Keyboard Action
  void _keyboardAction(bool editMode) {
    if (editMode == true) {
      _homeState.editItem(_textController.text);
      _textController.clear();
    } else {
      _homeState.addItem(_textController.text);
      _textController.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    _homeState = context.read<ProvidersHomeState>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _homeState.setBlockScreen(MediaQuery.of(context).viewInsets.bottom != 0);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final selectItem = _homeState.selectedItem;
        final selectEditMode = selectItem?["editMode"] ?? false;

        return Components.blockScreen(
          isBlocked: _homeState.blockScreen,
          child: Scaffold(
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
                            // ------------------------------------------------- Text List
                            Components.textList(
                              textList: _homeState.textList,
                              itemBuilder: (context, index) {
                                final textItem = _homeState.textList[index];
                                // --------------------------------------------- Text Item
                                return Components.textItem(
                                  index: index,
                                  text: textItem["text"],
                                  editMode: textItem["editMode"],
                                  deleteMode: textItem["deleteMode"],
                                  editAction: _editAction,
                                  deleteAction: _deleteAction,
                                );
                              },
                            ),
                            // ------------------------------------------------- Text Field
                            Components.textFormField(
                              controller: _textController,
                              focusNode: _focusNode,
                              hintText: Languages.current.enterYourText,
                              textAlign: TextAlign.center,
                              prefixSizeIcon: 14,
                              prefixIcon: (selectEditMode == true)
                                  ? Icons.edit_rounded
                                  : null,
                              keyboardAction: () {
                                _keyboardAction(selectEditMode);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !_homeState.blockScreen,
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(bottom: 25)),
                        // ----------------------------------------------------- Privacy Policy Button
                        GestureDetector(
                          onTap: () =>
                              Services.launcherUrl.open(_urlPrivacyPolicy),
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
                  // ----------------------------------------------------------- Sign Out Button
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
          ),
        );
      },
    );
  }
}
