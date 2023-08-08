import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget
{
  String btntxt;


   Button(this.btntxt,{super.key});


  @override
  State<Button> createState()=>_ButtonState();

}
class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
   return OutlinedButton(onPressed: (){}, child: Text(''));
  }

}