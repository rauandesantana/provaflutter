import 'package:provaflutter/import_collections.dart';

// ============================================================================= Services Messages
class $ServicesData {
  $ServicesData();
  //////////////////////////////////////////////////////////////////////////////
  static const key = "data";
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Add Data
  Future<List<ModalsTextItems>> addData(ModalsTextItems textItem) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(key)) {
      final List<String> data = prefs.getStringList(key) ?? [];
      data.add(textItem.toMap().toString());
      await prefs.setStringList(key, data);
    } else {
      final List<String> data = [textItem.toMap().toString()];
      await prefs.setStringList(key, data);
    }

    return await getData();
  }

  // --------------------------------------------------------------------------- Set Data
  Future<List<ModalsTextItems>> setData(List<ModalsTextItems> textList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);

    final data = textList.map((textItem) {
      return textItem.toMap().toString();
    }).toList();

    await prefs.setStringList(key, data);
    return await getData();
  }

  // --------------------------------------------------------------------------- Get Data
  Future<List<ModalsTextItems>> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final regex = RegExp(
      r'^{id:\s(?<id>.+),\stext:\s(?<text>.+),\seditMode:\s(?<editMode>.+),\sdeleteMode:\s(?<deleteMode>.+)}$',
    );

    try {
      if (prefs.containsKey(key)) {
        final List<String> data = prefs.getStringList(key) ?? [];

        return data.map((item) {
          final allMatches = regex.allMatches(item);
          final id = allMatches.first.namedGroup("id");
          final text = allMatches.first.namedGroup("text");
          final editMode = allMatches.first.namedGroup("editMode");
          final deleteMode = allMatches.first.namedGroup("deleteMode");

          return ModalsTextItems.fromMap({
            "id": int.tryParse(id ?? "0") ,
            "text": text,
            "editMode": bool.tryParse(editMode ?? "false"),
            "deleteMode": bool.tryParse(deleteMode ?? "false"),
          });
        }).toList();
      } else {
        throw "Empty";
      }
    } catch (error) {
      return [];
    }
  }
}
