import 'package:hive/hive.dart';
import 'package:hive_demo/model/user_model.dart';

class HiveDB{
  var box = Hive.box('zakariya_db');

  void storeUser(User user) async{
    box.put("user", user.toJson());
  }

  User loadUser(){
    var user = new User.fromJson(box.get("user"));
    return user;
  }

  void removeuser(){
    box.delete("user");
  }
}