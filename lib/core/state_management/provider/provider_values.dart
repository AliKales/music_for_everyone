import 'dart:io';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:music_for_everyone/common_libs.dart';

class ProviderValues {
  late AppLocalizations strings;

  List<String> get chartItems {
    return [
      strings.tracks,
      strings.albums,
      strings.artists,
    ];
  }

  ProviderValues() {
    Locale locale = AppLocalizations.supportedLocales.firstWhere(
      (element) => element.languageCode == Platform.localeName.split("_").first,
      orElse: () => const Locale('en'),
    );

    AppLocalizations.delegate.load(locale).then((value) => strings = value);
  }
}
