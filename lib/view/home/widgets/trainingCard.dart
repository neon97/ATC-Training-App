import 'package:atc/const/mediaquerry.dart';
import 'package:atc/model/trainings/speaker.dart';
import 'package:atc/model/trainings/trainig.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

Widget trainingCard(Trainig _training, BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(marginPadding! / 2).copyWith(bottom: 0),
    child: Card(
      child: Padding(
        padding: EdgeInsets.all(marginPadding! / 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
//timigs & location
            Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _training.deadline!.dates!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _training.deadline!.timings!,
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Text(
                      "${_training.deadline!.place!},\n${_training.deadline!.location!}",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )
                  ],
                )),

            SizedBox(
              width: 10,
              height: 108,
              child: DottedLine(
                direction: Axis.vertical,
                lineThickness: 0.3,
              ),
            ),
//speaker data & status
            Expanded(
                flex: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _training.status!,
                      style: TextStyle(
                          fontSize: 10,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${_training.name!} (${_training.ratings!})",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 8,
                    ),

//image and name
                    Row(
                      children: [
                        _circleAvatar(_training.speaker),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Keynote Speaker",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              _training.speaker!.name!,
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
//enroll button
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          "Enroll Now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    ),
  );
}

_circleAvatar(Speaker? speaker) {
  return Stack(
    children: [
      CircleAvatar(
        radius: 18,
        backgroundImage: NetworkImage(
          speaker!.image!,
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 7,
          backgroundImage: NetworkImage(speaker.langImage!),
        ),
      )
    ],
  );
}
