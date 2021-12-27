
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/cubit.dart';
import 'package:ecommerce_app/models/homemodel.dart';
import 'package:flutter/material.dart';

class productGridItem extends StatelessWidget {
  @required Products model;
  @required BuildContext context;
  @required int index;

  productGridItem({this.model, this.context, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
            ),
            child: Image(
              image: NetworkImage(
                model.image,
              ),
              //fit: BoxFit.cover,
              height: 250.0,
            ),
          ),
          if (model.discount != 0)
            Container(
              child: Text(
                'Discount',
                // style: white12regular(),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 5.0,
              ),
              color: Colors.red,
            ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                if (model.discount != 0)
                  Row(
                    children: [
                      Text(
                        '${model.oldPrice.round()}',
                        // style: black12bold().copyWith(
                        //   color: Colors.grey,
                        //   decoration: TextDecoration.lineThrough,
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        child: Container(
                          width: 1.0,
                          height: 10.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '${model.discount}%',
                        // style: black12bold().copyWith(
                        //   color: Colors.red,
                        // ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  model.name,
                  maxLines: 2,
                  style: TextStyle(
                    height: 1.4,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${model.price.round()}',
                         style: TextStyle(
                           color: Colors.blue
                         ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'currency',
                          style: TextStyle(
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),

                    FloatingActionButton(
                      onPressed: () {
                        AppCubit.get(context).changeFavoritesDate(model.id);
                      },
                      heroTag : '4',
                      backgroundColor:Colors.grey[400],
                      mini: true,
                      child: AppCubit.get(context).favourites[model.id]?
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ):
                      Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
