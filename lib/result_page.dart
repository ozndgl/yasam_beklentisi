import 'package:flutter/material.dart';
import 'package:flutter_projects/constants.dart';
import 'package:flutter_projects/hesap.dart';
import 'package:flutter_projects/user_data.dart';
import 'hesap.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sonuç sayfası"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                Hesap(_userData).Hesaplama().toString(),
                style: kMetinStili,
              ))),
          Expanded(
              child: FlatButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "GERİ DÖN",
              style: kMetinStili,
            ),
          ))
        ],
      ),
    );
  }
}
