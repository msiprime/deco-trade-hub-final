import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_by_msi/app/screens/home_screen/src/ui/home_screen.dart';
import 'package:flutter_template_by_msi/ui/widgets/global/global.dart';
import 'package:localization/l10n/extensions.dart';

class WholesalerHomePage extends StatelessWidget {
  const WholesalerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WholesalerHomeView();
  }
}

class WholesalerHomeView extends StatefulWidget {
  const WholesalerHomeView({super.key});

  @override
  State<WholesalerHomeView> createState() => _WholesalerHomeViewState();
}

class _WholesalerHomeViewState extends State<WholesalerHomeView> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Wholesaler Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ThemeSwitch(),
            const SizedBox(height: 20),
            Text(
              context.appLocalizations.connected,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 20),
            const LanguageDropdown(),
            const SizedBox(height: 20),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
