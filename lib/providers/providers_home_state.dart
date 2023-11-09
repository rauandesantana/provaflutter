import 'package:mobx/mobx.dart';
part 'providers_home_state.g.dart';

// ============================================================================= Providers Home State
class ProvidersHomeState = ProvidersHomeStateBase with _$ProvidersHomeState;

// ============================================================================= Providers Home State Base
abstract class ProvidersHomeStateBase with Store {
  //////////////////////////////////////////////////////////////////////////////
  @observable
  List<Map<String, dynamic>> textList = [
    {
      "id": 0,
      "text": "Rauan1",
      "editMode": false,
      "deleteMode": false,
    },
    {
      "id": 1,
      "text": "Rauan2",
      "editMode": false,
      "deleteMode": false,
    },
    {
      "id": 2,
      "text": "Rauan3",
      "editMode": false,
      "deleteMode": false,
    }
  ];

  @observable
  Map<String, dynamic>? selectedItem;
  //////////////////////////////////////////////////////////////////////////////

  @action
  Map<String, dynamic>? activeEditMode(int index) {
    selectedItem = _switchMode(
      index: index,
      editMode: true,
      deleteMode: false,
    );
    return selectedItem;
  }

  @action
  Map<String, dynamic>? activeDeleteMode(int index) {
    selectedItem = _switchMode(
      index: index,
      editMode: false,
      deleteMode: true,
    );
    return selectedItem;
  }

  @action
  void addItem(String text) {
    textList.add({
      "id": textList.length,
      "text": text,
      "editMode": false,
      "deleteMode": false,
    });
  }

  @action
  void editItem(String text) {
    if (selectedItem != null) {
      final editTextList = textList.map((textItem) {
        if (textItem["id"] == selectedItem!["id"]) {
          textItem.update("text", (value) => text);
        }

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
      editTextList.removeAt(selectedItem!["id"]);
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

  // --------------------------------------------------------------------------- Switch Mode
  Map<String, dynamic>? _switchMode({
    required int? index,
    required bool editMode,
    required bool deleteMode,
  }) {
    Map<String, dynamic>? returnSelectItem;

    final editTextList = textList.map((textItem) {
      final itemEditMode = textItem["editMode"];
      final itemDeleteMode = textItem["deleteMode"];
      final noEditMode = ((itemEditMode == false) != (editMode == false));
      final noDeleteMode = ((itemDeleteMode == false) != (deleteMode == false));
      final defaultMode = noEditMode || noDeleteMode;

      if (textItem["id"] == index && defaultMode) {
        textItem.updateAll((key, value) {
          if (key == "editMode") return editMode;
          if (key == "deleteMode") return deleteMode;
          return value;
        });
        returnSelectItem = textItem;
      } else {
        textItem.updateAll((key, value) {
          if (key == "editMode") return false;
          if (key == "deleteMode") return false;
          return value;
        });
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
      textItem.update("id", (value) => index);
      index++;
      return textItem;
    }).toList();

    textList = editTextList;
  }
}
