import 'package:flutter/material.dart';
import 'models/user_model.dart';

class UserDetail extends StatefulWidget {
  final UserModel user;

  UserDetail({Key key, this.user}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    final user = widget.user;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  user.name,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Username',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  user.username,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  user.email,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
