import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: new Container(
        padding: EdgeInsets.all(50.0),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.2, 0.4, 0.6, 0.8],
          colors: [
            Colors.blue[800],
            Colors.blue[600],
            Colors.blue[400],
            Colors.blue[200],
          ],
        )),
        child: Center(
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                height: 130.0,
              ),
              SizedBox(
                height: 35.0,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please Enter the Username";
                        } else if (value.length < 8) {
                          return "Username Should Not Exceed 8 Characters";
                        }
                      },
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          hintText: "Username",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please Enter the Password";
                        }
                      },
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          hintText: "Password",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.2, 0.4, 0.6, 0.8],
                    colors: [
                      Colors.blue[800],
                      Colors.blue[600],
                      Colors.blue[400],
                      Colors.blue[200],
                    ],
                  )),
                  child: ButtonTheme(
                    buttonColor: Colors.white10,
                    height: 50.0,
                    minWidth: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Form Validated Successfully"),
                          ));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstPage()));
                        } else {
                          scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Error in Form"),
                          ));
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  )),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Forget Password?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/google-logo.png',
                    height: 35.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Image.asset(
                    'assets/twitter.png',
                    height: 35.0,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }
}
