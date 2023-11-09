import 'package:provaflutter/import_collections.dart';

class $ComponentsBottomSheet extends StatelessWidget {
  const $ComponentsBottomSheet({
    super.key,
    required this.persistent,
    required this.height,
    required this.onWillPop,
    required this.cancelAction,
    required this.confirmAction,
    required this.children,
  });

  final bool? persistent;
  final double? height;
  final VoidCallback? onWillPop;
  final VoidCallback? cancelAction;
  final VoidCallback? confirmAction;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onWillPop != null) onWillPop!();
        if (cancelAction == null && confirmAction == null) return true;
        if (persistent == null) return true;
        return !persistent!;
      },
      child: Container(
        width: double.infinity,
        height: height,
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints(maxWidth: 400, minHeight: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              // --------------------------------------------------------------- Children
              child: Column(
                children: children,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ------------------------------------------------------------- Cancel Button
                ElevatedButton(
                  onPressed: () {
                    if (cancelAction != null) {
                      cancelAction!();
                      if (context.canPop()) context.pop();
                    }
                  },
                  child: Text(Languages.current.cancel),
                ),
                // ------------------------------------------------------------- Confirm Button
                ElevatedButton(
                  onPressed: () {
                    if (confirmAction != null) {
                      confirmAction!();
                      if (context.canPop()) context.pop();
                    }
                  },
                  child: Text(Languages.current.confirm),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 25)),
          ],
        ),
      ),
    );
  }
}
