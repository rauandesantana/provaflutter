import 'package:provaflutter/import_collections.dart';

class $PagesLogin extends StatefulWidget {
  const $PagesLogin({super.key});

  @override
  State<$PagesLogin> createState() => _$PagesLoginState();
}

class _$PagesLoginState extends State<$PagesLogin> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Components.bodyGradient(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(Languages.current.signIn),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
