

import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/states.dart';
import 'package:ecommerce_app/Bloc(Cubit)/authenticationCubit/login/states.dart';
import 'package:ecommerce_app/models/loginmodel.dart';
import 'package:ecommerce_app/network/end_points.dart';
import 'package:ecommerce_app/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class logincubit extends Cubit<loginstates>{

  logincubit() : super(InitialstateLogin());

  static logincubit get(context) => BlocProvider.of(context);
  Loginmodel loginmodel;
  void userLogin(
  {
   @required String email,
    @required String password
  })
{
  emit(loginLoadstate());
  print("load");
    DioHelper.postData(
        url:login,
        data: {
          'email':email,
          'password':password
        }
    ).then((value) {
      loginmodel=Loginmodel.fromJson(value.data);
      print(loginmodel.message);
      emit(loginGetDataSuccessstate(loginmodel));
    }).catchError((error){
      print("error");
      print(error.toString());
      emit(loginGetDataErrorstate(error.toString()));
    });

  }





}