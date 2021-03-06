import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
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
  List accList = [];
  int indexList;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Şifreler"),
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
          indexList = index;

          return Card(
            child: ListTile(
              onLongPress: () {
                Toast.show("msg", context);
              },
              onTap: () {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Şifre: ${accList[index].password}"),
                        actions: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Tamam",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue,
                          ),
                        ],
                      );
                    });
              },
              trailing: _EntryPopUpMenu(index),
              leading: Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Icon(
                  Icons.lock,
                  size: 25,
                  color: Colors.blue,
                ),
              ),
              title: Text("Hesap: ${accList[index].accountName}"),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Kullancı Adı:${accList[index].userName}"),
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
      if (result == null) {
      } else {
        accList.add(result);
      }
    });
  }

  void _deleteEntry(int index) {
    setState(() {
      accList.removeAt(index);

    });
  }

    _sendDataToEntryScreen(BuildContext ctx,int index) async{
      var _editedValue = await Navigator.push(ctx,MaterialPageRoute(builder: (ctx)=>EntryScreen()));
      setState(() {
        accList[index] = _editedValue;
      });

    }


  Widget _EntryPopUpMenu(int index) {
    return PopupMenuButton(
        icon: Icon(
          Icons.settings,
          color: Colors.blue,
        ),
        onSelected: (value) {
          switch (value) {
            case 1:
              {
                Toast.show("Selection " + value.toString(), context);
                _deleteEntry(index);
              }
              break;
            case 2:
              {
                Toast.show("Selection" + value.toString(), context);
                _sendDataToEntryScreen(context, index);

              }
              break;
          }
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(Icons.delete),
                      ),
                      Text('Sil')
                    ],
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(Icons.edit),
                      ),
                      Text('Düzenle')
                    ],
                  )),
            ]);
  }
}
