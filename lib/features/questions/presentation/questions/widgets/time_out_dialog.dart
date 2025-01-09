import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/styles/app_images.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';
import 'package:online_exam/core/utils/widgets/buttons/carved_button.dart';
import 'package:online_exam/core/utils/widgets/spacing.dart';
import 'package:online_exam/di/di.dart';

class TimeOutDialog {
  const TimeOutDialog._(); // Private constructor to prevent instantiation

  static void show() {
    final navigatorContext =
        getIt<GlobalKey<NavigatorState>>().currentState?.context;

    if (navigatorContext != null) {
      showGeneralDialog(
        context: navigatorContext,
        pageBuilder: (ctx, a1, a2) => const SizedBox.shrink(),
        transitionBuilder: (ctx, a1, a2, child) {
          final curveValue = Curves.easeInOut.transform(a1.value);
          return Transform.scale(
            scale: curveValue,
            child: _dialog(ctx),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      );
    } else {
      debugPrint("Navigator context is not yet initialized.");
    }
  }

  static Widget _dialog(
    BuildContext context,
  ) {
    return AlertDialog(
      backgroundColor: MyColors.white,
      contentPadding: const EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                height: 90.h,
                width: 50.w,
                child: Center(
                  child: Image.asset(
                    AppImages.timeOut,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              horizontalSpacing(5),
              Text(
                'Time out !!',
                style: MyFonts.styleBold700_24.copyWith(color: MyColors.red),
              ),
            ],
          ),
          verticalSpacing(24),
          CurvedButton(
            color: MyColors.blue,
            title: 'view Score',
            onTap: () {
              context.pop();
            },
          )
        ],
      ),
    );
  }
}
