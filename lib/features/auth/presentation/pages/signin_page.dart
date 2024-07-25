import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_task/core/extentions/extentions.dart';

import '../../../../core/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_padding.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/validations/field_validations.dart';
import '../../../../core/widgets/loader_widget.dart';
import '../cubits/auth/auth_bloc.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            failed: (message) => showSnakbar(context, message),
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Loader(),
            success: (user) => const Loader(),
            orElse: () => Padding(
              padding: AppPadding.paddingA15,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sign In.",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    50.sbh,
                    AuthField(
                      validator: FieldValidations.email,
                      hintText: "Email",
                      controller: emailController,
                    ),
                    15.sbh,
                    AuthField(
                      validator: FieldValidations.empty,
                      hintText: "Password",
                      isPassword: true,
                      controller: passwordController,
                    ),
                    15.sbh,
                    AuthButton(
                      text: 'Sign In',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthEvent.authSignin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                        }
                      },
                    ),
                    15.sbh,
                    GestureDetector(
                      onTap: () => context.pushNamed(AppRoutes.signup.name),
                      child: RichText(
                        text: const TextSpan(
                          text: "Don't have an account? ",
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: AppColors.gradient1,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
