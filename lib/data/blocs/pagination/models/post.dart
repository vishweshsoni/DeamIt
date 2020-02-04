import 'package:equatable/equatable.dart';

class Post extends Equatable{

  final int id;
  final String title;
  final String body;
  const Post({this.id,this.body,this.title});

  @override
  List<Object> get props => [id,body,title];

  @override
  String toString() =>'Post{id : $id}';

}