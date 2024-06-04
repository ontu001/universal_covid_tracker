import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class reusableRow extends StatelessWidget{
  String value, title;
  reusableRow({required this.value, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
            ],
          ),

          Divider(
            color: Colors.white10,
          ),
        ],
      ),
    );
  }

}