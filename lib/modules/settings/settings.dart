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

class Settings extends StatelessWidget {
  var nameControllerprofile=TextEditingController();
  var emailControllerprofile=TextEditingController();
  var phoneControllerprofile=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, Appstates>(
      listener: (context, state) {},
      builder: (context, state)
      {

        nameControllerprofile.text=AppCubit.get(context).profileModel.data.name;
        emailControllerprofile.text=AppCubit.get(context).profileModel.data.email;
        phoneControllerprofile.text=AppCubit.get(context).profileModel.data.phone;

        return ConditionalBuilder(
          condition: AppCubit.get(context).profileModel!=null,
          builder: (context) =>  Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (state is LoadingUpdateProfileDatastate)
                      LinearProgressIndicator(),
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
                      Controller:nameControllerprofile ,
                      label: 'Name',
                      icon: Icons.person,

                    ),
                    SizedBox(height: 30,),
                    CustomTextEditingControl(
                      Controller:emailControllerprofile ,
                      label: 'Email Address',
                      icon: Icons.email,

                    ),
                    SizedBox(height:30,),
                    CustomTextEditingControl(
                      Controller:phoneControllerprofile ,
                      label: 'Phone',
                      icon: Icons.phone,

                    ),
                    SizedBox(height:30,),
                    CustomButton(
                    text: "Update",
                    function: () {
                      print("waiiiiiiiiiiiiiiiiiiiit");
                       AppCubit.get(context).UpdateProfileDate(
                         name: nameControllerprofile.text,
                         email: emailControllerprofile.text,
                      phone: phoneControllerprofile.text,

                       );
                      print( nameControllerprofile.text);
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
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );

  }
}
