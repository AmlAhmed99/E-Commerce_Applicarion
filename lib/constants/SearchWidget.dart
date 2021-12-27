
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/cubit.dart';
import 'package:ecommerce_app/models/search_model.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {

 Product model;

SearchWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image(
                image: NetworkImage(
                  '${model.image}',
                ),
                //fit: BoxFit.cover,
                height: 150.0,
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    style: TextStyle(
                      height: 1.4,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        //'${model.price.round()}',
                        "${model.price} \$",
                        style: TextStyle(
                            color: Colors.blue
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),


                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
