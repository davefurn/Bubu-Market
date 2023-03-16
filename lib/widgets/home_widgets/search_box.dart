import 'package:bubu_market/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: const Color(0xffeeeeee),
      height: 42,
      margin: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
      child:  TextField(
          
            autocorrect: true,
            
            cursorColor: Colors.black,
           
   
          
            style: const TextStyle(
              height: 1.5,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Color(0xFF1F2937),
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                         bottom: 12.5, top:12.5, ),
              prefixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 232, 235, 240), size: 24,),
              suffixIcon: null,
              hintText: 'Search products, brands and categories',
              hintStyle: GoogleFonts.nunito(
                fontSize: 19,
              ),
              isDense: true,
              fillColor: GlobalVariables.scaffoldBackGroundColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Color(0xFFF3F4F6)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Color(0xFFF3F4F6)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Color(0xFFF3F4F6)),
              ),
            ),
          ),
    );
  }
}
