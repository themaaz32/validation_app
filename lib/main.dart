import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyForm(),
    );
  }
}

class MyForm extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value){
                  if(value.isEmpty){
                    return "Username can not be empty";
                  }else if(value.length <= 5){
                    return "Username should be greater than 5";
                  }else
                    return null;
                },
              ),

              FlatButton(
                child: Text("Validate"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: (){
                  if(_key.currentState.validate()){
                    print("Your data is submitted");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
