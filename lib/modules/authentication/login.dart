import 'package:conditional_builder/conditional_builder.dart';
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/cubit.dart';
import 'package:ecommerce_app/Bloc(Cubit)/authenticationCubit/login/cubit.dart';
import 'package:ecommerce_app/Bloc(Cubit)/authenticationCubit/login/states.dart';
import 'package:ecommerce_app/constants/custom_button.dart';
import 'package:ecommerce_app/constants/custom_edit_text.dart';
import 'package:ecommerce_app/constants/custom_textButton.dart';
import 'package:ecommerce_app/constants/toast.dart';
import 'package:ecommerce_app/modules/authentication/register.dart';
import 'package:ecommerce_app/modules/shop_layout/home.dart';
import 'package:ecommerce_app/network/end_points.dart';
import 'package:ecommerce_app/network/local/shared_preferenced.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatelessWidget {
  static const loginRoute = 'loginRoute';
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => logincubit(),
      child: BlocConsumer<logincubit, loginstates>(listener: (context, state) {
        if (state is loginGetDataSuccessstate) {
          if (state.loginmodel.status) {
            CashHelper.saveData(
                    key: 'token', value: state.loginmodel.data.token)
                .then((value) {
              token=state.loginmodel.data.token;
              AppCubit.get(context).getProfileDate();
              Navigator.pushReplacementNamed(
                  context, HomeScreen.HomeScreenRoute);

            });
          } else {
            showToast(text: state.loginmodel.message, color: ToastColors.ERROR);
          }
        }
        ;
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
                        height: 200,
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextEditingControl(
                        Controller: emailController,
                        label: 'Email Address',
                        icon: Icons.email,
                        onSubmit: (value) {
                          if (formKey.currentState.validate()) {
                            logincubit.get(context).userLogin(
                                email: emailController.text,
                                password: passController.text);
                          }
                        },
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
                        onSubmit: (value) {
                          if (formKey.currentState.validate()) {
                            logincubit.get(context).userLogin(
                                email: emailController.text,
                                password: passController.text);
                          }
                        },
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
                        condition: state is! loginLoadstate,
                        builder: (context) {
                          return CustomButton(
                              text: "Login",
                              function: () {
                                if (formKey.currentState.validate()) {
                                  logincubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passController.text);
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
                      CustomTextButton(text: "Register Now",
                        function:   (){
                          Navigator.pushReplacementNamed(context, Register.RegisterRoute);
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
