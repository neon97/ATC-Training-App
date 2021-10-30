import 'package:atc/const/data.dart';
import 'package:atc/const/mediaquerry.dart';
import 'package:atc/model/trainings/trainig.dart';
import 'package:atc/model/trainings/trainings.dart';
import 'package:atc/view/home/widgets/carousel.dart';
import 'package:atc/view/home/widgets/trainingCard.dart';
import 'package:atc/view/sort_filter/sortFilter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Trainig> selectedDefault = [];
Trainings trainings = Trainings.fromJson(carousel);

_HomeScreenState? homeScreenState;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    homeScreenState = _HomeScreenState();
    return homeScreenState!;
  }
}

class _HomeScreenState extends State<HomeScreen> {
  //datatypes
  double _carouselHeight = 220;
  @override
  void initState() {
    selectedDefault = trainings.trainigs!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Trainings"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            _headerHighlights(),
            Container(
              color: Colors.white,
              height: marginPadding,
            ),
            Container(
                color: Colors.grey[300],
                width: deviceHeight,
                child: Column(
                  children: selectedDefault.map(
                    (value) {
                      return trainingCard(value, context);
                    },
                  ).toList(),
                )),
          ],
        ),
      ),
    );
  }

  _headerHighlights() {
    return Container(
      color: Colors.white,
      height: _carouselHeight,
      width: deviceWidth,
      child: Stack(
        children: [
          Container(
            height: _carouselHeight / 2,
            color: Theme.of(context).primaryColor,
            width: deviceWidth,
            padding: EdgeInsets.all(marginPadding!),
            child: Text(
              "Highlights",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Center(
            child: carouselWidget(_carouselHeight, trainings),
          ),
          _filterButton()
        ],
      ),
    );
  }

  _filterButton() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(top: marginPadding!, left: marginPadding!),
        child: GestureDetector(
          onTap: () {
            print("helloindia");
            showModalBottomSheet(
                context: context, builder: (context) => SortFilter());
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.grey,
                )),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  CupertinoIcons.slider_horizontal_3,
                  size: 17,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Filter",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
