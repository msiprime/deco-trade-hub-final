import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_by_msi/app/screens/home_screen/src/ui/home_screen.dart';

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
      body: SignOutButton(),
    );
  }
}
