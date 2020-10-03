import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/ui/main_screen.dart';

class EntryScreen extends StatefulWidget {
  @override
  _EntryScreen createState() => _EntryScreen();
}

class _EntryScreen extends State<EntryScreen> {
  String accountName;
  String userName;
  String password;
  final accountNameController = TextEditingController();
  final userNameController = TextEditingController();
  final passWordController = TextEditingController();

  @override
  void Dispose() {
    userNameController.dispose();
    accountNameController.dispose();
    passWordController.dispose();
    super.dispose();
  }
  Accounts acc = new Accounts("","", "");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    accountName = accountNameController.text;
    userName = userNameController.text;
    password = passWordController.text;
    return Scaffold(
      appBar: AppBar(
        title: Text("Şifre Ekleme Ekranı"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: accountNameController,
            decoration: InputDecoration(labelText: "Hesap Adı:"),
          ),
          TextField(
            controller: userNameController,
            decoration: InputDecoration(labelText: "Kullanıcı Adı:"),
          ),
          TextField(
            controller: passWordController,
            decoration: InputDecoration(labelText: "Şifre"),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(290, 30, 10, 10),
            child: FloatingActionButton(
                child: Icon(Icons.save),
                onPressed: () {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("Onaylıyor musunuz?"),
                          actions: <Widget>[
                            RaisedButton(
                              onPressed: () {
                               _sendAccountInfotoMain(context);
                               Navigator.pop(context,acc);
                              },
                              child: Text("Evet"),
                            ),
                            RaisedButton(
                              onPressed: null,
                              child: Text("Hayır"),
                            )
                          ],
                        );
                      });
                }),
          ),

        ],
      ),
    );
  }

  void _sendAccountInfotoMain (BuildContext ctx){
    acc.setAccountName = accountNameController.text;
    acc.setUserName = userNameController.text;
    acc.setPasswords = passWordController.text;
    Navigator.pop(ctx,acc);
    debugPrint("Hello1");

  }
}

class Accounts {
  String _accountName;
  String _userName;
  String _password;

  Accounts(String name, String userName, String password) {
    this._accountName = name;
    this._password = password;
    this._userName = userName;
  }

  String get accountName {
    return _accountName;
  }

  String get userName {
    return _userName;
  }

  String get password {
    return _password;
  }

  void set setUserName(String userName) {
    if (userName != "") {
      this._userName = userName;
    } else {
      print("Error");
      this._userName = "UNDEFINED";
    }
  }

  void set setAccountName(String accountName) {
    if (accountName != "") {
      this._accountName = accountName;
    } else {
      print("ERROR");
      this._accountName = "UNDEFINED";
    }
  }

  void set setPasswords(String password) {
    if (password != "") {
      this._password = password;
    } else {
      print("ERROR");
      this._password = "UNDEFINED";
    }
  }
}
