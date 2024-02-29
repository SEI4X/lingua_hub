import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_notes/blocs/sign_in/sign_in_bloc.dart';
import 'package:lingua_notes/core/components/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lingua_notes/core/utils/l_n_icons.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isSignInRequired = false;
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool isObscurePassword = true;
  String? _errorMessage;
  RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$');
  RegExp passwordRegExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$');

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          setState(() {
            isSignInRequired = false;
          });
        } else if (state is SignInProcess) {
          setState(() {
            isSignInRequired = true;
          });
        } else if (state is SignInFailure) {
          setState(() {
            isSignInRequired = false;
            _errorMessage =
                AppLocalizations.of(context)!.invalidEmailOrPassword;
          });
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: SizedBox(
                child: LNTextField(
                  controller: emailController,
                  hintText: AppLocalizations.of(context)!.email,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(
                    LN.envelope,
                    size: 18,
                  ),
                  errorMsg: _errorMessage,
                  validator: (val) {
                    if ((val!.isEmpty) || (!emailRegExp.hasMatch(val))) {
                      return AppLocalizations.of(context)!.incorrectEmail;
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: LNTextField(
                controller: passwordController,
                hintText: AppLocalizations.of(context)!.password,
                obscureText: isObscurePassword,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(
                  LN.lock,
                  size: 20,
                ),
                errorMsg: _errorMessage,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please fill in this field';
                  } else if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$')
                      .hasMatch(val)) {
                    return AppLocalizations.of(context)!.incorrectPassword;
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  style: const ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () {
                    setState(() {
                      isObscurePassword = !isObscurePassword;
                      if (isObscurePassword) {
                        iconPassword = LN.eye;
                      } else {
                        iconPassword = LN.eye_crossed;
                      }
                    });
                  },
                  icon: Icon(
                    iconPassword,
                    size: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            !isSignInRequired
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 180,
                        child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<SignInBloc>().add(SignInRequired(
                                    emailController.text,
                                    passwordController.text));
                              }
                            },
                            style: TextButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 3, top: 3, bottom: 3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      AppLocalizations.of(context)!.signIn,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Icon(
                                    LN.arrow_circle_right,
                                    size: 30,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  )
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
