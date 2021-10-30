import 'package:atc/const/data.dart';
import 'package:atc/const/mediaquerry.dart';
import 'package:atc/controller/filter.dart';
import 'package:atc/view/sort_filter/dataOfFilter.dart';
import 'package:flutter/material.dart';

List selectedLocation = [];

class SortFilter extends StatefulWidget {
  @override
  _SortFilterState createState() => _SortFilterState();
}

class _SortFilterState extends State<SortFilter> {
  //datatypes

  String _selectedSortFilter = "Location";

  //controllers
  final field = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _sortTile(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: sortandfilters.map((e) => _leftSection(e)).toList(),
                )),
            Expanded(flex: 2, child: _checkFilter(_selectedSortFilter))
          ],
        )
      ],
    );
  }

  _checkFilter(String data) {
    switch (data) {
      case "Location":
        field.text.isEmpty ? selection = location : debugPrint("");
        return filterWidget(location, field, setState, context);
      case "Training Name":
        field.text.isEmpty ? selection = trainingName : debugPrint("");
        return filterWidget(trainingName, field, setState, context);
      case "Trainer":
        field.text.isEmpty ? selection = trainer : debugPrint("");
        return filterWidget(trainer, field, setState, context);
      default:
        return SizedBox.shrink();
    }
  }

  Widget _leftSection(String data) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSortFilter = data;
          field.text = "";
        });
      },
      child: Container(
        width: deviceWidth! / 2,
        height: 48,
        color:
            _selectedSortFilter != data ? Colors.grey[300] : Colors.transparent,
        child: Row(
          children: [
            Visibility(
              visible: _selectedSortFilter == data,
              child: Container(
                width: 5,
                height: 48,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _selectedSortFilter != data
                    ? marginPadding!
                    : marginPadding! - 5,
              ),
              child: Text(
                data,
                style: TextStyle(
                    fontWeight: _selectedSortFilter == data
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _sortTile() {
    return Material(
      elevation: 1,
      child: Container(
        height: 48,
        width: deviceWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: marginPadding!),
              child: Text(
                "Sort and Filters",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      getFiltered(context);
                    },
                    icon: Icon(
                      Icons.check_circle_outline_outlined,
                      color: Theme.of(context).primaryColor,
                    )),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                  color: Colors.grey,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
