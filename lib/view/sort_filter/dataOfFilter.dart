import 'package:atc/const/mediaquerry.dart';
import 'package:atc/controller/filter.dart';
import 'package:atc/view/sort_filter/sortFilter.dart';
import 'package:flutter/material.dart';

List selection = [];

filterWidget(List section, TextEditingController field,
    void setState(void Function() fn), BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.grey,
              )),
          child: TextFormField(
            controller: field,
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {
                selection = runFilter(value, section);
              });
            },
          ),
        ),
      ),
      Container(
        width: deviceWidth! / 2,
        height: deviceHeight! / 2.5,
        child: ListView(
          children:
              selection.map((e) => _rowData(e, context, setState)).toList(),
        ),
      ),
    ],
  );
}

Widget _rowData(
    String element, BuildContext context, void setState(void Function() fn)) {
  return Row(
    children: [
      Checkbox(
          activeColor: Theme.of(context).primaryColor,
          value: selectedLocation.contains(element),
          onChanged: (value) {
            setState(() {
              !value!
                  ? selectedLocation.remove(element)
                  : selectedLocation.add(element);
            });
          }),
      Text(element)
    ],
  );
}
