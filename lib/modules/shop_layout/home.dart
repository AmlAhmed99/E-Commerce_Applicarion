
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/cubit.dart';
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/states.dart';
import 'package:ecommerce_app/modules/search/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const HomeScreenRoute='HomeScreenRoute';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,Appstates>(
        listener:  (context,state){},
        builder: (context,state){
          var cubit= AppCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          title: Text("shop app"),

          actions: [
            IconButton(
                icon: Icon(Icons.search),
              onPressed: (){
                  Navigator.pushNamed(context, SearchScreen.SearchScreenRoutes);
              },
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap:(index){
            cubit.onTap(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,size:30 ,), label:'Home' ),
            BottomNavigationBarItem(icon: Icon(Icons.apps,size:30 ,), label:'Categories' ),
            BottomNavigationBarItem(icon: Icon(Icons.favorite,size:30 ,), label:'Favourites' ),
            BottomNavigationBarItem(icon: Icon(Icons.person,size:30 ,), label:'Profile' ),
          ],
          currentIndex:cubit.currentIndex,

        ),
        body: cubit.Screens[cubit.currentIndex],

      );
    }
    );
  }
}
