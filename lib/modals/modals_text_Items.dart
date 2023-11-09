
// ============================================================================= Modals Text Items
class ModalsTextItems {
  ModalsTextItems({
    required this.id,
    required this.text,
    required this.editMode,
    required this.deleteMode,
  });

  //////////////////////////////////////////////////////////////////////////////
  late int id;
  late String text;
  late bool editMode;
  late bool deleteMode;
  //////////////////////////////////////////////////////////////////////////////
  static ModalsTextItems fromMap(Map<String, dynamic> map){
    late int id;
    late String text;
    late bool editMode;
    late bool deleteMode;

    map.forEach((key, value) {
      if(key == "id") id = value;
      if(key == "text") text = value;
      if(key == "editMode") editMode = value;
      if(key == "deleteMode") deleteMode = value;
    });

    return ModalsTextItems(
      id: id,
      text: text,
      editMode: editMode,
      deleteMode: deleteMode,
    );
  }
}
