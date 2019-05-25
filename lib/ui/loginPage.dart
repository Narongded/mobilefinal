import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_final/db/db.dart';
import 'package:mobile_final/model/modelLogin.dart';
import 'regisPage.dart';

class Page_login extends StatefulWidget {
  @override
  Myform createState() {
    return Myform();
  }
}

class Myform extends State<Page_login> {
  final _formKey = GlobalKey<FormState>();

  List<TextEditingController> textControl = [
    new TextEditingController(),
    new TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text("Login")
      ),
      body: Builder(
        // Create an inner BuildContext so that the onPressed methods
        // can refer to the Scaffold with Scaffold.of().
        builder: (BuildContext context) {
      return Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.network(
                "https://software.thaiware.com/upload_misc/software/2014_01/728/3671_14011611090174.png",
                height: 200,
              ),
              margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
            ),
            Container(
              child: TextFormField(
                controller: textControl[0],
                decoration: InputDecoration(
                  labelText: "User Id",
                  hintText: "User Id",
                  icon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return "กรุณาระบุ user";
                  }
                },
              ),
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            ),
            Container(
              child: TextFormField(
                controller: textControl[1],
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "password",
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return "กรุณาระบุ password";
                  } 
                },
              ),
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            ),
            Container(
              child: RaisedButton(
                child: Text("LOGIN"),
                onPressed: () async{
                  if (!_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Please fill out this form"),
                    ));
                  }
                  else {
                    List<User> users = await DBProvider.db.getAllUser();
                    bool check = false;
                    for(int i=0;i<users.length;i++){
                
                      if(users[i].userid == textControl[0].text && users[i].password == textControl[1].text){
                        check =true;
                        Navigator.pushNamed(context, "/home");

                      }
                    }
                    if(!check) {
                      Fluttertoast.showToast(msg:"Invalid user or password", toastLength:Toast.LENGTH_SHORT);}
                  }
                },
              ),
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: GestureDetector(
                    child: Text("Register New Account",
                        style: TextStyle(color: Colors.black),
                        textDirection: TextDirection.ltr),
                    onTap: () {
                      Navigator.pushNamed(context, "/register");
                    },
                  ),
                  margin: EdgeInsets.fromLTRB(0, 10, 15, 0),
                ))
          ],
        ),
      );
    }));
  }
}
