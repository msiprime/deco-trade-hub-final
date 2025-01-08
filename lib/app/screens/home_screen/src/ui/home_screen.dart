import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_by_msi/app/screens/home_screen/src/cubit/counter_cubit.dart';
import 'package:flutter_template_by_msi/services/dependencies/src/dependency_injection.dart';
import 'package:flutter_template_by_msi/ui/widgets/global/base_language_dropdown.dart';
import 'package:flutter_template_by_msi/ui/widgets/widgets.dart';
import 'package:localization/localization.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = 'home_screen';

  @override
  Widget build(BuildContext context) => BlocProvider<CounterCubit>(
        create: (context) => ServiceProvider.get(),
        child: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text('Home Screen', style: context.appTextTheme.body1),
              centerTitle: true,
              elevation: 10,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ThemeSwitch(),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: BlocBuilder<CounterCubit, int>(
                      builder: (context, counterState) {
                        return Text(
                          'Counter value: $counterState',
                          style: context.appTextTheme.body2,
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ),
                  BaseFilledButton(
                    text: 'Increment',
                    onPressed: context.read<CounterCubit>().increment,
                    backgroundColor: AppColorsTheme.green,
                  ),
                  const SizedBox(height: 10),
                  ShallowButton(
                    color: AppColorsTheme.gold,
                    text: 'Decrement',
                    onPressed: context.read<CounterCubit>().decrement,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    context.appLocalizations.connected,
                    style: context.appTextTheme.title4,
                  ),
                  const SizedBox(height: 10),
                  const LanguageDropdown(),
                  const SizedBox(height: 10),
                  const LanguageDropdown2(),
                ],
              ),
            ),
          ),
        ),
      );
}
