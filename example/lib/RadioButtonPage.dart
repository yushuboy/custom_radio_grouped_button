import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button Example'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Grouped Button'),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.check_box),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              'Horizontal',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Shape Disabled',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRadioButton(
                        horizontal: false,
                        enableShape: true,
                        itemPadding: EdgeInsets.all(3),
                        unSelectedColor: Theme.of(context).canvasColor,
                        buttonLables: ['Student', 'Parent', 'Teacher', 'hgfh', 'jhgiugx'],
                        buttonValues: ["STUDENT", "PARENT", "TEACHER", 'hgfh', 'jhgiugx'],
                        defaultSelected: "STUDENT",
                        radioButtonValue: (value) {
                          print(value);
                        },
                        customShape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        itemMargin: EdgeInsets.all(0),
                        selectedColor: Theme.of(context).accentColor,
                        selectedBorderColor: Theme.of(context).accentColor,
                        unSelectedBorderColor: Theme.of(context).canvasColor,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Shape Enabled',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRadioButton(
                        horizontal: false,
                        enableShape: true,
                        elevation: 0,
                        itemMargin: EdgeInsets.all(0),
                        itemPadding: EdgeInsets.all(5),
                        unSelectedColor: Theme.of(context).canvasColor,
                        buttonLables: [
                          'Student',
                          'Parent',
                          'Teacher',
                        ],
                        buttonValues: [
                          1,
                          2,
                          3,
                        ],
                        customShape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        defaultSelected: 1,
                        radioButtonValue: (value) {
                          print(value);
                        },
                        selectedColor: Theme.of(context).accentColor,
                        selectedBorderColor: Theme.of(context).accentColor,
                        unSelectedBorderColor: Theme.of(context).canvasColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Verticle',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Shape Disabled',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRadioButton(
                      elevation: 0,
                      itemMargin: EdgeInsets.all(0),
                      buttonLables: [
                        'Student',
                        'Parent',
                        'Teacher',
                      ],
                      buttonValues: [
                        "STUDENT",
                        "PARENT",
                        "TEACHER",
                      ],
                      horizontal: true,
                      enableShape: true,
                      customShape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue, width: 1),
                      ),
                      buttonTextStyle: ButtonTextStyle(
                          selectedColor: Colors.white,
                          unSelectedColor: Colors.black,
                          textStyle: TextStyle(fontSize: 16)),
                      radioButtonValue: (value) {
                        print(value);
                      },
                      defaultSelected: 'STUDENT',
                      selectedColor: Theme.of(context).accentColor,
                      unSelectedColor: Theme.of(context).canvasColor,
                      selectedBorderColor: Theme.of(context).accentColor,
                      unSelectedBorderColor: Theme.of(context).canvasColor,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Shape Enabled',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRadioButton<int>(
                      enableShape: true,
                      elevation: 0,
                      itemMargin: EdgeInsets.all(0),
                      height: 30,
                      itemPadding: EdgeInsets.all(3),
                      defaultSelected: 1,
                      enableRowAverage: true,
                      autoWidth: true,
                      buttonLables: [
                        "Monday",
                        "Tuesday",
                        "Wednesday",
                        "Thursday",
                        // "Friday",
                        // "Saturday",
                        // "Sunday",
                      ],
                      buttonValues: [
                        1,
                        2,
                        3,
                        4,
                        // 5,
                        // 6,
                        // 7,
                      ],
                      radioButtonValue: (dynamic value) {
                        print("$value");
                      },
                      customShape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      selectedColor: Theme.of(context).accentColor,
                      unSelectedColor: Theme.of(context).canvasColor,
                      selectedBorderColor: Theme.of(context).accentColor,
                      unSelectedBorderColor: Theme.of(context).canvasColor,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
