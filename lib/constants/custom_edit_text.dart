
import 'package:flutter/material.dart';

class CustomTextEditingControl extends StatelessWidget {
  var Controller = TextEditingController();
  String label;
  IconData icon;
  IconData iconSuffex;
  Function validator;
  Function onSubmit;
  Function onChange;
  bool isObscure;

  CustomTextEditingControl({this.onChange,this.Controller, this.label, this.icon,this.validator,this.iconSuffex,this.isObscure=false,this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Controller,
      decoration: InputDecoration(
        //hintText: 'Email Address',
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
        suffixIcon:  IconButton(
            icon: Icon(iconSuffex)
        ),

      ),
      validator: validator,
     obscureText: isObscure,
     onFieldSubmitted: onSubmit,
    onChanged: onChange,
     // keyboardType: TextInputType.emailAddress,
    );
  }
}
