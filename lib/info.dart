import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo extends StatefulWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  State<AppInfo> createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  String version = '';

  @override
  Widget build(BuildContext context) {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      version = packageInfo.version;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('AppInfo'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.sticky_note_2_outlined),
            title: Text("Licenses"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => LicensePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.sticky_note_2),
            title: Text("Riot Policies"),
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    title: Column(
                      children: [Text("Riot Policies")],
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('.'),
                          Text("."),
                          Text('.'),
                          Text('https://developer.riotgames.com/docs/lol\n'),
                          Text('.'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => {Navigator.pop(context)},
                        child: Text("OK"),
                      )
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text("."),
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    title: Column(
                      children: [Text(".")],
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('.'), Text('.')],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => {Navigator.pop(context)},
                        child: Text("OK"),
                      )
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.onetwothree),
            title: Text("Version"),
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    title: Column(
                      children: [Text(".")],
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Version : $version')],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => {Navigator.pop(context)},
                        child: Text("OK"),
                      )
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
