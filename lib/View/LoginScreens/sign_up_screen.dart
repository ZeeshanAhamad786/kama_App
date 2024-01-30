import 'package:flutter/material.dart';

import '../../Utils/Constant/constant.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Column(children: [SizedBox(height: 80,),
        Text("zeeshan",style: TextStyle(fontFamily:MyConstants.boldFontFamily,fontSize: 20, ),),
        Text("zeeshan", style: TextStyle(
fontSize: 20
        ),)
      ]),
    );
  }
}
