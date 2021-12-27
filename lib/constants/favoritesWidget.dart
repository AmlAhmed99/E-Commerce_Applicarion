
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/cubit.dart';
import 'package:ecommerce_app/models/add_favourite_model.dart';
import 'package:ecommerce_app/models/favourit_model.dart';
import 'package:flutter/material.dart';

class FavoritesWidget extends StatelessWidget {
  FavoriteData favModel;

  FavoritesWidget(this.favModel);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image(
                  image: NetworkImage(
                    '${favModel.product.image}',
                  ),
                  //fit: BoxFit.cover,
                  height: 150.0,
                ),
               if (favModel.product.discount != 0)
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
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    favModel.product.name,
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
                        '${favModel.product.price}',
                        style: TextStyle(
                            color: Colors.blue
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${favModel.product.oldPrice}',
                        style: TextStyle(
                            color: Colors.grey
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          AppCubit.get(context).changeFavoritesDate(favModel.product.id);
                        },
                        heroTag : '4',
                        backgroundColor:Colors.transparent,
                        elevation: 0,
                        mini: true,
                        child:// AppCubit.get(context).favourites[model.id]?
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          // ):
                          // Icon(
                          //   Icons.favorite_border,
                          //   color: Colors.white,
                          // )
                        ),
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
