import 'package:ecommerce_app/models/loginmodel.dart';

abstract class loginstates{}

class InitialstateLogin extends loginstates{}

class loginLoadstate extends loginstates{}

class loginGetDataSuccessstate extends loginstates{
  final Loginmodel loginmodel;

  loginGetDataSuccessstate(this.loginmodel);
}

class loginGetDataErrorstate extends loginstates{
  final error;

  loginGetDataErrorstate(this.error);
}