import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paginate/data/blocs/login/authentication/authentication.dart';
import 'package:paginate/data/blocs/login/authentication/authentication_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Home'),
        ),
      body: Container(
          child: Center(
              child: RaisedButton(
                  child: Text('logout'),
                  onPressed: (){
                      BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                  },
              ),
          ),
      ),
    );

  }
}
