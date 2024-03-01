import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_notes/blocs/authentication/reset_password/reset_password_bloc.dart';
import 'package:lingua_notes/core/components/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lingua_notes/core/utils/l_n_icons.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final emailController = TextEditingController();
  RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$');
  String? _errorMessage;
  final _formKey = GlobalKey<FormState>();

  late var snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    content: Text(AppLocalizations.of(context)!.sentByEmail),
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context);
          });
        } else if (state is ResetPasswordFailure) {
          setState(() {
            _errorMessage =
                AppLocalizations.of(context)!.invalidEmailOrPassword;
          });
        }
      },
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: 300,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    AppLocalizations.of(context)!.resetPasswordTitle,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
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
                const SizedBox(height: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ResetPasswordBloc>().add(
                              ResetPasswordRequired(
                                  emailController.text.trim()));
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
                        padding:
                            const EdgeInsets.only(right: 3, top: 3, bottom: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!
                                    .resetPasswordButton,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Icon(
                              LN.arrow_circle_right,
                              size: 30,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
