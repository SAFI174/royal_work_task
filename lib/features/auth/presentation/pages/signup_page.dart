import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_task/core/extentions/extentions.dart';

import '../../../../core/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_padding.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/validations/field_validations.dart';
import '../cubits/auth/auth_bloc.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            failed: (message) => showSnakbar(context, message),
          );
        },
        builder: (context, state) {
          return Padding(
            padding: AppPadding.paddingA15,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign Up.",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  50.sbh,
                  AuthField(
                    validator: FieldValidations.empty,
                    hintText: "Name",
                    controller: nameController,
                  ),
                  15.sbh,
                  AuthField(
                    validator: FieldValidations.email,
                    hintText: "Email",
                    controller: emailController,
                  ),
                  15.sbh,
                  AuthField(
                    validator: FieldValidations.password,
                    hintText: "Password",
                    isPassword: true,
                    controller: passwordController,
                  ),
                  15.sbh,
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final isLoading = state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      );

                      return AuthButton(
                        text: 'Sign Up',
                        isLoading: isLoading,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthEvent.authSignup(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                          }
                        },
                      );
                    },
                  ),
                  15.sbh,
                  GestureDetector(
                    onTap: () => context.pushNamed(AppRoutes.signin.name),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: AppColors.black,
                        ),
                        text: "Already have an account? ",
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              color: AppColors.gradient2,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
