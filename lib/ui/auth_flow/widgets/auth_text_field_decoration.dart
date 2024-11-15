import 'package:clario_test_task/consts/colors.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
InputDecoration AuthTextFieldDecorator({
  required String placeholder,
  required BuildContext context,
  Color? forceColor,
  Widget? suffixIcon,
}) {
  final styles = Theme.of(context).textTheme;
  var inputDecoration = InputDecoration(
    suffixIcon: suffixIcon,
    hintText: ' $placeholder',
    hintStyle: WidgetStateTextStyle.resolveWith(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return styles.bodyLarge!.copyWith(
            color: ColorConstants.disabled,
          );
        } else {
          return styles.bodyLarge!.copyWith(
            color: forceColor ?? ColorConstants.onSurfacePrimary,
          );
        }
      },
    ),
    filled: true,
    fillColor: ColorConstants.onSurfaceButtonPrimary,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: forceColor ?? ColorConstants.stroke,
        width: 0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: forceColor ?? ColorConstants.statesError,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: ColorConstants.statesError,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: ColorConstants.disabled,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: forceColor ?? ColorConstants.strokeFocused,
      ),
    ),
  );
  return inputDecoration;
}
