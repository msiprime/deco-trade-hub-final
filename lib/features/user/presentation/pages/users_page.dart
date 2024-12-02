import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_by_msi/features/user/presentation/manager/user_bloc.dart';
import 'package:flutter_template_by_msi/services/dependencies/dependency_injection.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (_) => UserBloc(
      //   GetUsers(
      //     UserRepoImpl(UserDSImpl(Dio())),
      //   ),
      // ),
      create: (_) => ServiceProvider.get<UserBloc>(),
      child: const UserView(),
    );
  }
}

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  void initState() {
    context.read<UserBloc>().add(FetchUsers());
    super.initState();
  }

  // @override
  // void dispose() {
  //   context.read<UserBloc>().close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      builder: (context, state) {
        switch (state) {
          case UserInitial():
            return const SizedBox.shrink();
          case UserLoading():
            return const Center(child: CircularProgressIndicator());
          case UserLoaded():
            return AppScaffold(
              body: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    title: Text(user.name),
                  );
                },
              ),
            );
          case UserError():
            return Center(
              child: Text(state.message),
            );
          default:
            return const SizedBox.shrink();
        }
      },
      listener: (context, state) {},
    );
  }
}
