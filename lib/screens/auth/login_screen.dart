import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_notes/blocs/authentication/authentication_bloc.dart';
import 'package:lingua_notes/blocs/sign_in/sign_in_bloc.dart';
import 'package:lingua_notes/blocs/sign_up/sign_up_bloc.dart';
import 'package:lingua_notes/screens/auth/sign_in_screen.dart';
import 'package:lingua_notes/screens/auth/sign_up_screen.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  final double _mainBoxDevider = 1.3;

  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / _mainBoxDevider,
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                          children: <TextSpan>[
                            const TextSpan(text: 'Lingua   '),
                            TextSpan(
                              text: 'Notes',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                background: Paint()
                                  ..color =
                                      Theme.of(context).colorScheme.onBackground
                                  ..strokeWidth = 33
                                  ..strokeJoin = StrokeJoin.round
                                  ..strokeCap = StrokeCap.round
                                  ..style = PaintingStyle.stroke,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 80),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: TabBar(
                          controller: tabController,
                          unselectedLabelColor: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.65),
                          labelColor:
                              Theme.of(context).colorScheme.onBackground,
                          dividerColor: Colors.transparent,
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          indicator: MaterialIndicator(
                            color: Theme.of(context).colorScheme.primary,
                            height: 3,
                            bottomLeftRadius: 2,
                            bottomRightRadius: 2,
                            topLeftRadius: 2,
                            topRightRadius: 2,
                          ),
                          tabs: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Text(
                                'Sign In',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            BlocProvider<SignUpBloc>(
                              child: const SignUpScreen(),
                              create: (context) => SignUpBloc(
                                  userRepository: context
                                      .read<AuthenticationBloc>()
                                      .userRepository),
                            ),
                            BlocProvider<SignInBloc>(
                              child: const SignInScreen(),
                              create: (context) => SignInBloc(
                                  userRepository: context
                                      .read<AuthenticationBloc>()
                                      .userRepository),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
