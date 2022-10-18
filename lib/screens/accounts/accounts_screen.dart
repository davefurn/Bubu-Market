import 'package:bubu_market/constants/colors.dart';
import 'package:bubu_market/widgets/accounts_widgets/below_appbar.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: GlobalVariables.colorPrimary,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/images/black icon + black text.png",
                  width: 150,
                  height: 50,   
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15,right: 15,),
                child: Row(
                  children: const [
                    Padding(padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.notifications_outlined, color: GlobalVariables.colorSecondary, size: 24,),
                    ),
                    Icon(Icons.search,color: GlobalVariables.colorSecondary, size: 24,),
                  ],
                ),
              ),
            ],
          ),
        ),
        
      ),
      body: Column(
        children: const [
          BelowAppBar(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
