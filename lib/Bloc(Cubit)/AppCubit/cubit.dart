import 'package:ecommerce_app/models/search_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/states.dart';
import 'package:ecommerce_app/models/add_favourite_model.dart';
import 'package:ecommerce_app/models/categoriesmodel.dart';
import 'package:ecommerce_app/models/favourit_model.dart';
import 'package:ecommerce_app/models/homemodel.dart';
import 'package:ecommerce_app/models/loginmodel.dart';
import 'package:ecommerce_app/modules/categories/categories.dart';
import 'package:ecommerce_app/modules/favourites/favourits.dart';
import 'package:ecommerce_app/modules/products/ProductScreen.dart';
import 'package:ecommerce_app/modules/settings/settings.dart';
import 'package:ecommerce_app/network/end_points.dart';
import 'package:ecommerce_app/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<Appstates>{

  AppCubit() : super(Initialstate());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark=false;

  void changeModeColor(){
    isDark = !isDark;
    print(isDark);
    emit(AppModesstate());
  }

  int currentIndex=0;
  var Screens=[
    ProductScreen(),
    Categories(),
    Favourites(),
    Settings()
  ];

  void onTap(idx){
    currentIndex=idx;
    emit(ChangeButtomNavBarstate());
  }

  Map<int,bool> favourites={};

  Homemodel homemodel;
  void getHomeDate(){
    emit(LoadingHomeDatastate());
    DioHelper.getData(
        url: home,
      token: token

    )
        .then((value) {
      homemodel=Homemodel.fromJson(value.data);
      homemodel.data.products.forEach((element) {
        favourites.addAll(
          {
            element.id:element.inFavorites,
          }
        );
      });

      emit(SuccessHomeDatastate());
    }).catchError((error){
    
      emit(ErrorHomeDatastate());
    });

  }
  Categoriesmodel categoriesmodel;
  void getCategoryDate(){
    emit(LoadingCategoryDatastate());
    DioHelper.getData(
        url: categories,
        token: token

    )
        .then((value) {
      categoriesmodel=Categoriesmodel.fromJson(value.data);
      emit(SuccessCategoryDatastate());
    }).catchError((error){

      emit(ErrorCategoryDatastate());
    });

  }


  AddFavouriteModel addFavouriteModel;
  void changeFavoritesDate(int productId){
    favourites[productId]=!favourites[productId];
    emit(LoadingFavouriteDatastate());
    DioHelper.postData(
       url: Favourite,
      data: {
         'product_id':productId
      },
      token: token

    )
        .then((value) {
      addFavouriteModel=AddFavouriteModel.fromJson(value.data);

      if(!addFavouriteModel.status)
        favourites[productId]=!favourites[productId];
      else
        getFavoritesDate();

      emit(SuccessFavouriteDatastate());
    }).catchError((error){

      emit(ErrorFavouriteDatastate());
    });

  }

  FavouritModel getFavouriteModel;
  void getFavoritesDate(){

    emit(LoadingGetFavouriteDatastate());
    DioHelper.getData(
        url: Favourite,
        token: token

    )
        .then((value) {
      getFavouriteModel=FavouritModel.fromJson(value.data);

      emit(SuccessGetFavouriteDatastate());
    }).catchError((error){

      emit(ErrorGetFavouriteDatastate());
    });

  }

  Loginmodel profileModel;
  void getProfileDate(){

    emit(LoadingGetProfileDatastate());
    DioHelper.getData(
        url: profile,
        token: token

    )
        .then((value) {
      profileModel=Loginmodel.fromJson(value.data);

      emit(SuccessGetProfileDatastate(profileModel));
    }).catchError((error){

      emit(ErrorGetProfileDatastate());
    });

  }

  void UpdateProfileDate(
  {
    @required String email,
    @required String phone,
    @required String name,
   }
      ){

    emit(LoadingUpdateProfileDatastate());
    print("loaaaaaaaaaaaaaaaaad");
    DioHelper.putData(
        url: update_profile,
        token: token,
        data: {
          'email':email,
          'phone':phone,
          'name':name,
        }

    ).then((value) {
      print("successsssssssssssssssssssssss");
      profileModel=Loginmodel.fromJson(value.data);

      emit(SuccessUpdateProfileDatastate(profileModel));
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      emit(ErrorUpdateProfileDatastate());
    });

  }

  SearchModel searchModel;
  void searchDate({@required String text}){
    emit(LoadSearchstate());
    DioHelper.postData(
        url: products_search,
        data: {
          'text':text
        },
        token: token

    )
        .then((value) {
      searchModel=SearchModel.fromJson(value.data);

      emit(SuccessSearchstate());
    }).catchError((error){

      emit(ErrorSearchstate());
    });

  }



  XFile imageFile;
  final ImagePicker picker = ImagePicker();

  void takePhoto(ImageSource source)  {
    emit(LoadUploadPhotostate());
    picker.pickImage(source: source,)
        .then((value) {

          print('okkkkkkkkkkkkkkkkkkkkkkkkk');
      print(value);
      imageFile = value ;
          emit(SuccessUploadPhotostate());
    }).catchError((error){

      print('errorrrrrrrrrr');
      print(error.toString());
      emit(ErrorUploadPhotostate());
    });



  }


}