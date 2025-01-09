import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template_by_msi/features/onboarding/presentation/widget/widget.dart';
import 'package:flutter_template_by_msi/services/dependencies/src/dependency_injection.dart';
import 'package:persistent_storage/persistent_storage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends HookWidget {
  const OnBoardingView({super.key});

  static const routeName = 'onboarding_view';

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentPage = useState(0);

    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  currentPage.value = index;
                },
                children: const [
                  OnBoardingPage1(),
                  OnBoardingPage2(),
                  OnBoardingPage3(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (currentPage.value == 2)
                  FilledButton(
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(
                        const Size(35, 30),
                      ),
                    ),
                    onPressed: () async {
                      // Await the storage instance

                      try {
                        final storage = manualSl.get<PersistentStorage>();
                      } catch (e) {
                        await context.showInfoDialog(
                          title: 'error',
                          content: e.toString(),
                        );
                      }

                      // Write to storage
                      // await storage.write(key: 'firstTimer', value: 'false');

                      // Show dialog with the value from storage
                      //First Timer: ${await storage.read(key: 'firstTimer')}
                      await context.showInfoDialog(
                        title: 'Welcome',
                        content: '',
                      );
                    },
                    child: const Text('Next'),
                  )
                      .animate()
                      .slideX(duration: 500.ms, begin: 0.09)
                      .fadeIn(duration: 200.ms)
                else
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: context.theme.primaryColor,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
