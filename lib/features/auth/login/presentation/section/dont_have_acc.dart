import 'package:flutter/material.dart';
import 'package:watfa/core/Local/AppLocalizations.dart';
import 'package:watfa/core/helpers/extinsions.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/styles.dart';

class DontHaveAcc extends StatelessWidget {
  const DontHaveAcc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?".tr(context),
            style: TextStyles.font16DarkLiverw400Roboto(context),
          ),
          horizontalSpacing(5),
          InkWell(
            onTap: () {
              CacheServices.instance.getUserType()!
                  ? context.pushNamed(Routes.signUpBuyerScreen)
                  : context
                      .pushNamed(Routes.signUpSellerScreen);
            },
            child: Text(
              'Sign up'.tr(context),
              style: TextStyles.font16Purplew700Roboto(context).copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }
}
