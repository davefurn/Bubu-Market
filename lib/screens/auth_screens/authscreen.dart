import 'package:bubu_market/constants/colors.dart';
import 'package:bubu_market/screens/auth_screens/sign_up.dart';
import 'package:bubu_market/widgets/auth_widgets/long_button.dart';
import 'package:bubu_market/widgets/general_widgets/sized_boxes.dart';
import 'package:flutter/material.dart';


import '../../router/custom_page_builder.dart';
import 'login_page.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: const Color(0xff232726),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/icon + yellow text.png",
          width: 200,
          ),
          const SizedBoxes(height: 50,),
            Text(
              'You need an account\n     to use this app',
              style: textTheme.headlineLarge?.copyWith(
                fontSize: 40,
              ),
            ),
           const SizedBoxes(height: 25,),
            LongButton(
              color: GlobalVariables.colorPrimary,
              func: () => Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const SignUp()))),
              child: Text(
                'Create account',
                style: textTheme.headlineMedium?.copyWith(color: Colors.black),
              ),
            ),
             const SizedBoxes(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
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
                        const Login(),
                        1,
                        0,
                      ),
                    );
                  },
                  child: Text(
                    'Log in',
                    style: textTheme.headlineMedium
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
