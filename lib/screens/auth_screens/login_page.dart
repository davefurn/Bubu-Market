import 'package:bubu_market/constants/colors.dart';
import 'package:bubu_market/widgets/auth_widgets/filling_field_email.dart';
import 'package:bubu_market/widgets/auth_widgets/filling_field_password.dart';
import 'package:bubu_market/widgets/auth_widgets/long_button.dart';
import 'package:bubu_market/widgets/general_widgets/loader.dart';
import 'package:bubu_market/widgets/general_widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../router/custom_page_builder.dart';
import '../../services/auth_services.dart';
import '../../widgets/general_widgets/back_button.dart';
import 'sign_up.dart';

enum Auth { signin, signup }

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool? ischecked = false;
  bool isLoading = false;
  final AuthService authService = AuthService();
  final _signInFormkey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signinUser() {
    authService.signinUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: GlobalVariables.colorPrimary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .025,
                            left: 10,
                          ),
                          child: BacksButton(
                            width: 5,
                            size: 22,
                            colors: GlobalVariables.scaffoldBackGroundColor,
                            func: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .05,
                              bottom: MediaQuery.of(context).size.width * .08,
                            ),
                            child: Text(
                              "Log into\nyour account",
                              style: textTheme.headlineLarge,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 80,
                ),
                child: Form(
                  key: _signInFormkey,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.87,
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text("Email ",
                                style: textTheme.headlineSmall?.copyWith(
                                    color: GlobalVariables.colorSecondary))),
                        const SizedBoxes(),
                        EmailField(
                          icon: Icons.email,
                          hintText: 'Email ',
                          isPassWord: false,
                          isEmail: true,
                          controller: _emailController,
                        ),
                        const SizedBoxes(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text("Password",
                                style: textTheme.headlineSmall?.copyWith(
                                  color: GlobalVariables.colorSecondary,
                                ))),
                        const SizedBoxes(),
                        PassWordField(
                          icon: Icons.lock_clock,
                          hintText: 'Password',
                          isEmail: false,
                          controller: _passwordController,
                        ),
                        const SizedBoxes(),
                        Row(
                          children: [
                            Checkbox(
                              value: ischecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  ischecked = value;
                                  print(ischecked);
                                });
                              },
                              checkColor: Colors.white,
                              activeColor: Colors.black,
                            ),
                            Text("Agree to terms and conditions",
                                style: textTheme.headlineMedium?.copyWith(
                                  color: GlobalVariables.colorSecondary,
                                )),
                          ],
                        ),
                        const SizedBoxes(),
                        LongButton(
                            color: isLoading
                                ? GlobalVariables.colorPrimary.withOpacity(0.5)
                                : GlobalVariables.colorPrimary,
                            func: () async {
                              if (_signInFormkey.currentState!.validate() &&
                                  isLoading == false) {
                                setState(() => isLoading = true);
                                await Future.delayed(
                                  const Duration(seconds: 2),
                                );
                                signinUser();
                                setState(() => isLoading = false);
                              }
                            },
                            child: isLoading
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CustomLoader(),
                                     const SizedBox(width: 24),
                                      Text(
                                        'Please Wait....',
                                        style: textTheme.headlineMedium
                                            ?.copyWith(
                                                color: GlobalVariables
                                                    .colorSecondary),
                                      ),
                                    ],
                                  )
                                : Text(
                                    'Log in',
                                    style: textTheme.headlineMedium?.copyWith(
                                        color: GlobalVariables.colorSecondary),
                                  )),
                        const SizedBoxes(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account",
                              style: textTheme.headlineMedium?.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBoxes(
                              height: 0,
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  customPageBuilder(
                                    const SignUp(),
                                    1,
                                    0,
                                  ),
                                );
                              },
                              child: Text(
                                'Create one',
                                style: textTheme.headlineMedium?.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
