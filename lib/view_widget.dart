import 'package:flutter/material.dart';

class ViewWidget extends StatelessWidget {
  Widget textFieldPlaceHolderWidget(String text) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AspectRatio(
          aspectRatio:(MediaQuery.of(context).size.height>MediaQuery.of(context).size.width)? 1.5:4,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hey there',
                  style: TextStyle(fontSize: 64),
                ),
                Text(
                  'Tried this?',
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              children: <Widget>[
                textFieldPlaceHolderWidget('Enter email'),
                SizedBox(
                  height: 16,
                ),
                textFieldPlaceHolderWidget('Enter password'),
                SizedBox(
                  height: 24,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  width: double.infinity,
                  child: OutlineButton(
                    borderSide: BorderSide(color: Colors.indigo.shade200, width: 3),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.indigo, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    onPressed: () {},
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
