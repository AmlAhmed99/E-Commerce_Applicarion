import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/homemodel.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  Homemodel model;

  ProductWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        //onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      items: model.data.banners
          .map(
            (item) => Image(
              image: NetworkImage(item.image),
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          )
          .toList(),
    );
  }
}
