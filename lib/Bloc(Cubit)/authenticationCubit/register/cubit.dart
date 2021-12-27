import 'package:ecommerce_app/Bloc(Cubit)/authenticationCubit/login/states.dart';
import 'package:ecommerce_app/Bloc(Cubit)/authenticationCubit/register/states.dart';
import 'package:ecommerce_app/models/loginmodel.dart';
import 'package:ecommerce_app/network/end_points.dart';
import 'package:ecommerce_app/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class registercubit extends Cubit<registerstates>{

  registercubit() : super(Initialstateregister());

  static registercubit get(context) => BlocProvider.of(context);
  Loginmodel loginmodel;
  void userRegister(
  {
   @required String email,
    @required String password,
    @required String phone,
    @required String name,
  })
{
  emit(registerLoadstate());

    DioHelper.postData(
        url:register,
        data: {
          'email':email,
          'password':password,
          'phone':phone,
          'name':name,
        }
    ).then((value) {
      loginmodel=Loginmodel.fromJson(value.data);

      emit(registerGetDataSuccessstate(loginmodel));
    }).catchError((error){

      print(error.toString());
      emit(registerGetDataErrorstate(error.toString()));
    });

  }





}