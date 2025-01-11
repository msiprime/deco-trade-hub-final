import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_by_msi/app/router/app_router.dart';
import 'package:flutter_template_by_msi/features/Authentication/data/data_source/auth_datasource_impl.dart';
import 'package:flutter_template_by_msi/features/Authentication/data/repository/auth_repo_impl.dart';
import 'package:flutter_template_by_msi/features/Authentication/presentation/shared/bloc/auth_cubit.dart';
import 'package:flutter_template_by_msi/features/Authentication/presentation/shared/widget/role_prompt_page.dart';
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
    return RepositoryProvider(
      create: (context) => AuthRepoImpl(
        authDataSource: AuthDataSourceImpl(),
      ),
      child: BlocProvider(
        create: (context) => SignUpBloc(
          authCubit: context.read<AuthCubit>(),
          authRepo: context.read<AuthRepoImpl>(),
        )..add(UserRoleChanged(userRole)),
        child: SignupView(),
      ),
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
                    child: BlocConsumer<SignUpBloc, SignUpState>(
                      listener: (context, state) {
                        if (state.status == SignUpStatus.submitting) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Signing Up...'),
                            ),
                          );
                        }

                        if (state.status == SignUpStatus.failure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                            ),
                          );
                        }

                        if (state.status == SignUpStatus.success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sign Up Successful'),
                            ),
                          );
                          clearAllRoutesAndGoToNamed(RolePromptPage.routeName);
                        }
                      },
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
                            Text(state.userRole),
                            Text(state.email),
                            Text(state.fullName),
                            Text(state.password),
                            Text(state.username),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<SignUpBloc>()
                                      .add(FormSubmitted());
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
