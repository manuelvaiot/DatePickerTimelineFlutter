/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final DateTime date;
  final bool exibirMes;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final Color defaultColorSelect;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    required this.exibirMes,
    required this.defaultColorSelect,
    this.width,
    this.height,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          color: selectionColor,
        ),
        child: Container(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 11,
              ),
              Text(
                new DateFormat("E", locale).format(date).capitalize(), // WeekDay
                style: dayTextStyle,
              ),
              Visibility(
                visible: selectionColor != defaultColorSelect,
                child: SizedBox(
                  height: 20,
                ),
                replacement: SizedBox(
                  height: 5,
                ),
              ),
              Text(
                date.day.toString(), // Date
                style: dateTextStyle,
              ),
              /*Visibility(
                visible: exibirMes,
                child: Text(
                  new DateFormat("MMM", locale).format(date).toUpperCase(), // Month
                  style: monthTextStyle,
                ),
              ),*/
            ],
          ),
        ),
      ),
      onTap: () {
        // Check if onDateSelected is not null
        if (onDateSelected != null) {
          // Call the onDateSelected Function
          onDateSelected!(this.date);
        }
      },
    );
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.toLowerCase().substring(1)}";
  }
}
