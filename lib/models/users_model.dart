import 'package:json_annotation/json_annotation.dart';
part 'users_model.g.dart';

@JsonSerializable()
class User {
  String image;
  String email;

  User({required this.image, required this.email});

  factory User.fromJson(Map<String, dynamic>json){
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$UserToJson(this);
  }
}

