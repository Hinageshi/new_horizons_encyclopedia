import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_card.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_primary_button.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_text_field.dart';
import 'package:new_horizons_encyclopedia/core/widgets/observers/busy_observer.dart';
import 'package:new_horizons_encyclopedia/core/widgets/observers/error_observer.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_account.dart';
import 'package:new_horizons_encyclopedia/l10n/l10n.dart';
import 'package:new_horizons_encyclopedia/modules/sign_up/notifier.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';
import 'package:new_horizons_encyclopedia/theme/app_images.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider0<SignUpNotifier>(
      create: (_) => SignUpNotifier(),
      update: (context, old) =>
          old!..account = context.watch<AppwriteAccount>(),
      child: const Scaffold(
        backgroundColor: AppColors.secondary,
        body: ErrorObserver<SignUpNotifier>(
          child: BusyObserver<SignUpNotifier>(
            child: _InternalSignUpView(),
          ),
        ),
      ),
    );
  }
}

class _InternalSignUpView extends StatelessWidget {
  const _InternalSignUpView({
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
                        l10n.sign_up_title,
                        style: AppTextStyles.title,
                      ),
                      const Gap(32),
                      const _SignUpForm(),
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
              padding: const EdgeInsets.all(8),
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

class _SignUpForm extends StatefulWidget {
  const _SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  __SignUpFormState createState() => __SignUpFormState();
}

class __SignUpFormState extends State<_SignUpForm> {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final notifier = context.watch<SignUpNotifier>();

    return Column(
      children: [
        AppTextField(
          controller: name,
          title: l10n.sign_up_name,
          prefixIcon: Icons.person_rounded,
        ),
        const Gap(16),
        AppTextField(
          controller: email,
          title: l10n.common_email,
          prefixIcon: Icons.alternate_email_rounded,
        ),
        const Gap(16),
        _PasswordTextField(
          controller: password,
        ),
        const Gap(40),
        AppPrimaryButton(
          title: l10n.sign_up_button,
          onPressed: () => notifier.signUp(
            email: email.text,
            password: password.text,
            name: name.text,
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
