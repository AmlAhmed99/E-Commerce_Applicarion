
import 'package:conditional_builder/conditional_builder.dart';
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/cubit.dart';
import 'package:ecommerce_app/Bloc(Cubit)/authenticationCubit/login/cubit.dart';
import 'package:ecommerce_app/Bloc(Cubit)/authenticationCubit/login/states.dart';
import 'package:ecommerce_app/Bloc(Cubit)/authenticationCubit/register/cubit.dart';
import 'package:ecommerce_app/Bloc(Cubit)/authenticationCubit/register/states.dart';
import 'package:ecommerce_app/constants/custom_button.dart';
import 'package:ecommerce_app/constants/custom_edit_text.dart';
import 'package:ecommerce_app/constants/custom_textButton.dart';
import 'package:ecommerce_app/constants/toast.dart';
import 'package:ecommerce_app/modules/authentication/login.dart';
import 'package:ecommerce_app/modules/shop_layout/home.dart';
import 'package:ecommerce_app/network/end_points.dart';
import 'package:ecommerce_app/network/local/shared_preferenced.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatelessWidget {
  static const RegisterRoute = 'RegisterRoute';
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => registercubit(),
      child: BlocConsumer<registercubit, registerstates>(
          listener: (context, state) {
        if (state is registerGetDataSuccessstate) {
          if (state.RegisterModel.status) {
            CashHelper.saveData(
                key: 'token', value: state.RegisterModel.data.token)
                .then((value) {
                  token=state.RegisterModel.data.token;
               AppCubit.get(context).getProfileDate();
               Navigator.pushReplacementNamed(
                  context, HomeScreen.HomeScreenRoute);
            });
          } else {
            showToast(text: state.RegisterModel.message, color: ToastColors.ERROR);
          }
        };
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/login2.png',
                        height: 100,
                      ),
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextEditingControl(
                        Controller: nameController,
                        label: 'Name',
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextEditingControl(
                        Controller: emailController,
                        label: 'Email Address',
                        icon: Icons.email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextEditingControl(
                        Controller:phoneController,
                        label: 'Phone',
                        icon: Icons.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextEditingControl(
                        iconSuffex: Icons.remove_red_eye,
                        Controller: passController,
                        label: 'Password',
                        isObscure: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ConditionalBuilder(
                        condition: state is! registerLoadstate,
                        builder: (context) {
                          return CustomButton(
                              text: "Register",
                              function: () {
                                if (formKey.currentState.validate()) {
                                  registercubit.get(context).userRegister(
                                      email: emailController.text,
                                      password: passController.text,
                                    name: nameController.text,
                                    phone:phoneController.text
                                  );
                                }
                              });
                        },
                        fallback: (context) {
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextButton(text: "Login",
                        function:   (){
                        Navigator.pushReplacementNamed(context, Login.loginRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
