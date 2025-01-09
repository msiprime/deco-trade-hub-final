import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    required this.userRole,
    super.key,
  });

  static const routeName = 'sign-up';

  final String userRole;

  @override
  Widget build(BuildContext context) {
    logE('userRole: $userRole');
    return const SignupView();
  }
}

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverAppBar(
          //   title: const Text('Sign Up'),
          //   expandedHeight: 200,
          //   flexibleSpace: FlexibleSpaceBar(
          //     background: Image.network(
          //         'https://img.freepik.com/free-vector/background-realistic-abstract-technology-particle_23-2148431265.jpg?t=st=1736454067~exp=1736457667~hmac=1f772bbbcf547c3102e395f3d5ee1b9f03d8cec2d12dcd7e22ebebcff93a122d&w=1380'),
          //   ),
          // ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        AppTextField.roundedBorder(
                          controller: _fullNameController,
                          labelText: 'First Name',
                        ),
                        GapSpacing.lg,
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Process sign-up (e.g., send data to server)
                              // ...
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Sign Up Successful')),
                              );
                            }
                          },
                          child: const Text('Sign Up'),
                        ),
                      ],
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
