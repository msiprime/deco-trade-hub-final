import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
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
                    onPressed: () {
                      // context.goNamed(Routes.signIn);
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

class OnBoardingPage1 extends StatelessWidget {
  const OnBoardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    print(Assets.lottie.onboardingPageOneLottie.path);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
            'packages/app_ui/assets/lottie/onboarding_page_one_lottie.json'),
        const SizedBox(height: 24),
        Text(
          'Welcome to Your Ultimate Home Decor Hub!',
          style: context.textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Discover the best home decor items and manage your '
          'inventory with ease.',
          style: context.textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class OnBoardingPage2 extends StatelessWidget {
  const OnBoardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
            'packages/app_ui/${Assets.lottie.onboardingPageTwoLottie.path}'),
        const SizedBox(height: 24),
        Text(
          'Manage Your Stores with Ease',
          style: context.textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Create and manage up to 5 stores effortlessly. '
          'Keep your customers informed with real-time updates.',
          style: context.textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class OnBoardingPage3 extends StatelessWidget {
  const OnBoardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
            'packages/app_ui/${Assets.lottie.onboardingPageThreeLottie.path}'),
        const SizedBox(height: 24),
        Text(
          'Showcase Your Unique Collection',
          style: context.textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Let the world see your beautiful collections.'
          ' Your stores are publicly accessible, allowing other '
          'users to explore what you offer.',
          style: context.textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
