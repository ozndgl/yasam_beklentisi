import 'package:flutter/material.dart';
import 'package:flutter_projects/constants.dart';
import 'package:flutter_projects/result_page.dart';
import 'package:flutter_projects/user_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_cinsiyet.dart';
import 'my_container.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  String seciliCinsiyet;
  double icilenSigara = 15;
  double sporGunu = 0;
  int boy = 170;
  int kilo = 60;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "YAŞAM BEKLENTİSİ",
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButoon("BOY"),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButoon("KİLO"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Haftada Kaç Gün Spor Yapıyorsunuz?",
                      style: kMetinStili,
                    ),
                    Text(
                      sporGunu.round().toString(),
                      style: kSayiStili,
                    ),
                    Slider(
                      min: 0,
                      max: 7,
                      divisions: 7,
                      value: sporGunu,
                      onChanged: (double newValue) {
                        setState(() {
                          sporGunu = newValue;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Günde Kaç Sigara İçiyorsun",
                      style: kMetinStili,
                    ),
                    Text(
                      icilenSigara.round().toString(),
                      style: kSayiStili,
                    ),
                    Slider(
                      min: 0,
                      max: 30,
                      value: icilenSigara,
                      onChanged: (double newValue) {
                        setState(() {
                          icilenSigara = newValue;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = "KADIN";
                        });
                      },
                      renk: seciliCinsiyet == "KADIN"
                          ? Colors.lightBlue
                          : Colors.white,
                      child: IconCinsiyet(
                        cinsiyet: "KADIN",
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = "ERKEK";
                        });
                      },
                      renk: seciliCinsiyet == "ERKEK"
                          ? Colors.lightBlue
                          : Colors.white,
                      child: IconCinsiyet(
                        cinsiyet: "ERKEK",
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonTheme(height: 50,
              child: FlatButton(
                  color: Colors.white, onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                      UserData(kilo: kilo,boy: boy,seciliCinsiyet: seciliCinsiyet,sporGunu: sporGunu,icilenSigara: icilenSigara )


                    )));
              },
                  child: Text("HESAPLA",style:  kMetinStili,)),
            )
          ],
        ));
  }

  Row buildRowOutlineButoon(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label,
              style: kMetinStili,
            )),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label == "BOY" ? boy.toString() : kilo.toString(),
              style: kSayiStili,
            )),
        SizedBox(
          width: 25,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              // ignore: deprecated_member_use
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    label == "BOY" ? boy++ : kilo++;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              // ignore: deprecated_member_use
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    label == "BOY" ? boy-- : kilo--;
                  });
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
