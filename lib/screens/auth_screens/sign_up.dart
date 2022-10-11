import 'package:bubu_market/constants/colors.dart';
import 'package:bubu_market/widgets/auth_widgets/filling_field_email.dart';
import 'package:bubu_market/widgets/auth_widgets/filling_field_password.dart';
import 'package:bubu_market/widgets/auth_widgets/filling_fields_username.dart';
import 'package:bubu_market/widgets/auth_widgets/long_button.dart';
import 'package:bubu_market/widgets/general_widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../router/custom_page_builder.dart';
import '../../services/auth_services.dart';
import '../../widgets/general_widgets/back_button.dart';

enum Auth { signin, signup }

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? ischecked = false;
  bool isLoading = false;
  final AuthService authService = AuthService();
  final _signUpFormkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signupUser() {
    authService.signupUser(
      context: context,
      name: _nameController.text,
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
      backgroundColor: Color(0xff232726),
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
                  )
                ),
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
                              "Create\nyour account",
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
                  key: _signUpFormkey,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.87,
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text("Username ",
                               style: textTheme.headlineSmall?.copyWith(
                                  color: GlobalVariables.colorSecondary
                                ))),
                        const SizedBoxes(),
                        UsernameField(
                          icon: Icons.person,
                          hintText: 'Username ',
                          isPassWord: false,
                          isEmail: false,
                          controller: _nameController,
                        ),
                        const SizedBoxes(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text("Email ",
                                style: textTheme.headlineSmall?.copyWith(
                                  color: GlobalVariables.colorSecondary
                                ))),
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
                                  color: GlobalVariables.colorSecondary
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
                            Text(
                              "Agree to terms and conditions",
                              style: textTheme.headlineMedium?.copyWith(
                                color: GlobalVariables.colorSecondary,
                              )
                            ),
                          ],
                        ),
                        const SizedBoxes(),
                        LongButton(
                            color: isLoading
                                ? GlobalVariables.colorPrimary.withOpacity(0.5)
                                : GlobalVariables.colorPrimary,
                            func: () async {
                              if (_signUpFormkey.currentState!.validate() &&
                                  isLoading == false) {
                                setState(() => isLoading = true);
                                await Future.delayed(
                                  Duration(seconds: 2),
                                );
                                signupUser();
                                setState(() => isLoading = false);
                              }
                            },
                            child: isLoading
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CircularProgressIndicator(
                                        strokeWidth: 3,
                                        color: GlobalVariables.colorSecondary,
                                      ),
                                      SizedBox(width: 24),
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
                                    'Sign Up',
                                    style: textTheme.headlineMedium?.copyWith(
                                        color: GlobalVariables.colorSecondary),
                                  )),
                                   const SizedBoxes(),
                         Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account",
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
                    'Log In',
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
