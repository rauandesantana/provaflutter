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
  //////////////////////////////////////////////////////////////////////////////

  @action
  void activeEditMode(int index) {
    _switchMode(
      index: index,
      editMode: true,
      deleteMode: false,
    );
  }

  @action
  void activeDeleteMode(int index) {
    _switchMode(
      index: index,
      editMode: false,
      deleteMode: true,
    );
  }

  // --------------------------------------------------------------------------- Switch Mode
  void _switchMode({
    required int index,
    required bool editMode,
    required bool deleteMode,
  }) {
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
  }
}
