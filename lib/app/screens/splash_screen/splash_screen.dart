import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template_by_msi/app/screens/error_screen/error_screen.dart';
import 'package:flutter_template_by_msi/blocs/app_meta_data_cubit/app_meta_data_cubit.dart';
import 'package:flutter_template_by_msi/features/Authentication/presentation/shared/widget/role_prompt_page.dart';
import 'package:flutter_template_by_msi/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:flutter_template_by_msi/services/dependencies/src/dependency_injection.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ServiceProvider.get<AppMetaDataCubit>().init();
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AppMetaDataCubit, AppMetaDataState>(
        listener: (context, appMetaDataState) {
          switch (appMetaDataState) {
            case AppMetaDataInitial():
            case AppMetaDataLoading():
            case AppMetaDataLoaded():
              if (appMetaDataState.isFirstTimer == 'false') {
                context.goNamed(RolePromptPage.routeName);
              } else {
                context.goNamed(OnBoardingView.routeName);
              }
            case AppMetaDataLoadingFailed():
              context.goNamed(ErrorScreen.routeName);
          }
        },
        builder: (context, appMetaDataState) {
          return BaseScreenWidget(
            loading: true,
            body: Center(
              child: SvgPicture.asset(
                'assets/svg/splash_deco_trade_hub.svg',
                width: 300,
                height: 300,
              ),
            ),
          );
        },
      );
}
