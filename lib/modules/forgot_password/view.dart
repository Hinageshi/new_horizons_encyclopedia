import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_card.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_primary_button.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_text_field.dart';
import 'package:new_horizons_encyclopedia/core/widgets/observers/busy_observer.dart';
import 'package:new_horizons_encyclopedia/core/widgets/observers/error_observer.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_account.dart';
import 'package:new_horizons_encyclopedia/l10n/l10n.dart';
import 'package:new_horizons_encyclopedia/modules/forgot_password/notifier.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';
import 'package:new_horizons_encyclopedia/theme/app_images.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider0<ForgotPasswordNotifier>(
      create: (_) => ForgotPasswordNotifier(),
      update: (context, old) =>
          old!..account = context.watch<AppwriteAccount>(),
      child: const Scaffold(
        backgroundColor: AppColors.secondary,
        body: ErrorObserver<ForgotPasswordNotifier>(
          child: BusyObserver<ForgotPasswordNotifier>(
            child: _InternalForgotPasswordView(),
          ),
        ),
      ),
    );
  }
}

class _InternalForgotPasswordView extends StatelessWidget {
  const _InternalForgotPasswordView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                AppImages.critterpedia,
                scale: 1.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppCard(
                elevation: 2,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 32,
                  ),
                  child: Column(
                    children: [
                      Text(
                        l10n.forgot_password_title,
                        style: AppTextStyles.title,
                      ),
                      const Gap(32),
                      Text(
                        l10n.forgot_password_description,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.inputLabel,
                      ),
                      const Gap(32),
                      const _ForgotPasswordForm(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SafeArea(
          bottom: false,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.surface,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.chevron_left_rounded,
                      color: AppColors.text,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ForgotPasswordForm extends StatefulWidget {
  const _ForgotPasswordForm({
    Key? key,
  }) : super(key: key);

  @override
  __ForgotPasswordFormState createState() => __ForgotPasswordFormState();
}

class __ForgotPasswordFormState extends State<_ForgotPasswordForm> {
  late TextEditingController email;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        AppTextField(
          controller: email,
          title: l10n.common_email,
          prefixIcon: Icons.alternate_email_rounded,
        ),
        const Gap(40),
        AppPrimaryButton(
          title: l10n.forgot_password_reset,
          onPressed: () {},
        ),
      ],
    );
  }
}
