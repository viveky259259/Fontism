import 'package:flutter/material.dart';

class ResponsiveHelper extends StatefulWidget {
  final Widget webWidget;
  final Widget mobileWidget;

  const ResponsiveHelper(
      {Key? key, required this.webWidget, required this.mobileWidget})
      : super(key: key);

  @override
  _ResponsiveHelperState createState() => _ResponsiveHelperState();
}

class _ResponsiveHelperState extends State<ResponsiveHelper> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 500
        ? widget.mobileWidget
        : widget.webWidget;
  }
}
