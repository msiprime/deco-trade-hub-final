import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_by_msi/features/Authentication/presentation/shared/bloc/auth_cubit.dart';

class WholesalerHomePage extends StatelessWidget {
  const WholesalerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WholesalerHomeView();
  }
}

class WholesalerHomeView extends StatelessWidget {
  const WholesalerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Wholesaler Home Page'),
                if (state is Authenticated)
                  Center(
                      child:
                          Text('Welcome ${state.user.userMetadata!['role']}')),
              ],
            );
          },
        ),
      ),
    );
  }
}
