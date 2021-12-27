
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  String text;
  Function function;

  CustomTextButton({this.text,this.function});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("don\'t have an account?"),
        TextButton(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          onPressed: function,
        ),
      ],
    );
  }
}
