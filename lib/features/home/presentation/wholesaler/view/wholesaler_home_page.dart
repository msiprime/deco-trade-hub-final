import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_by_msi/app/screens/home_screen/src/ui/home_screen.dart';

import '../../../../store/presentation/wholesaler/view/store_sign_up_form.dart';

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
      body: Column(
        children: [

          FilledButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StoreSignUpForm()));
              },
              child: Text('Go to Sign Up Form')),
          const SignOutButton(),
        ],
      ),
    );
  }
}
