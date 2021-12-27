
import 'dart:io';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/cubit.dart';
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/states.dart';
import 'package:ecommerce_app/constants/bottomsheet.dart';
import 'package:ecommerce_app/constants/custom_button.dart';
import 'package:ecommerce_app/constants/custom_edit_text.dart';
import 'package:ecommerce_app/constants/toast.dart';
import 'package:ecommerce_app/modules/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class Settings extends StatelessWidget {
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, Appstates>(
      listener: (context, state) {


        },
      builder: (context, state)
      {
        var profiles = AppCubit.get(context).profileModel;

        nameController.text=profiles.data.name;
        emailController.text=profiles.data.email;
        phoneController.text=profiles.data.phone;

        return ConditionalBuilder(
          condition: profiles!=null,
          builder: (context) =>  Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              child: Column(

                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 70.0,
                        backgroundColor: Colors.white,
                        backgroundImage:AppCubit.get(context).imageFile == null
                            ? AssetImage("assets/images/profile.png")
                            : FileImage(File(AppCubit.get(context).imageFile.path)),

                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: IconButton(
                          icon: Icon(Icons.camera_alt,
                          size: 28,
                          ),
                          onPressed: (){
                            showModalBottomSheet(
                              context: context,
                              builder: ((builder) => BottomSheetWidget()),
                            );
                          },
                        ),
                      )

                    ],
                  ),
                  SizedBox(height: 30,),
                  CustomTextEditingControl(
                    Controller:nameController ,
                    label: 'Name',
                    icon: Icons.person,

                  ),
                  SizedBox(height: 30,),
                  CustomTextEditingControl(
                    Controller:emailController ,
                    label: 'Email Address',
                    icon: Icons.email,

                  ),
                  SizedBox(height:30,),
                  CustomTextEditingControl(
                    Controller:phoneController ,
                    label: 'Phone',
                    icon: Icons.phone,

                  ),
                  SizedBox(height:30,),
                  CustomButton(
                  text: "Update",
                  function: () {
                     AppCubit.get(context).UpdateProfileDate(
                       name: nameController.text,
                       email: emailController.text,
                    phone: phoneController.text,

                     );
                     if (state is SuccessUpdateProfileDatastate) {
                       showToast(text:'Updated Successfully!', color: ToastColors.SUCCESS);
                     }
                    }
                  ),
                  SizedBox(height:30,),
                  CustomButton(
                      text: "LOGOUT",
                      function: () {
                         Navigator.pushReplacementNamed(context, Login.loginRoute);
                      }
                  ),

                ],
              ),
            ),
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );

  }
}
