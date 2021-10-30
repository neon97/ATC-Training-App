import 'package:atc/const/mediaquerry.dart';
import 'package:atc/model/trainings/trainig.dart';
import 'package:atc/model/trainings/trainings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

carouselWidget(
  double _carouselHeight,
  Trainings _trainings,
) {
  return Container(
    height: _carouselHeight / 1.8,
    width: deviceWidth,
    child: CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          enableInfiniteScroll: true,
          viewportFraction: 0.8,
          enlargeCenterPage: true,
          height: _carouselHeight / 1.8),
      items: _trainings.trainigs!.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              height: _carouselHeight / 1.8,
              width: deviceWidth,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(i.image!),
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.black54, BlendMode.darken))),
              child: _imageInsider(i, context),
            );
          },
        );
      }).toList(),
    ),
  );
}

_imageInsider(Trainig _trainig, BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(marginPadding! / 2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          _trainig.name!,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          "${_trainig.deadline!.location!} - ${_trainig.deadline!.dates!}",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "${_trainig.currency}${_trainig.price}",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${_trainig.currency}${_trainig.newPrice}",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                "View Details →",
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        )
      ],
    ),
  );
}
