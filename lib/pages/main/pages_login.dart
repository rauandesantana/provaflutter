import 'dart:convert';
import 'package:provaflutter/import_collections.dart';

class $PagesLogin extends StatefulWidget {
  const $PagesLogin({super.key});

  @override
  State<$PagesLogin> createState() => _$PagesLoginState();
}

class _$PagesLoginState extends State<$PagesLogin> {
  late final ProvidersLoginState _loginState;
  final String _urlPrivacyPolicy = "https://google.com.br";
  final _formKey = GlobalKey<FormState>();
  final _userControler = TextEditingController();
  final _passControler = TextEditingController();

  // --------------------------------------------------------------------------- Check Button
  void _checkButton() {
    final validate = _formKey.currentState?.validate();
    if (validate == true) {
      final appState = context.read<ProvidersAppState>();
      final username = _userControler.text;
      final password = sha512.convert(utf8.encode(_passControler.text));

      if (_loginState.isSignIn) {
        // --------------------------------------------------------------------- Sign In
        appState.signIn(username: username, password: password).then((text) {
          if (text != null) _showSnackBar(text);
        });
      } else {
        // --------------------------------------------------------------------- Sign Up
        appState.signUp(username: username, password: password).then((object) {
          final result = object as Map<String, dynamic>;
          Color? color;

          if (result["status"] == "success") {
            _userControler.clear();
            _passControler.clear();
            _loginState.setIsSignIn(true);
            color = Theme.of(context).colorScheme.secondary;
          }

          _showSnackBar(result["text"], color: color);
        });
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
  void _showSnackBar(String text, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color ?? Theme.of(context).colorScheme.error,
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
  void initState() {
    super.initState();
    _loginState = context.read<ProvidersLoginState>();
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
                          child: Observer(
                            builder: (context) {
                              return Text(
                                (_loginState.isSignIn)
                                    ? Languages.current.signIn
                                    : Languages.current.signUp,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 25)),
            // ----------------------------------------------------------------- Privacy Policy Button
            GestureDetector(
              onTap: () => Services.launcherUrl.open(_urlPrivacyPolicy),
              child: Text(Languages.current.privacyPolicy),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 25)),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Observer(
          builder: (context) {
            // ----------------------------------------------------------------- Toggle Button (Sign In / Sign Up)
            return FloatingActionButton(
              onPressed: () => _loginState.toggleIsSignIn(),
              child: Icon(
                (_loginState.isSignIn)
                    ? Icons.person_add_rounded
                    : Icons.login_rounded,
              ),
            );
          },
        ),
      ),
    );
  }
}
