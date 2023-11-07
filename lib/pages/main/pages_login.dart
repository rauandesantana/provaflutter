import 'dart:convert';
import 'package:provaflutter/import_collections.dart';

class $PagesLogin extends StatefulWidget {
  const $PagesLogin({super.key});

  @override
  State<$PagesLogin> createState() => _$PagesLoginState();
}

class _$PagesLoginState extends State<$PagesLogin> {
  final String _urlPrivacyPolicy = "https://google.com.br";
  final _formKey = GlobalKey<FormState>();
  final _userControler = TextEditingController();
  final _passControler = TextEditingController();
  bool _isSignIn = true;

  // --------------------------------------------------------------------------- Check Button
  void _checkButton() {
    final validate = _formKey.currentState?.validate();
    if (validate == true) {
      if (_isSignIn) {
        // --------------------------------------------------------------------- Sign In
        final appState = context.read<ProvidersAppState>();
        final username = _userControler.text;
        final password = sha512.convert(utf8.encode(_passControler.text));

        Services.mockAPI
            .signIn(username: username, password: password.toString())
            .then((result) {
          if (result == null) {
            _showSnackBar(Languages.current.errorAuthentication);
          } else if (result == false) {
            _showSnackBar(Languages.current.invalidUserOrPass);
          }
          appState.setAuthentication(result ?? false);
        });
      } else {
        // --------------------------------------------------------------------- Sign Up

      }
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

  // --------------------------------------------------------------------------- Show SnackBar
  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        content: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
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
                        // ----------------------------------------------------- User Field
                        Components.textFormField(
                          controller: _userControler,
                          title: Languages.current.user,
                          prefixIcon: Assets.icons.userRounded,
                          prefixSizeIcon: 14,
                          validator: _validatorUser,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20),
                            FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 15)),
                        // ----------------------------------------------------- Password Field
                        Components.textFormField(
                          controller: _passControler,
                          title: Languages.current.password,
                          prefixIcon: Assets.icons.lockRounded,
                          prefixSizeIcon: 18,
                          obscureText: true,
                          validator: _validatorPass,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20),
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z0-9]'),
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 25)),
                        // ----------------------------------------------------- Sign In Button
                        ElevatedButton(
                          onPressed: _checkButton,
                          child: Text(
                            (_isSignIn)
                                ? Languages.current.signIn
                                : Languages.current.signUp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // ----------------------------------------------------------------- Privacy Policy Button
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        // --------------------------------------------------------------------- Toggle Button (Sign In / Sign Up)
        child: FloatingActionButton(
          onPressed: () => setState(() => _isSignIn = !_isSignIn),
          child: Icon(
            (_isSignIn) ? Icons.person_add_rounded : Icons.login_rounded,
          ),
        ),
      ),
    );
  }
}
