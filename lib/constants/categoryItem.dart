
import 'package:ecommerce_app/models/categoriesmodel.dart';

import 'package:flutter/material.dart';

class categoryItem extends StatelessWidget {
  ProductData model;
  categoryItem(this.model);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       // navigateTo(context, SingleCategoryScreen(model.id, model.name),);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  2.0,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    '${model.image}',

                  ),
                  fit: BoxFit.cover,

                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              '${model.name}',
            ),
            Spacer(),
            Icon(
             // AppCubit.get(context).appDirection == TextDirection.ltr ? Icons.arrow_forward_ios :
              Icons.arrow_forward_ios,
              size: 14.0,
            ),
          ],
        ),
      ),
    );
  }


}
