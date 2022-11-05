import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text('Deal of the day', style: TextStyle(
           fontSize: 20, 
          ),),
        ),
        Image.network(  "https://images.unsplash.com/photo-1530204300372-1eddee84dfb9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
        fit: BoxFit.fitHeight,
        height: 235,

        ),
        Container(
          padding: const EdgeInsets.only(left: 15, ),
          alignment: Alignment.topLeft,
          child: const Text('\$100', style:   TextStyle(
            fontSize: 18,
          ),),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40, ),
          child: const Text('Davefurn', maxLines: 2, overflow: TextOverflow.ellipsis, ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network('https://images.unsplash.com/photo-1594437339683-999a05040992?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTN8NTAzODI2Mnx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60', fit: BoxFit.fitWidth, width: 100, height: 100,),
              Image.network('https://images.unsplash.com/photo-1533108344127-a586d2b02479?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDl8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60"', fit: BoxFit.fitWidth,width: 100, height: 100,),
              Image.network('https://images.unsplash.com/photo-1545291730-faff8ca1d4b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8M3w0OTY3NTI5fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=700&q=60', fit: BoxFit.fitWidth,width: 100, height: 100,),
              Image.network('https://images.unsplash.com/photo-1582015752624-e8b1c75e3711?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c3VpdGUlMjBibGFja3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60"', fit: BoxFit.fitWidth,width: 100, height: 100,),
              Image.network('https://images.unsplash.com/photo-1640590647840-35acdf75c34c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHN1aXRlJTIwYmxhY2t8ZW58MHx8MHx8&auto=format&fit=crop&w=700&q=60', fit: BoxFit.fitWidth,width: 100, height: 100,),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15,),
          alignment: Alignment.topLeft,
          child: Text('See all deals', style: TextStyle(color: Colors.cyan[800],),),
        ),
      ],
    );
  }
}