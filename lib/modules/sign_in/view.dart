import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_card.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_check_box.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_link.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_primary_button.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_text_field.dart';
import 'package:new_horizons_encyclopedia/core/widgets/observers/busy_observer.dart';
import 'package:new_horizons_encyclopedia/core/widgets/observers/error_observer.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_account.dart';
import 'package:new_horizons_encyclopedia/l10n/l10n.dart';
import 'package:new_horizons_encyclopedia/modules/sign_in/notifier.dart';
import 'package:new_horizons_encyclopedia/notifiers/current_user.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';
import 'package:new_horizons_encyclopedia/theme/app_images.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {
  const SignInView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider0<SignInNotifier>(
      create: (_) => SignInNotifier(),
      update: (context, old) => old!
        ..account = context.watch<AppwriteAccount>()
        ..currentUserNotifier = context.watch<CurrentUserNotifier>(),
      child: const Scaffold(
        backgroundColor: AppColors.secondary,
        body: ErrorObserver<SignInNotifier>(
          child: BusyObserver<SignInNotifier>(
            child: _InternalSignInView(),
          ),
        ),
      ),
    );
  }
}

class _InternalSignInView extends StatelessWidget {
  const _InternalSignInView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final notifier = context.watch<SignInNotifier>();

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
                        l10n.sign_in_title,
                        style: AppTextStyles.title,
                      ),
                      const Gap(32),
                      const _SignInForm(),
                      const Gap(16),
                      AppLink(
                        title: l10n.forgot_password_title,
                        onPressed: () => notifier.pushForgotPasswordView(
                          context,
                        ),
                      ),
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
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () => notifier.pushRegisterView(context),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.surface,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    child: Text(
                      l10n.register_title,
                      style: AppTextStyles.cardTitle,
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

class _SignInForm extends StatefulWidget {
  const _SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  __SignInFormState createState() => __SignInFormState();
}

class __SignInFormState extends State<_SignInForm> {
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final notifier = context.watch<SignInNotifier>();

    return Column(
      children: [
        AppTextField(
          controller: email,
          title: l10n.common_email,
          prefixIcon: Icons.alternate_email_rounded,
        ),
        const Gap(16),
        _PasswordTextField(
          controller: password,
        ),
        const Gap(8),
        const _RememberMeRow(),
        const Gap(40),
        AppPrimaryButton(
          title: l10n.sign_in_button,
          onPressed: () => notifier.signIn(
            context,
            email: email.text,
            password: password.text,
          ),
        ),
      ],
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  __PasswordTextFieldState createState() => __PasswordTextFieldState();
}

class __PasswordTextFieldState extends State<_PasswordTextField> {
  bool hideText = true;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppTextField(
      controller: widget.controller,
      title: l10n.common_password,
      prefixIcon: Icons.lock_rounded,
      suffixIcon:
          hideText ? Icons.visibility_rounded : Icons.visibility_off_rounded,
      obscureText: hideText,
    );
  }
}

class _RememberMeRow extends StatelessWidget {
  const _RememberMeRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final notifier = context.watch<SignInNotifier>();

    return Row(
      children: [
        AppCheckBox(
          value: notifier.rememberMe,
          onChanged: (newValue) {
            if (newValue != null) {
              notifier.rememberMe = newValue;
            }
          },
        ),
        const Gap(8),
        Text(
          l10n.sign_in_remember_me,
          style: AppTextStyles.cardBody,
        ),
      ],
    );
  }
}
