import 'package:custom_radio_grouped_button/CustomButtons/ButtonTextStyle.dart';
import 'package:flutter/material.dart';

import '../custom_radio_grouped_button.dart';

// ignore: must_be_immutable
class CustomCheckBoxGroup<T> extends StatefulWidget {
  CustomCheckBoxGroup({
    Key? key,
    this.horizontal = false,
    required this.buttonValuesList,
    this.buttonTextStyle = const ButtonTextStyle(),
    this.height = 35,
    this.itemPadding = const EdgeInsets.all(0),
    this.itemMargin = const EdgeInsets.all(0),
    this.autoWidth = false,
    this.width = 100,
    this.enableShape = false,
    this.elevation = 0,
    required this.buttonLables,
    required this.checkBoxButtonValues,
    required this.selectedColor,
    required this.selectedBorderColor,
    this.wrapAlignment = WrapAlignment.start,
    required this.defaultSelected,
    required this.unSelectedColor,
    required this.unSelectedBorderColor,
    this.customShape,
    this.enableButtonWrap = false,
    this.enableRowAverage = false,
  })  : assert(buttonLables.length == buttonValuesList.length,
            "Button values list and button lables list should have same number of eliments "),
        assert(buttonValuesList.toSet().length == buttonValuesList.length,
            "Multiple buttons with same value cannot exist"),
        assert((customShape != null && enableShape == true) || (customShape == null),
            "customShape only works when enableShape is true");

  // assert(buttonLables.toSet().length == buttonLables.length,
  //     "Multiple buttons label wth same value cannot exist"),

  ///Orientation of the Button Group
  final bool horizontal;

  ///Values of button
  final List<T> buttonValuesList;

  ///Styling class for label
  final ButtonTextStyle buttonTextStyle;

  ///Default value is 35
  final double height;

  final EdgeInsetsGeometry itemPadding;

  ///Spacing between buttons
  final EdgeInsetsGeometry itemMargin;

  ///Only applied when in vertical mode
  ///This will use minimum space required
  ///If enables it will ignore [width] field
  final bool autoWidth;

  ///Use this if you want to keep width of all the buttons same
  final double width;

  ///if true button will have rounded corners
  ///If you want custom shape you can use [customShape] property
  final bool enableShape;
  final double elevation;

  final List<String> buttonLables;

  final void Function(List<T>) checkBoxButtonValues;

  ///Selected Color of button
  final Color selectedColor;

  ///Selected Color of button border
  final Color selectedBorderColor;

  ///alignment for button when [enableButtonWrap] is true
  final WrapAlignment wrapAlignment;

  ///Default Selected button
  final T defaultSelected;

  ///Unselected Color of the button
  final Color unSelectedColor;

  ///Unselected Color of the button border
  final Color unSelectedBorderColor;

  /// A custom Shape can be applied (will work only if [enableShape] is true)
  final ShapeBorder? customShape;

  /// This will enable button wrap (will work only if orientation is vertical)
  final bool enableButtonWrap;

  ///Average score on a row
  final bool enableRowAverage;

  _CustomCheckBoxGroupState createState() => _CustomCheckBoxGroupState();
}

class _CustomCheckBoxGroupState extends State<CustomCheckBoxGroup> {
  List<dynamic> selectedLables = [];

  Color borderColor(e) => (selectedLables.contains(e) ? widget.selectedBorderColor : widget.unSelectedBorderColor);

  @override
  void initState() {
    super.initState();
    widget.defaultSelected?.where((e) {
      return widget.buttonValuesList.contains(e);
    })?.forEach((e) {
      selectedLables.add(e);
    });
  }

  List<Widget> _buildButtonsColumn() {
    return widget.buttonValuesList.map((e) {
      int index = widget.buttonValuesList.indexOf(e);
      return Card(
        margin: widget.itemMargin,
        color: selectedLables.contains(e) ? widget.selectedColor : widget.unSelectedColor,
        elevation: widget.elevation,
        shape: widget.enableShape
            ? widget.customShape == null
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  )
                : widget.customShape
            : null,
        child: Container(
          height: widget.height,
          child: MaterialButton(
            padding: widget.itemPadding,
            shape: widget.enableShape
                ? widget.customShape == null
                    ? OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor(e), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )
                    : widget.customShape
                : OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor(e), width: 1),
                    borderRadius: BorderRadius.zero,
                  ),
            onPressed: () {
              if (selectedLables.contains(e)) {
                selectedLables.remove(e);
              } else {
                selectedLables.add(e);
              }
              setState(() {});
              widget.checkBoxButtonValues(selectedLables);
            },
            child: Text(
              widget.buttonLables[index],
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: widget.buttonTextStyle.textStyle.copyWith(
                color: selectedLables.contains(e)
                    ? widget.buttonTextStyle.selectedColor
                    : widget.buttonTextStyle.unSelectedColor,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildButtonsRow() {
    return widget.buttonValuesList.map((e) {
      int index = widget.buttonValuesList.indexOf(e);
      return Card(
        margin: widget.itemMargin,
        color: selectedLables.contains(e) ? widget.selectedColor : widget.unSelectedColor,
        elevation: widget.elevation,
        shape: widget.enableShape
            ? widget.customShape == null
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  )
                : widget.customShape
            : null,
        child: Container(
          height: widget.height,
          width: widget.autoWidth ? null : widget.width,
          constraints: BoxConstraints(maxWidth: 250),
          child: MaterialButton(
            padding: widget.itemPadding,
            shape: widget.enableShape
                ? widget.customShape == null
                    ? OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor(e), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )
                    : widget.customShape
                : OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor(e), width: 1),
                    borderRadius: BorderRadius.zero,
                  ),
            onPressed: () {
              if (selectedLables.contains(e)) {
                selectedLables.remove(e);
              } else {
                selectedLables.add(e);
              }
              setState(() {});
              widget.checkBoxButtonValues(selectedLables);
            },
            child: Text(
              widget.buttonLables[index],
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: widget.buttonTextStyle.textStyle.copyWith(
                color: selectedLables.contains(e)
                    ? widget.buttonTextStyle.selectedColor
                    : widget.buttonTextStyle.unSelectedColor,
              ),
            ),
          ),
        ),
        // ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return _buildCheckBoxButtons();
  }

  _buildCheckBoxButtons() {
    if (widget.enableRowAverage)
      return Container(
        child: Row(
          children: _buildButtonsRowSpaceEvenly(_buildButtonsRow()),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      );
    if (widget.horizontal)
      return Container(
        height: widget.height,
        child: Center(
          child: CustomListViewSpacing(
            spacing: widget.itemMargin.horizontal,
            scrollDirection: Axis.horizontal,
            children: _buildButtonsRow(),
          ),
        ),
      );
    if (widget.horizontal && widget.enableButtonWrap)
      return Container(
        child: Center(
          child: Wrap(
            spacing: widget.itemMargin.horizontal,
            direction: Axis.horizontal,
            alignment: widget.wrapAlignment,
            children: _buildButtonsRow(),
          ),
        ),
      );
    if (!widget.horizontal && !widget.enableButtonWrap)
      return Container(
        height: widget.height * (widget.buttonLables.length * 1.5),
        child: Center(
          child: CustomListViewSpacing(
            spacing: widget.itemMargin.vertical,
            scrollDirection: Axis.vertical,
            children: _buildButtonsColumn(),
          ),
        ),
      );
  }

  //Average score on a line
  List<Widget> _buildButtonsRowSpaceEvenly(List<Widget> list) {
    return list.map((e) {
      return Expanded(child: e, flex: 1);
    }).toList();
  }
}
