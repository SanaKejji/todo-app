import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todo_app/core/theme/app_colors.dart';

void showToast(String text) => BotToast.showText(text: text);

void showSuccessToast(String text) =>
    BotToast.showText(text: text, contentColor: Colors.green.withOpacity(0.7));

void showErrorToast(String? text) => BotToast.showText(
    text: text ?? "", contentColor: Colors.redAccent.withOpacity(0.7));

void showWarningToast(String text) => BotToast.showText(
    text: text,
    textStyle: const TextStyle(color: Colors.grey),
    contentColor: Colors.yellowAccent.withOpacity(0.7));

void showLoading() => BotToast.showCustomLoading(
      toastBuilder: (cancelFunc) => const Loader(),
    );

void closeLoading() => BotToast.closeAllLoading();

class Loader extends StatelessWidget {
  const Loader({super.key, this.size});
  final double? size;
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: size ?? 40,
      itemBuilder: (context, index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index.isEven
                ? AppColors.secondary
                : AppColors.secondary.withOpacity(.3),
          ),
        );
      },
    );
  }
}
