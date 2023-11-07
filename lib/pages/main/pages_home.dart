import 'package:provaflutter/import_collections.dart';

class $PagesHome extends StatelessWidget {
  const $PagesHome({super.key});

  @override
  Widget build(BuildContext context) {
    const String urlPrivacyPolicy = "https://google.com.br";

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


                      // ------------------------------------------------------- XXXXX Field
                      Components.textFormField(
                        hintText: "Digite seu texto",
                      ),





                    ],
                  ),
                ),
              ),
            ),
            // ----------------------------------------------------------------- Privacy Policy Button
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: GestureDetector(
                onTap: () => Services.launcherUrl.open(urlPrivacyPolicy),
                child: Text(Languages.current.privacyPolicy),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
