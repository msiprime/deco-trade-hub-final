import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_by_msi/features/Authentication/presentation/signup/bloc/signup_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    required this.userRole,
    super.key,
  });

  static const routeName = 'sign-up';

  final String userRole;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc()..add(UserRoleChanged(userRole)),
      child: SignupView(),
    );
  }
}

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: BlocBuilder<SignUpBloc, SignUpState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            Text(
                              'Welcome to Deco Trade Hub',
                              style: context.titleLarge,
                            ),
                            GapSpacing.lg,
                            AppTextField.roundedBorder(
                              onChanged: (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(FullNameChanged(value));
                              },
                              labelText: 'First Name',
                            ),
                            GapSpacing.lg,
                            AppTextField.roundedBorder(
                              onChanged: (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(UsernameChanged(value));
                              },
                              labelText: 'User Name',
                            ),
                            GapSpacing.lg,
                            AppTextField.roundedBorder(
                              onChanged: (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(EmailChanged(value));
                              },
                              labelText: 'Email',
                            ),
                            GapSpacing.lg,
                            AppTextField.roundedBorder(
                              onChanged: (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(PasswordChanged(value));
                              },
                              labelText: 'Password',
                            ),
                            GapSpacing.lg,
                            Text(state.userRole),
                            Text(state.email),
                            Text(state.fullName),
                            Text(state.password),
                            Text(state.username),
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

//DropdownButton(
//                               onChanged: (value) {
//                                 context
//                                     .read<SignUpBloc>()
//                                     .add(UserRoleChanged(value!));
//                               },
//                               value: state.userRole,
//                               items: const [
//                                 DropdownMenuItem(
//                                   value: 'Retailer',
//                                   child: Text('Retailer'),
//                                 ),
//                                 DropdownMenuItem(
//                                   value: 'Wholesaler',
//                                   child: Text('Wholesaler'),
//                                 ),
//                               ],
//                             ),
