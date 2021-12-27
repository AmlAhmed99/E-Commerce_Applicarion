import 'package:ecommerce_app/models/loginmodel.dart';

abstract class registerstates{}

class Initialstateregister extends registerstates{}

class registerLoadstate extends registerstates{}

class registerGetDataSuccessstate extends registerstates{
  final Loginmodel RegisterModel;

  registerGetDataSuccessstate(this.RegisterModel);
}

class registerGetDataErrorstate extends registerstates{
  final error;

  registerGetDataErrorstate(this.error);
}