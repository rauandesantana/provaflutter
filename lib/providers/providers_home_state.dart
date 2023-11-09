import 'package:mobx/mobx.dart';
import 'package:provaflutter/import_collections.dart';
part 'providers_home_state.g.dart';

// ============================================================================= Providers Home State
class ProvidersHomeState = ProvidersHomeStateBase with _$ProvidersHomeState;

// ============================================================================= Providers Home State Base
abstract class ProvidersHomeStateBase with Store {
  //////////////////////////////////////////////////////////////////////////////
  @observable
  List<ModalsTextItems> textList = [
    ModalsTextItems(
      id: 0,
      text: "Rauan1",
      editMode: false,
      deleteMode: false,
    ),
    ModalsTextItems(
      id: 1,
      text: "Rauan2",
      editMode: false,
      deleteMode: false,
    ),
    ModalsTextItems(
      id: 2,
      text: "Rauan3",
      editMode: false,
      deleteMode: false,
    ),
  ];

  @observable
  ModalsTextItems? selectedItem;

  @observable
  bool blockScreen = false;
  //////////////////////////////////////////////////////////////////////////////

  @action
  ModalsTextItems? activeEditMode(int index) {
    selectedItem = _switchMode(
      index: index,
      editMode: true,
      deleteMode: false,
    );
    return selectedItem;
  }

  @action
  ModalsTextItems? activeDeleteMode(int index) {
    selectedItem = _switchMode(
      index: index,
      editMode: false,
      deleteMode: true,
    );
    return selectedItem;
  }

  @action
  void addItem(String text) {
    textList.add(
      ModalsTextItems(
        id: textList.length,
        text: text,
        editMode: false,
        deleteMode: false,
      ),
    );
  }

  @action
  void editItem(String text) {
    if (selectedItem != null) {
      final editTextList = textList.map((textItem) {
        if (textItem.id == selectedItem!.id) textItem.text = text;
        return textItem;
      }).toList();

      textList = editTextList;
      deselectMode();
    }
  }

  @action
  void deleteItem() {
    if (selectedItem != null) {
      final editTextList = textList;
      editTextList.removeAt(selectedItem!.id);
      textList = editTextList;
      _listReindexing();
      deselectMode();
    }
  }

  @action
  void deselectMode() {
    selectedItem = _switchMode(
      index: null,
      editMode: false,
      deleteMode: false,
    );
  }

  @action
  void setBlockScreen(bool value) {
    if (blockScreen != value) {
      blockScreen = value;
    }
  }

  // --------------------------------------------------------------------------- Switch Mode
  ModalsTextItems? _switchMode({
    required int? index,
    required bool editMode,
    required bool deleteMode,
  }) {
    ModalsTextItems? returnSelectItem;

    final editTextList = textList.map((textItem) {
      final itemEditMode = textItem.editMode;
      final itemDeleteMode = textItem.deleteMode;
      final noEditMode = ((itemEditMode == false) != (editMode == false));
      final noDeleteMode = ((itemDeleteMode == false) != (deleteMode == false));
      final defaultMode = noEditMode || noDeleteMode;

      if (textItem.id == index && defaultMode) {
        textItem.editMode = editMode;
        textItem.deleteMode = deleteMode;
        returnSelectItem = textItem;
      } else {
        textItem.editMode = false;
        textItem.deleteMode = false;
      }

      return textItem;
    }).toList();

    textList = editTextList;
    return returnSelectItem;
  }

  // --------------------------------------------------------------------------- List Reindexing
  void _listReindexing() {
    int index = 0;

    final editTextList = textList.map((textItem) {
      textItem.id = index;
      index++;
      return textItem;
    }).toList();

    textList = editTextList;
  }
}
