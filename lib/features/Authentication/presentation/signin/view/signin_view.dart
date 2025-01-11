import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_by_msi/app/router/app_router.dart';
import 'package:flutter_template_by_msi/app/screens/home_screen/home_screen.dart';
import 'package:flutter_template_by_msi/features/Authentication/data/data_source/auth_datasource_impl.dart';
import 'package:flutter_template_by_msi/features/Authentication/data/repository/auth_repo_impl.dart';
import 'package:flutter_template_by_msi/features/Authentication/presentation/shared/bloc/auth_cubit.dart';
import 'package:flutter_template_by_msi/features/Authentication/presentation/signin/bloc/signin_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static const routeName = 'sign-in';

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepoImpl(authDataSource: AuthDataSourceImpl()),
      child: BlocProvider(
        create: (context) => SignInBloc(
          authRepo: context.read<AuthRepoImpl>(),
          authCubit: context.read<AuthCubit>(),
        ),
        child: SignInView(),
      ),
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
                    child: BlocConsumer<SignInBloc, SignInState>(
                      listener: (context, state) {
                        if (state.status == SignInStatus.success) {
                          clearAllRoutesAndGoToNamed(HomeScreen.routeName);
                        }

                        if (state.status == SignInStatus.failure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                            ),
                          );
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
                                    .read<SignInBloc>()
                                    .add(EmailChanged(email: value));
                              },
                              labelText: 'Email',
                            ),
                            GapSpacing.lg,
                            AppTextField.roundedBorder(
                              onChanged: (value) {
                                context
                                    .read<SignInBloc>()
                                    .add(PasswordChanged(password: value));
                              },
                              labelText: 'Password',
                            ),
                            GapSpacing.lg,
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<SignInBloc>()
                                      .add(const LoginSubmitted());
                                }
                              },
                              child: const Text('Sign In'),
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
