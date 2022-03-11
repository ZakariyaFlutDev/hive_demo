import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_demo/model/user_model.dart';
import 'package:hive_demo/services/hive_service.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _doLogin(){
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var user = new User(username: username, password: password);

    HiveDB().storeUser(user);

    var user2 = HiveDB().loadUser();

    print(user2.username);
    print(user2.password);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Username",
                icon: Icon(Icons.email)
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  icon: Icon(Icons.lock)
              ),
            ),
            FlatButton(onPressed: _doLogin, child: Text("Login"), color: Colors.blue,)
          ],
        ),
      ),
    );
  }
}
