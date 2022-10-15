import 'package:flutter/material.dart';
import 'package:music_for_everyone/core/state_management/provider/provider_page.dart';
import 'package:music_for_everyone/core/state_management/provider/provider_values.dart';
import 'package:provider/provider.dart';

class Providers extends StatelessWidget {
  const Providers({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderPage>(create: (_) => ProviderPage()),
        Provider<ProviderValues>(create: (c) => ProviderValues()),
      ],
      child: child,
    );
  }
}
