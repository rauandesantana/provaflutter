import 'package:provaflutter/import_collections.dart';

class $PagesLogin extends StatefulWidget {
  const $PagesLogin({super.key});

  @override
  State<$PagesLogin> createState() => _$PagesLoginState();
}

class _$PagesLoginState extends State<$PagesLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Components.bodyGradient(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [




                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Components.textFormField(
                          title: "Usuário",
                          prefixIcon: Assets.icons.userRounded,
                          prefixSizeIcon: 14,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Components.textFormField(
                          title: "Senha",
                          prefixIcon: Assets.icons.lockRounded,
                          prefixSizeIcon: 18,
                          obscureText: true,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20),
                          ],
                        ),
                      ),






                      ElevatedButton(
                        onPressed: () {},
                        child: Text(Languages.current.signIn),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: Text("Política de Privacidade"),
            ),
          ],
        ),
      ),
    );
  }
}
