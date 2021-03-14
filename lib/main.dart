import 'package:flutter/material.dart';
import 'services/user.dart';
import 'models/user_model.dart';

import 'user_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<UserModel> _users;
  bool _loading;

  void initState() {
    super.initState();
    _loading = true;
    User.getAll().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_loading ? 'Loading...' : 'Users'),
        ),
        body: Container(
          color: Colors.white,
          child: ListView.builder(
              itemCount: _users == null ? 0 : _users.length,
              itemBuilder: (context, index) {
                UserModel user = _users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email.toLowerCase()),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserDetail(user: user)));
                  },
                );
              }),
        ));
  }
}
