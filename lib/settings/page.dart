import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ///
  /// Working on getting basic color that setup the app
  /// working on settings design as well in XD
  ///
  /// create basic and advanced setting system.
  /// based on basic create advanced theme data too
  /// let user edit that advanced setting in advanced settings
  ///
  Color? primaryColor;
  Color? primaryDarkColor;
  Color? accentColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(scaffoldBackgroundColor: Colors.white),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    offset: Offset(0, 3),
                  ),
                ]),
                padding: EdgeInsets.all(16),
                child: Text('Basic Settings'),
              ),
              SizedBox(
                height: 16,
              ),
              eachColor('Primary Color', primaryColor, () {
                showColorPicker(
                    context: context,
                    color: primaryColor,
                    onColorChange: (Color color) {
                      setState(() {
                        primaryColor = color;
                      });
                    });
              }),
              Divider(),
              eachColor('Primary Dark Color', primaryDarkColor, () {
                showColorPicker(
                    context: context,
                    color: primaryDarkColor,
                    onColorChange: (Color color) {
                      setState(() {
                        primaryDarkColor = color;
                      });
                    });
              }),
              Divider(),
              eachColor('Accent Color', accentColor, () {
                showColorPicker(
                    context: context,
                    color: accentColor,
                    onColorChange: (Color color) {
                      setState(() {
                        accentColor = color;
                      });
                    });
              }),
              Divider(),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                      context,
                      ThemeData(
                          primaryColor: primaryColor,
                          accentColor: accentColor,
                          primaryColorDark: primaryDarkColor));
                },
                child: Text('Apply')),
          ],
        ),
      ),
    );
  }

  void showColorPicker(
      {required BuildContext context,
      Color? color,
      required Function(Color) onColorChange}) {
    showDialog(
        context: context,
        builder: (_) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    elevation: 2,
                    child: ColorPicker(
                      // Use the screenPickerColor as start color.

                      color: color ?? Colors.green,
                      pickersEnabled: {
                        ColorPickerType.wheel: true,
                        ColorPickerType.accent: false,
                        ColorPickerType.primary: false,
                      },
                      // Update the screenPickerColor using the callback.
                      onColorChanged: onColorChange,
                      width: 44,
                      height: 44,
                      borderRadius: 22,
                      heading: Text(
                        'Select color',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      subheading: Text(
                        'Select color shade',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }

  Widget eachColor(String name, Color? color, Function onTap) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Text(name),
            Spacer(),
            CircleAvatar(
              backgroundColor: color,
              child: Icon(
                Icons.touch_app_rounded,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
