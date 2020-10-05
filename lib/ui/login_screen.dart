import 'package:flutter/material.dart';

class LoginScreenMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passWordController = TextEditingController();

  @override
  void Dispose() {
    userNameController.dispose();
    passWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Şifre Yöneticisi"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: userNameController,
            decoration: InputDecoration(labelText: "Kullanıcı Adı"),
          ),
          Divider(
            height: 10,
            color: Colors.white,
          ),
          TextField(
            controller: passWordController,
            decoration: InputDecoration(labelText: "Şifre"),
          ),
          Divider(
            height: 10,
            color: Colors.white,
          ),
          FlatButton(
            minWidth: 300,
            onPressed: () {},
            child: Text("Giriş Yap", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class MasterUser {
  String _masterUserName;
  String _masterPassWord;

  /*Getter Methods*/
  String get MasterUserName {
    return _masterUserName;
  }

  String get MasterPassWord {
    return _masterPassWord;
  }

  /*Setter Methods*/

  set MasterUserName(String userName) {
    if (userName != "") {
      this._masterUserName = userName;
    } else {
      this._masterUserName = "UNDEFINED";
    }
  }

  set MasterPassWord(String passWord) {
    if (passWord != "") {
      this._masterPassWord = passWord;
    } else {
      this._masterPassWord = "UNDEFINED";
    }
  }
}
