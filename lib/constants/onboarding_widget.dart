
import 'package:ecommerce_app/models/onboardingmodel.dart';
import 'package:ecommerce_app/styles/colors.dart';
import 'package:flutter/material.dart';

class OnboadingWidget extends StatelessWidget {
  OnboardingModel onboardingModel;

  OnboadingWidget(this.onboardingModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            child: Image.asset(onboardingModel.imgUrl),
            decoration: BoxDecoration(
              color: Appcolors.darkblue,
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 120.0)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(onboardingModel.title,style: TextStyle(
              fontSize: 30,
              color: Appcolors.Darkblue,
              fontWeight: FontWeight.bold
          ),),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0,vertical: 40),
                  child: Text(onboardingModel.description,style: TextStyle(
                    fontSize: 15,
                    color: Appcolors.Darkblue,
                  ),

                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // ElevatedButton(
                //   onPressed: (){},
                //   style: ButtonStyle(
                //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //         RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(18.0),
                //         )
                //     ),
                //     backgroundColor:  MaterialStateProperty.all<Color>(Colors.orange),
                //   ),
                //
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                //     child: Text('BUY',style: TextStyle(
                //         fontSize: 30,
                //         color:Colors.white,
                //         fontWeight: FontWeight.bold
                //     ),),
                //   ),
                //
                // )
              ],
            ),
            decoration: BoxDecoration(
              color: Appcolors.lightblue,
              borderRadius: BorderRadius.vertical(
                  top:  Radius.elliptical(
                      MediaQuery.of(context).size.width, 120.0)),
            ),
          ),
        ),


      ],
    );
  }
}
