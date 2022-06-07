import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_card.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_primary_button.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_account.dart';
import 'package:new_horizons_encyclopedia/l10n/l10n.dart';
import 'package:new_horizons_encyclopedia/modules/user_profile/notifier.dart';
import 'package:new_horizons_encyclopedia/notifiers/current_user.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider0<UserProfileNotifier>(
      create: (_) => UserProfileNotifier(),
      update: (context, old) => old!
        ..account = context.watch<AppwriteAccount>()
        ..currentUserNotifier = context.watch<CurrentUserNotifier>(),
      child: const Scaffold(
        backgroundColor: AppColors.secondary,
        body: _InternalUserProfileView(),
      ),
    );
  }
}

class _InternalUserProfileView extends StatelessWidget {
  const _InternalUserProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final notifier = context.watch<UserProfileNotifier>();

    final currentUser = context.select<CurrentUserNotifier, User?>(
      (notifier) => notifier.currentUser,
    );

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            currentUser != null
                ? Padding(
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
                              currentUser.name,
                              style: AppTextStyles.title,
                            ),
                            const Gap(16),
                            Text(
                              currentUser.email,
                              style: AppTextStyles.inputLabel,
                            ),
                            const Gap(16),
                            Text(
                              l10n.user_profile_registration(
                                DateTime.fromMillisecondsSinceEpoch(
                                  currentUser.registration * 1000,
                                ),
                              ),
                              style: AppTextStyles.cardBody,
                            ),
                            const Gap(32),
                            AppPrimaryButton(
                              title: l10n.user_profile_log_out,
                              onPressed: () => notifier.logOut(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
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
