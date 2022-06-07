import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_horizons_encyclopedia/core/widgets/notifier_loader.dart';
import 'package:new_horizons_encyclopedia/core/widgets/observers/busy_observer.dart';
import 'package:new_horizons_encyclopedia/core/widgets/observers/error_observer.dart';
import 'package:new_horizons_encyclopedia/core/widgets/observers/value_observer.dart';
import 'package:new_horizons_encyclopedia/data/entities/authentication_result.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_account.dart';
import 'package:new_horizons_encyclopedia/modules/home/view.dart';
import 'package:new_horizons_encyclopedia/modules/sign_in/view.dart';
import 'package:new_horizons_encyclopedia/modules/splash/notifier.dart';
import 'package:new_horizons_encyclopedia/notifiers/current_user.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';
import 'package:new_horizons_encyclopedia/theme/app_images.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider0<SplashNotifier>(
      create: (_) => SplashNotifier(),
      update: (context, old) => old!
        ..account = context.watch<AppwriteAccount>()
        ..currentUserNotifier = context.watch<CurrentUserNotifier>(),
      child: const Scaffold(
        backgroundColor: AppColors.secondary,
        body: NotifierLoader<SplashNotifier>(
          child: ErrorObserver<SplashNotifier>(
            child: BusyObserver<SplashNotifier>(
              child: _InternalSplashView(),
            ),
          ),
        ),
      ),
    );
  }
}

class _InternalSplashView extends StatelessWidget {
  const _InternalSplashView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenticationResult = context.select(
      (SplashNotifier notifier) => notifier.authenticationResult,
    );

    return ValueObserver<AuthenticationResult?>(
      value: authenticationResult,
      onUpdated: (value) => _handleAuthenticationResult(context, value),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.critterpedia,
              scale: 1.5,
            ),
            const Gap(32),
            const CircularProgressIndicator(
              color: AppColors.surface,
            ),
          ],
        ),
      ),
    );
  }

  void _handleAuthenticationResult(
    BuildContext context,
    AuthenticationResult? result,
  ) {
    switch (result) {
      case AuthenticationResult.navigateToHome:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<HomeView>(
            builder: (context) => const HomeView(),
          ),
        );
        break;
      case AuthenticationResult.navigateToAuthentication:
      default:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<SignInView>(
            builder: (context) => const SignInView(),
          ),
        );
        break;
    }
  }
}
