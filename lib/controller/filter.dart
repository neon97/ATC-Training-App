import 'package:atc/model/trainings/trainig.dart';
import 'package:atc/utils/popup.dart';
import 'package:atc/view/home/home_screen.dart';
import 'package:atc/view/sort_filter/sortFilter.dart';
import 'package:flutter/material.dart';

runFilter(String enteredKeyword, List _allUsers) {
  print(enteredKeyword);
  List results = [];
  if (enteredKeyword.isEmpty) {
    results = _allUsers;
  } else {
    results = _allUsers
        .where(
            (user) => user.toLowerCase().contains(enteredKeyword.toLowerCase()))
        .toList();
  }
  print(results);
  return results;
}

getFiltered(BuildContext context) {
  List<Trainig> temp = [];
  trainings.trainigs!.forEach((element) {
    if (selectedLocation.contains(element.deadline!.location)) {
      temp.add(element);
    } else if (selectedLocation.contains(element.name)) {
      temp.add(element);
    } else if (selectedLocation.contains(element.speaker!.name)) {
      temp.add(element);
    } else {}
  });

  if (temp.isEmpty) {
    selectedDefault = trainings.trainigs!;
    homeScreenState!.setState(() {});
    popup(context, "No Data to Filter", true);
  } else {
    selectedDefault = temp;
    homeScreenState!.setState(() {});
    Navigator.pop(context);
  }
}
