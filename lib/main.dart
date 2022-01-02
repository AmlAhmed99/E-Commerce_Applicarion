import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/cubit.dart';
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/states.dart';
import 'package:ecommerce_app/modules/authentication/login.dart';
import 'package:ecommerce_app/modules/authentication/register.dart';
import 'package:ecommerce_app/modules/onboarding/onboarding_screen.dart';
import 'package:ecommerce_app/modules/search/searchScreen.dart';
import 'package:ecommerce_app/modules/shop_layout/home.dart';
import 'package:ecommerce_app/network/end_points.dart';
import 'package:ecommerce_app/network/local/shared_preferenced.dart';
import 'package:ecommerce_app/network/remote/dio_helper.dart';
import 'package:ecommerce_app/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  String startWidget;
  bool onBoarding =CashHelper.getData(key:'onBoarding');
   token =CashHelper.getData(key:'token');
   print(token);
  if(onBoarding!=null){
    if(token!=null)
      startWidget=HomeScreen.HomeScreenRoute;
    else
      startWidget=Login.loginRoute;
  }
  else{
    startWidget=OnboardingScreen.OnboardingRoute;
  }

  runApp(MyApp(
    onBoarding: onBoarding,
    startWidget:startWidget ,
  ));
}

class MyApp extends StatelessWidget {

  bool onBoarding;
  String startWidget;


  MyApp({this.onBoarding,this.startWidget}); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..getHomeDate()..getCategoryDate()..getFavoritesDate()..getProfileDate(),
      child: BlocConsumer<AppCubit,Appstates>(
        listener: (context,state){},
        builder:(context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Themes.lightTheme,
            darkTheme: Themes.darkTheme,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark :ThemeMode.light ,
            routes: {
              OnboardingScreen.OnboardingRoute:(context)=>OnboardingScreen(),
              Login.loginRoute:(context)=>Login(),
              HomeScreen.HomeScreenRoute:(context)=>HomeScreen(),
              SearchScreen.SearchScreenRoutes:(context)=>SearchScreen(),
              Register.RegisterRoute:(context)=>Register(),
            },
              //startWidget,
            initialRoute: Login.loginRoute,
          );
        } ,

      ),
    );
  }
}
