import 'package:provaflutter/import_collections.dart';

class $PagesLogin extends StatefulWidget {
  const $PagesLogin({super.key});

  @override
  State<$PagesLogin> createState() => _$PagesLoginState();
}

class _$PagesLoginState extends State<$PagesLogin> {
  final String _urlPrivacyPolicy = "https://google.com.br";
  final _formKey = GlobalKey<FormState>();

  // --------------------------------------------------------------------------- Check Button
  void _checkButton() {
    final validate = _formKey.currentState?.validate();
    if (validate == true) {
      final appState = context.read<ProvidersAppState>();
      appState.setAuthentication(true);
    }
  }

  // --------------------------------------------------------------------------- Validator User
  String? _validatorUser(String? text) {
    if (text == null || text.isEmpty) {
      return Languages.current.validatorIsEmpty;
    } else {
      return null;
    }
  }

  // --------------------------------------------------------------------------- Validator Password
  String? _validatorPass(String? text) {
    if (text == null || text.isEmpty) {
      return Languages.current.validatorIsEmpty;
    } else if (text.length < 2) {
      return Languages.current.validatorPassMin;
    } else {
      return null;
    }
  }

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Components.textFormField(
                            title: Languages.current.user,
                            prefixIcon: Assets.icons.userRounded,
                            prefixSizeIcon: 14,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20),
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                            validator: _validatorUser,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Components.textFormField(
                            title: Languages.current.password,
                            prefixIcon: Assets.icons.lockRounded,
                            prefixSizeIcon: 18,
                            obscureText: true,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20),
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z0-9]'),
                              ),
                            ],
                            validator: _validatorPass,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _checkButton,
                          child: Text(Languages.current.signIn),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: GestureDetector(
                onTap: () => Services.launcherUrl.open(_urlPrivacyPolicy),
                child: Text(Languages.current.privacyPolicy),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
