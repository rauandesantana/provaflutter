// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Languages {
  Languages();

  static Languages? _current;

  static Languages get current {
    assert(_current != null,
        'No instance of Languages was loaded. Try to initialize the Languages delegate before accessing Languages.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Languages> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Languages();
      Languages._current = instance;

      return instance;
    });
  }

  static Languages of(BuildContext context) {
    final instance = Languages.maybeOf(context);
    assert(instance != null,
        'No instance of Languages present in the widget tree. Did you add Languages.delegate in localizationsDelegates?');
    return instance!;
  }

  static Languages? maybeOf(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  /// `Erro`
  String get error {
    return Intl.message(
      'Erro',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Tente Novamente`
  String get tryAgain {
    return Intl.message(
      'Tente Novamente',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Entrar`
  String get signIn {
    return Intl.message(
      'Entrar',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Cadastrar`
  String get signUp {
    return Intl.message(
      'Cadastrar',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Política de Privacidade`
  String get privacyPolicy {
    return Intl.message(
      'Política de Privacidade',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Usuário`
  String get user {
    return Intl.message(
      'Usuário',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Senha`
  String get password {
    return Intl.message(
      'Senha',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Campo obrigatório.`
  String get validatorIsEmpty {
    return Intl.message(
      'Campo obrigatório.',
      name: 'validatorIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `A senha deve conter mais de um caractere.`
  String get validatorPassMin {
    return Intl.message(
      'A senha deve conter mais de um caractere.',
      name: 'validatorPassMin',
      desc: '',
      args: [],
    );
  }

  /// `Usuario ou senha inválidos.`
  String get invalidUserOrPass {
    return Intl.message(
      'Usuario ou senha inválidos.',
      name: 'invalidUserOrPass',
      desc: '',
      args: [],
    );
  }

  /// `Usuário inválido.`
  String get invalidUser {
    return Intl.message(
      'Usuário inválido.',
      name: 'invalidUser',
      desc: '',
      args: [],
    );
  }

  /// `Erro na autenticação.`
  String get errorAuthentication {
    return Intl.message(
      'Erro na autenticação.',
      name: 'errorAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `O Usuário foi criado com sucesso.`
  String get userCreatedSuccessfully {
    return Intl.message(
      'O Usuário foi criado com sucesso.',
      name: 'userCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Languages> load(Locale locale) => Languages.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
