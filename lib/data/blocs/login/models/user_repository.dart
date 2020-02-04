//Which help us to manage user data

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class UserRepository {
  //authenticate method which will return token
  //argument will be username and password
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async{
      await Future.delayed(Duration(seconds: 1));
      return;
  }

  Future<void> persistToken() async{
      await Future.delayed(Duration(seconds: 1));
      return;
  }

  Future<bool> hasToken() async{
      await Future.delayed(Duration(seconds: 1));
      return false;
  }

}
