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
  void editItem() {
    selectedItem = _switchMode(
      index: null,
      editMode: false,
      deleteMode: false,
    );
  }

  @action
  void deleteItem() {
    if(selectedItem != null) {
      final editTextList = textList;
      editTextList.removeAt(selectedItem!["id"]);
      textList = editTextList;



      selectedItem = _switchMode(
        index: null,
        editMode: false,
        deleteMode: false,
      );
    }
  }

  // --------------------------------------------------------------------------- Switch Mode
  Map<String, dynamic>? _switchMode({
    required int? index,
    required bool editMode,
    required bool deleteMode,
  }) {
    Map<String, dynamic>? returnSelectItem;

    final editTextList = textList.map((item) {
      final itemEditMode = item["editMode"];
      final itemDeleteMode = item["deleteMode"];
      final noEditMode = ((itemEditMode == false) != (editMode == false));
      final noDeleteMode = ((itemDeleteMode == false) != (deleteMode == false));
      final defaultMode = noEditMode || noDeleteMode;

      if (item["id"] == index && defaultMode) {
        item.updateAll((key, value) {
          if (key == "editMode") return editMode;
          if (key == "deleteMode") return deleteMode;
          return value;
        });
        returnSelectItem = item;
      } else {
        item.updateAll((key, value) {
          if (key == "editMode") return false;
          if (key == "deleteMode") return false;
          return value;
        });
      }

      return item;
    }).toList();

    textList = editTextList;
    return returnSelectItem;
  }
}
