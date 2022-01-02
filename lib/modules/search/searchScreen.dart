
import 'package:conditional_builder/conditional_builder.dart';
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/cubit.dart';
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/states.dart';
import 'package:ecommerce_app/constants/SearchWidget.dart';
import 'package:ecommerce_app/constants/custom_edit_text.dart';
import 'package:ecommerce_app/constants/favoritesWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  static const SearchScreenRoutes='SearchScreenRoutes';
  var textController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, Appstates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var searchItem = AppCubit.get(context).searchModel;

        return Scaffold(
          appBar: AppBar(title: Text("Search Product"),),
          body:  Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if(state is LoadSearchstate)
                    LinearProgressIndicator(),
                  SizedBox(height:10 ,),
                  CustomTextEditingControl(
                    Controller: textController,
                    label: 'Product Name',
                    icon: Icons.search,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onSubmit: (value){
                      AppCubit.get(context).searchDate(
                        text:value
                      );
                    },
                  ),
                SizedBox(height: 20,),
                Expanded(
                  child: ConditionalBuilder(
                      condition: searchItem != null,
                      builder: (context) => ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => SearchWidget(searchItem.data.data[index]),
                        separatorBuilder: (context, index) => Container(
                          width: double.infinity,
                          height: 1.0,
                          color: Colors.grey[300],
                        ),
                        itemCount: searchItem.data.data.length,
                      ),
                      fallback: (context) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/noItem.png'),
                          Text('Type to search products'),
                        ],
                      ),
                  ),
                )
                ],

              ),
            ),
          ),

        );
      },
    );
  }
}
