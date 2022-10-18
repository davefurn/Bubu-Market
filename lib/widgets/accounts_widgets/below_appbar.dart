import 'package:bubu_market/constants/colors.dart';
import 'package:bubu_market/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(
        color: GlobalVariables.colorPrimary,
      ),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15,),
            child: RichText(
              text: TextSpan(
                
                text: 'Hello!!!, ',
                style: textTheme.headlineLarge?.copyWith(
                  fontSize: 17,
                  color: GlobalVariables.colorSecondary
                ),
                children: [
                  TextSpan(
                    text: user.name,
                    style: textTheme.headlineLarge?.copyWith(
                      fontSize: 17,
                      color: GlobalVariables.colorSecondary
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
