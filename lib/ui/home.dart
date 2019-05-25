import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  AboutState createState() {
    return AboutState();
  }

}

class AboutState extends State<About> {
  double _sliderValueBG = 10.0;
  double _sliderValueVFX = 10.0;
  bool _noti = false;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
          children: <Widget>[
            _slider(),
            Text('___________\n', textAlign: TextAlign.center, ),
            Text('รหัสนักศึกษา\n', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
            Text('60070023\n', textAlign: TextAlign.center,),
            
          ]
         

        ),
      ),
    );
  }
}


Widget _slider(){
  return Padding(
    padding: EdgeInsets.all(5),
  
  );
}