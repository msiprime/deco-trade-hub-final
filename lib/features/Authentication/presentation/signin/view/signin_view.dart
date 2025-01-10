import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_by_msi/features/Authentication/presentation/signin/bloc/signin_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static const routeName = 'sign-in';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: SignInView(),
    );
  }
}

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: BlocBuilder<SignInBloc, SignInState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            Text(
                              'Welcome to Deco Trade Hub',
                              style: context.titleLarge,
                            ),

                            GapSpacing.lg,
                            AppTextField.roundedBorder(
                              onChanged: (value) {},
                              labelText: 'Email',
                            ),
                            GapSpacing.lg,
                            AppTextField.roundedBorder(
                              onChanged: (value) {},
                              labelText: 'Password',
                            ),
                            GapSpacing.lg,
                            // Text(state.email),
                            // Text(state.password),

                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Sign Up Successful')),
                                  );
                                }
                              },
                              child: const Text('Sign Up'),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
