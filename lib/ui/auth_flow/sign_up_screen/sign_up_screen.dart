import 'package:auto_route/auto_route.dart';
import 'package:clario_test_task/consts/colors.dart';
import 'package:clario_test_task/ui/auth_flow/sign_up_screen/models/sign_up_validation_rule.dart';
import 'package:clario_test_task/ui/auth_flow/sign_up_screen/sign_up_screen_view_model.dart';
import 'package:clario_test_task/ui/auth_flow/widgets/auth_background_container.dart';
import 'package:clario_test_task/ui/auth_flow/widgets/auth_text_field_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  final SignUpScreenViewModel viewModel;

  const SignUpScreen({super.key, required this.viewModel});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(child: _body()),
    );
  }

  Widget _body() {
    return Column(
      children: [
        const Spacer(flex: 3),
        _header(),
        const SizedBox(height: 40),
        _form(),
        const SizedBox(height: 20),
        _validationRules(),
        const SizedBox(height: 40),
        _continueButton(),
        const Spacer(flex: 11),
      ],
    );
  }

  Widget _continueButton() {
    final l10n = AppLocalizations.of(context)!;
    final styles = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width * 0.64;

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: ColorConstants.onSurfacePrimaryGradient,
      ),
      child: PlatformTextButton(
        child: Text(
          l10n.sign_up,
          style: styles.labelLarge?.copyWith(
            color: ColorConstants.onSurfaceButtonPrimary,
          ),
        ),
        onPressed: () {
          if (widget.viewModel.formKey.currentState!.validate()) {
            context.router.pushNamed('/sign_up');
          }
        },
      ),
    );
  }

  Widget _validationRules() {
    final l10n = AppLocalizations.of(context)!;
    final rules = widget.viewModel.rules;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...rules.map(
            (rule) => Padding(
              padding: const EdgeInsets.only(bottom: 4, left: 20),
              child: _ruleField(rule, l10n),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ruleField(SignUpValidationRule rule, AppLocalizations l10n) {
    final styles = Theme.of(context).textTheme;

    final color = rule.isValid == SignUpValidationValidationResult.none
        ? ColorConstants.onSurfacePrimary
        : rule.isValid == SignUpValidationValidationResult.success
            ? ColorConstants.statesSuccess
            : ColorConstants.statesError;

    return SizedBox(
      width: double.infinity,
      child: Text(
        rule.type.name(l10n),
        textAlign: TextAlign.start,
        style: styles.bodySmall?.copyWith(
          color: color,
        ),
      ),
    );
  }

  Widget _form() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: widget.viewModel.formKey,
        child: Column(
          children: [
            _emailField(),
            const SizedBox(height: 20),
            _passwordField(),
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    final l10n = AppLocalizations.of(context)!;

    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      decoration: AuthTextFieldDecorator(
        placeholder: l10n.enter_email,
        context: context,
      ),
    );
  }

  Widget _passwordField() {
    final l10n = AppLocalizations.of(context)!;

    return TextFormField(
      obscureText: !widget.viewModel.passwordIsVisible,
      keyboardType: TextInputType.visiblePassword,
      decoration: AuthTextFieldDecorator(
        placeholder: l10n.create_password,
        context: context,
        suffixIcon: _passwordVisibilityButton(),
      ),
    );
  }

  Widget _passwordVisibilityButton() {
    final isVisible = widget.viewModel.passwordIsVisible;

    return PlatformTextButton(
      padding: EdgeInsets.zero,
      child: Icon(
        isVisible ? Icons.visibility : Icons.visibility_off,
        size: 20,
        color: ColorConstants.strokeFocused,
      ),
      onPressed: () {
        setState(() {
          widget.viewModel.passwordIsVisible = !isVisible;
        });
      },
    );
  }

  Widget _header() {
    final l10n = AppLocalizations.of(context)!;
    final styles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        l10n.sign_up,
        style: styles.headlineLarge?.copyWith(
          color: ColorConstants.onSurfacePrimary,
        ),
      ),
    );
  }
}
