import 'package:provaflutter/import_collections.dart';

class $ComponentsTextList extends StatelessWidget {
  const $ComponentsTextList({
    super.key,
    required this.width,
    required this.height,
    required this.textList,
    required this.itemBuilder,
  });

  final double? width;
  final double? height;
  final List<String> textList;
  final NullableIndexedWidgetBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 50),
      child: SizedBox(
        width: width ?? 350,
        height: height ?? 320,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: ListView.separated(
            itemCount: textList.length,
            itemBuilder: itemBuilder,
            separatorBuilder: (context, index) => const Divider(height: 1),
          ),
        ),
      ),
    );
  }
}
