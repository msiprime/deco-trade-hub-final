import 'package:app_ui/app_ui.dart';
import 'package:fconnectivity/fconnectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_by_msi/app/router/app_router.dart';
import 'package:flutter_template_by_msi/app/view/global_keys.dart';
import 'package:flutter_template_by_msi/blocs/app_meta_data_cubit/app_meta_data_cubit.dart';
import 'package:flutter_template_by_msi/blocs/localization_cubit/localization_cubit.dart';
import 'package:flutter_template_by_msi/blocs/theme_cubit/theme_cubit.dart';
import 'package:flutter_template_by_msi/features/Authentication/data/data_source/auth_datasource_impl.dart';
import 'package:flutter_template_by_msi/features/Authentication/data/repository/auth_repo_impl.dart';
import 'package:flutter_template_by_msi/features/Authentication/presentation/shared/bloc/auth_cubit.dart';
import 'package:flutter_template_by_msi/services/dependencies/src/dependency_injection.dart';
import 'package:localization/localization.dart';

/// The root widget of the application.
///
/// This widget sets up the BLoC providers, routing, theming, and localization
/// for the entire app. It also handles connectivity status.
class App extends StatefulWidget {
  /// Creates a [App].
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isFirstCapturedState = true;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<LocalizationCubit>(
            create: (_) => ServiceProvider.get<LocalizationCubit>(),
          ),
          BlocProvider<ThemeCubit>(
            create: (_) => ServiceProvider.get<ThemeCubit>(),
          ),
          BlocProvider<AppMetaDataCubit>(
            create: (_) => ServiceProvider.get<AppMetaDataCubit>(),
          ),
          BlocProvider<AuthCubit>(
            create: (_) => AuthCubit(
              authRepo: AuthRepoImpl(authDataSource: AuthDataSourceImpl()),
            )..checkSession(),
          ),
        ],
        child: Builder(
          builder: (context) {
            final language = context.watch<LocalizationCubit>().state;
            final theme = context.watch<ThemeCubit>().state;
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter,
              theme: theme.themeData,
              builder: (context, routerWidget) => Builder(
                builder: (context) {
                  var result = routerWidget!;

                  // Wrap the result widget with the InternetAccessCubitListener
                  result = InternetAccessListener(
                    onInternetAccessGained: (BuildContext context) {
                      // TODO(msi): handle connected state
                      if (!_isFirstCapturedState) {
                        context.showSuccessSnackBar(text: 'Connected');
                      }
                      _isFirstCapturedState = false;
                    },
                    onInternetAccessLost: (BuildContext context) {
                      // TODO(msi): handle disconnected state
                      context.showErrorSnackBar(text: 'Disconnected');
                      _isFirstCapturedState = false;
                    },
                    child: result,
                  );

                  // Wrap the result with a scaffold with a global key
                  // to be used to show snack bars from anywhere in the app
                  result = Scaffold(
                    key: globalScaffoldKey,
                    resizeToAvoidBottomInset: false,
                    body: result,
                  );

                  return result;
                },
              ),
              localizationsDelegates:
                  ModuleALocalizations.localizationsDelegates,
              supportedLocales: ModuleALocalizations.supportedLocales,
              locale: Locale.fromSubtags(languageCode: language.code),
            );
          },
        ),
      );
}
