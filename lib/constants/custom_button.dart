
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 String text;
 Function function;

 CustomButton({this.text, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: function,

      ),
    );
  }
}
