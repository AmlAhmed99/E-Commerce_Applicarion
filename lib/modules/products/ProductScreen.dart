
import 'package:conditional_builder/conditional_builder.dart';
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/cubit.dart';
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/states.dart';
import 'package:ecommerce_app/constants/ProductWidget.dart';
import 'package:ecommerce_app/constants/productGridItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,Appstates>(
      listener: (context,state){},
      builder: (context,state){
        return  ConditionalBuilder(
          condition: AppCubit.get(context).homemodel!=null,
          builder: (context){return SingleChildScrollView(
            child: Column(
              children: [
                ProductWidget( AppCubit.get(context).homemodel),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  color: Colors.grey[300],
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                    childAspectRatio: 1 / 2.3,
                    children: List.generate(
                      AppCubit.get(context).homemodel.data.products.length,
                          (index) => productGridItem(
                        model: AppCubit.get(context).homemodel.data.products[index],
                        context: context,
                        index: index,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );},
          fallback: (context){
            return Center(child: CircularProgressIndicator());},
        );
      },
    );
  }
}
