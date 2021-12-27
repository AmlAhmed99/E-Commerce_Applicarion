
import 'package:ecommerce_app/Bloc(Cubit)/AppCubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      //width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children:[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.camera),
                  onPressed: () {
                    AppCubit.get(context).takePhoto(ImageSource.camera);
                  },
                ),
                Text("Gallary")
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.image),
                  onPressed: () {
                    AppCubit.get(context).takePhoto(ImageSource.gallery);
                  },

                ),
                Text("Camera")
              ],
            ),
          ]
          ),
        ],
      ),
    );
  }

}
