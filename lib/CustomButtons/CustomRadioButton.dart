import 'package:flutter/material.dart';

import '../custom_radio_grouped_button.dart';

// ignore: must_be_immutable
class CustomRadioButton<T> extends StatefulWidget {
  CustomRadioButton({
    this.buttonLables,
    this.buttonValues,
    this.buttonTextStyle = const ButtonTextStyle(),
    this.autoWidth = false,
    this.radioButtonValue,
    this.unSelectedColor,
    this.unSelectedBorderColor,
    this.padding = 3,
    this.itemMargin = 0.0,
    this.selectedColor,
    this.selectedBorderColor,
    this.height = 35,
    this.width = 100,
    this.enableButtonWrap = false,
    this.horizontal = false,
    this.enableShape = false,
    this.elevation = 10,
    this.defaultSelected,
    this.customShape,
    this.enableRowAverage = false,
    this.wrapAlignment = WrapAlignment.start,
  })  : assert(buttonLables.length == buttonValues.length,
            "Button values list and button lables list should have same number of eliments "),
        assert(unSelectedColor != null, "Unselected color cannot be null"),
        assert(buttonValues.toSet().length == buttonValues.length, "Multiple buttons with same value cannot exist"),
        // assert(buttonLables.toSet().length == buttonLables.length,
        //     "Multiple buttons label wth same value cannot exist"),
        assert(selectedColor != null, "Selected color cannot be null");

  ///Orientation of the Button Group
  final bool horizontal;

  ///Values of button
  final List<T> buttonValues;

  ///Default value is 35
  final double height;
  double padding;

  ///Spacing between buttons
  double itemMargin;

  ///Default selected value
  final T defaultSelected;

  ///Only applied when in vertical mode
  ///This will use minimum space required
  ///If enables it will ignore [width] field
  final bool autoWidth;

  ///Use this if you want to keep width of all the buttons same
  final double width;

  final List<String> buttonLables;

  ///Styling class for label
  final ButtonTextStyle buttonTextStyle;

  final void Function(T) radioButtonValue;

  ///Unselected Color of the button
  final Color unSelectedColor;

  ///Selected Color of button
  final Color selectedColor;

  ///Unselected Color of the button border
  final Color unSelectedBorderColor;

  ///Selected Color of button border
  final Color selectedBorderColor;

  /// A custom Shape can be applied (will work only if [enableShape] is true)
  final ShapeBorder customShape;

  ///alignment for button when [enableButtonWrap] is true
  final WrapAlignment wrapAlignment;

  /// This will enable button wrap (will work only if orientation is vertical)
  final bool enableButtonWrap;

  final bool enableRowAverage;

  ///if true button will have rounded corners
  ///If you want custom shape you can use [customShape] property
  final bool enableShape;
  final double elevation;

  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String _currentSelectedLabel;

  Color borderColor(index) =>
      (_currentSelectedLabel == widget.buttonLables[index]
          ? widget.selectedBorderColor
          : widget.unSelectedBorderColor) ??
      Theme.of(context).primaryColor;

  @override
  void initState() {
    super.initState();
    if (widget.defaultSelected != null) {
      if (widget.buttonValues.contains(widget.defaultSelected)) {
        int index = widget.buttonValues.indexOf(widget.defaultSelected);
        _currentSelectedLabel = widget.buttonLables[index];
      } else
        throw Exception("Default Value not found in button value list");
    }
  }

  List<Widget> _buildButtonsColumn() {
    return widget.buttonValues.map((e) {
      int index = widget.buttonValues.indexOf(e);
      return Padding(
        padding: EdgeInsets.all(widget.padding),
        child: Card(
          margin: EdgeInsets.all(widget.itemMargin),
          color: _currentSelectedLabel == widget.buttonLables[index] ? widget.selectedColor : widget.unSelectedColor,
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
              shape: widget.enableShape
                  ? widget.customShape == null
                      ? OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor(index), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )
                      : widget.customShape
                  : OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor(index), width: 1),
                      borderRadius: BorderRadius.zero,
                    ),
              onPressed: () {
                widget.radioButtonValue(e);
                setState(() {
                  _currentSelectedLabel = widget.buttonLables[index];
                });
              },
              child: Center(
                child: Text(
                  widget.buttonLables[index],
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: widget.buttonTextStyle.textStyle.copyWith(
                    color: _currentSelectedLabel == widget.buttonLables[index]
                        ? widget.buttonTextStyle.selectedColor
                        : widget.buttonTextStyle.unSelectedColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildButtonsRow() {
    return widget.buttonValues.map((e) {
      int index = widget.buttonValues.indexOf(e);
      return Card(
        margin: EdgeInsets.all(widget.itemMargin),
        color: _currentSelectedLabel == widget.buttonLables[index] ? widget.selectedColor : widget.unSelectedColor,
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
            shape: widget.enableShape
                ? widget.customShape == null
                    ? OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor(index), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )
                    : widget.customShape
                : OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor(index), width: 1),
                    borderRadius: BorderRadius.zero,
                  ),
            onPressed: () {
              widget.radioButtonValue(e);
              setState(() {
                _currentSelectedLabel = widget.buttonLables[index];
              });
            },
            child: Center(
              child: Text(
                widget.buttonLables[index],
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: widget.buttonTextStyle.textStyle.copyWith(
                  color: _currentSelectedLabel == widget.buttonLables[index]
                      ? widget.buttonTextStyle.selectedColor
                      : widget.buttonTextStyle.unSelectedColor,
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemMargin == 0) {
      widget.padding = 0;
    }
    return _buildRadioButtons();
  }

  _buildRadioButtons() {
    if (widget.enableRowAverage)
      return Container(
        child: Row(
          children: _buildButtonsRowSpaceEvenly(_buildButtonsRow()),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      );
    if (widget.horizontal)
      return Container(
        height: widget.height * (widget.buttonLables.length * 1.5) + widget.padding * 2 * widget.buttonLables.length,
        child: Center(
          child: CustomListViewSpacing(
            spacing: widget.itemMargin,
            scrollDirection: Axis.vertical,
            children: _buildButtonsColumn(),
          ),
        ),
      );
    if (!widget.horizontal && widget.enableButtonWrap)
      return Container(
        child: Center(
          child: Wrap(
            spacing: widget.itemMargin,
            direction: Axis.horizontal,
            alignment: widget.wrapAlignment,
            children: _buildButtonsRow(),
          ),
        ),
      );
    if (!widget.horizontal && !widget.enableButtonWrap)
      return Container(
        height: widget.height + widget.padding * 2,
        child: Center(
          child: CustomListViewSpacing(
            spacing: widget.itemMargin,
            scrollDirection: Axis.horizontal,
            children: _buildButtonsRow(),
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
