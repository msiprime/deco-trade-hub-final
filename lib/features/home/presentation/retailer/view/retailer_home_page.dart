import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_by_msi/app/screens/home_screen/src/ui/home_screen.dart';
import 'package:flutter_template_by_msi/services/dependencies/dependency_injection.dart';
import 'package:flutter_template_by_msi/ui/widgets/global/language_dropdown.dart';
import 'package:flutter_template_by_msi/ui/widgets/global/theme_switch.dart';
import 'package:localization/localization.dart';
import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RetailerHomePage extends StatelessWidget {
  const RetailerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RetailerHomeView();
  }
}

class RetailerHomeView extends StatelessWidget {
  const RetailerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Retailer Home'),
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
            IconButton(
              onPressed: () async {
                final restClient = manualSl.get<RestClient>();

                try {
                  final response =
                      await restClient.get('profiles', queryParams: {
                    'id': 'eq.${Supabase.instance.client.auth.currentUser?.id}',
                  });
                  logE('Get response: $response');
                  final response2 = await restClient.patch(
                    'profiles',
                    data: {
                      'full_name': 'Msi Sakib',
                      'username': 'msiprime',
                    },
                    queryParams: {
                      'id':
                          'eq.${Supabase.instance.client.auth.currentUser?.id}',
                    },
                  );
                  logE('Insert response: $response2');
                } catch (e) {
                  logE('Error: $e');
                }
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
