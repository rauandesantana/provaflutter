import 'package:mobx/mobx.dart';
import 'package:provaflutter/import_collections.dart';
part 'providers_home_state.g.dart';

// ============================================================================= Providers Home State
class ProvidersHomeState = ProvidersHomeStateBase with _$ProvidersHomeState;

// ============================================================================= Providers Home State Base
abstract class ProvidersHomeStateBase with Store {
  //////////////////////////////////////////////////////////////////////////////
  @observable
  List<ModalsTextItems> textList = [];

  @observable
  ModalsTextItems? selectedItem;

  @observable
  bool blockScreen = false;
  //////////////////////////////////////////////////////////////////////////////

  @action
  void initializeTextList(List<ModalsTextItems> initializedList) {
    if(textList.isEmpty) textList = initializedList;
  }

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
    final textItem = ModalsTextItems(
      id: textList.length,
      text: text,
      editMode: false,
      deleteMode: false,
    );

    Services.data.addData(textItem).then((result) => textList = result);
  }

  @action
  void editItem(String text) {
    if (selectedItem != null) {
      final editTextList = textList.map((textItem) {
        if (textItem.id == selectedItem!.id) textItem.text = text;
        return textItem;
      }).toList();

      Services.data.setData(editTextList).then((result) {
        textList = result;
        deselectMode();
      });
    }
  }

  @action
  void deleteItem() {
    if (selectedItem != null) {
      final editTextList = textList;
      editTextList.removeAt(selectedItem!.id);
      final reindexedList = _listReindexing(editTextList);

      Services.data.setData(reindexedList).then((result) {
        textList = result;
        deselectMode();
      });
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

    Services.data.setData(editTextList).then((result) => textList = result);
    return returnSelectItem;
  }

  // --------------------------------------------------------------------------- List Reindexing
  List<ModalsTextItems> _listReindexing(List<ModalsTextItems> reindexingList) {
    int index = 0;

    final editTextList = reindexingList.map((textItem) {
      textItem.id = index;
      index++;
      return textItem;
    }).toList();

    return editTextList;
  }
}
