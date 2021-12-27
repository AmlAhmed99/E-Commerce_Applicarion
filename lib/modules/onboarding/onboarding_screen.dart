import 'package:ecommerce_app/constants/onboarding_widget.dart';
import 'package:ecommerce_app/models/onboardingmodel.dart';
import 'package:ecommerce_app/modules/authentication/login.dart';
import 'package:ecommerce_app/network/local/shared_preferenced.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const OnboardingRoute='OnboardingRoute' ;
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingModel> onboardingScreens = [
    OnboardingModel(imgUrl: 'assets/images/screen1.png',description: ' Lorem Ipsum has been the industry\'s standard'
        ' dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make'
        ' a type specimen book.',title: 'SELECT'),
    OnboardingModel(imgUrl: 'assets/images/screen2.png',description: ' Lorem Ipsum has been the industry\'s standard'
        ' dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make'
        ' a type specimen book.',title: 'PAY'),
    OnboardingModel(imgUrl: 'assets/images/screen3.png',description: ' Lorem Ipsum has been the industry\'s standard'
        ' dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make'
        ' a type specimen book.',title: 'RECEIVE'),
  ];

  var pageController=PageController();

  bool isLast=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Expanded(
                  child: PageView.builder(
                    controller:pageController ,
                    physics:BouncingScrollPhysics() ,
                      itemBuilder: (Context, index) => OnboadingWidget(onboardingScreens[index]),
                    itemCount: onboardingScreens.length,
                    onPageChanged: (index){
                      if(index==onboardingScreens.length-1)
                      {
                        setState(() {
                          isLast=true;
                        });
                      }
                      else{
                        isLast=false;
                      }

                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                          controller: pageController,
                          count: onboardingScreens.length,
                          effect: ExpandingDotsEffect(
                            activeDotColor: Colors.orange,
                            dotColor: Colors.grey,
                            dotHeight: 10,
                            spacing: 5,
                            dotWidth: 10,
                            expansionFactor: 4
                          ),
                      ),
                      FloatingActionButton(
                          onPressed: (){
                         if(isLast)
                           {
                             submit();

                           }
                         else{
                           pageController.nextPage(
                               duration: Duration(milliseconds: 750),
                               curve: Curves.fastLinearToSlowEaseIn
                           );
                         }

                          },
                        backgroundColor: Colors.orange,
                        child: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ],
                  ),
                )
              ],
            ),

        ));
  }

  void submit(){
    CashHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value)
        {
          Navigator.pushReplacementNamed(context, Login.loginRoute);
        }
    });
  }
}
