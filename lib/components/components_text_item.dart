import 'package:provaflutter/import_collections.dart';

class $ComponentsTextItem extends StatelessWidget {
  const $ComponentsTextItem({
    super.key,
    required this.index,
    required this.text,
    required this.editMode,
    required this.deleteMode,
    required this.editAction,
    required this.deleteAction,
  });

  final int index;
  final String text;
  final bool editMode;
  final bool deleteMode;
  final void Function(int) editAction;
  final void Function(int) deleteAction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key("textItem${index.toString()}"),
      title: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ------------------------------------------------------------------- Edit Button
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: GestureDetector(
              onTap: () => editAction(index),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: (editMode)
                      ? Theme.of(context).colorScheme.secondary
                      : null,
                  width: 35,
                  height: 35,
                  child: Icon(
                    Assets.icons.editRounded,
                    color: (editMode)
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.secondary,
                    size: 26,
                  ),
                ),
              ),
            ),
          ),
          // ------------------------------------------------------------------- Delete Button
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => deleteAction(index),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color:
                      (deleteMode) ? Theme.of(context).colorScheme.error : null,
                  width: 35,
                  height: 35,
                  child: Icon(
                    Assets.icons.deleteRounded,
                    color: (deleteMode)
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.error,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
