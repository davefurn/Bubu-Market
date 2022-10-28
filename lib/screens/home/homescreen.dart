import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  @override
  Widget build(BuildContext context) {
     final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
       appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
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
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: (){},
                          child: const Padding(
                            padding: EdgeInsets.only(left: 6,),
                          child: Icon(Icons.search,color: GlobalVariables.colorSecondary, size: 23,),
                          ),
                        ),
                        filled: true,
                        fillColor: GlobalVariables.scaffoldBackGroundColor,
                        contentPadding: const EdgeInsets.only(top: 10,),
                        border: const OutlineInputBorder(
                          borderRadius:  BorderRadius.all(Radius.circular(7),),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder:  const OutlineInputBorder(
                          borderRadius:  BorderRadius.all(Radius.circular(7),),
                          borderSide: BorderSide(color: Colors.black38, width: 1,),
                        ),
                        hintText: "Search Bubu.market",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),

                      ),
                      
                    ),
                  )
                ),
              ),
                  Container(
                    color: Colors.transparent,
                    height: 42,
                    margin: const EdgeInsets.symmetric(horizontal: 10,),
                    child:const Icon(Icons.mic, color: GlobalVariables.colorSecondary, size: 25,),
                  ),
            ],
          ),
        ),
      ),
      body: Center(child: Text(user.toJson(),)),
    );
  }
}
