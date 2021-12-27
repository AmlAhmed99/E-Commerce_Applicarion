import 'package:ecommerce_app/models/loginmodel.dart';

abstract class Appstates{}

class Initialstate extends Appstates{}

class AppModesstate extends Appstates{}

class ChangeButtomNavBarstate extends Appstates{}

class LoadingHomeDatastate extends Appstates{}

class SuccessHomeDatastate extends Appstates{}

class ErrorHomeDatastate extends Appstates{}

class LoadingCategoryDatastate extends Appstates{}

class SuccessCategoryDatastate extends Appstates{}

class ErrorCategoryDatastate extends Appstates{}

class LoadingFavouriteDatastate extends Appstates{}

class SuccessFavouriteDatastate extends Appstates{}

class ErrorFavouriteDatastate extends Appstates{}

class LoadingGetFavouriteDatastate extends Appstates{}

class SuccessGetFavouriteDatastate extends Appstates{}

class ErrorGetFavouriteDatastate extends Appstates{}

class LoadingGetProfileDatastate extends Appstates{}

class SuccessGetProfileDatastate extends Appstates{
  final  Loginmodel profileModel;

  SuccessGetProfileDatastate(this.profileModel);
}

class ErrorGetProfileDatastate extends Appstates{}


class LoadingUpdateProfileDatastate extends Appstates{}

class SuccessUpdateProfileDatastate extends Appstates{
  final  Loginmodel profileModel;

  SuccessUpdateProfileDatastate(this.profileModel);
}

class ErrorUpdateProfileDatastate extends Appstates{}

class SuccessUploadPhotostate extends Appstates{}

class LoadUploadPhotostate extends Appstates{}

class ErrorUploadPhotostate extends Appstates{}


class SuccessSearchstate extends Appstates{}

class LoadSearchstate extends Appstates{}

class ErrorSearchstate extends Appstates{}