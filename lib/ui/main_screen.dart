import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:password_manager/ui/entry_screen.dart';

class MasterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      title: "Şifre Yöneticisi",
    );
  }
}

class MainScreen extends StatefulWidget {
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Accounts>accList =[];


  Accounts acc = new Accounts("", "", "");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Şifre Yöneticisi"),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                _awaitEntryScreenData(context);
              }),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.lock),
              title: Text("Hesap: ${accList[accList.length-1].accountName}"),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Kullancı Adı:${accList[accList.length-1].userName}"),
                  SizedBox(width: 20),
                  Text("Şifre:${accList[accList.length-1].password}"),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: accList.length,
      ),
    );
  }

  void _awaitEntryScreenData(BuildContext ctx) async {
    final Accounts result = await Navigator.push(
        ctx, MaterialPageRoute(builder: (ctx) => EntryScreen()));
    setState(() {
      if(result == null)
        {
          //Fluttertoast.showToast(msg: "Kayıt Bulunamadı.");
        }
      else {
        accList.add(result);

      }


    });
  }
}
