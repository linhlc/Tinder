import 'package:tinderapp/model/location.dart';
import 'package:tinderapp/model/name.dart';

class User{
  final String gender;
  final Name name;
  final Location location;
  final String picture;


  User({this.gender, this.name, this.location, this.picture});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      gender: json['gender'],
      name: json['name'],
      location: json['location'],
    );
  }

  User.fromMap(Map<String, dynamic> map)
      : gender = map['gender'],
        name = Name.fromMap(map['name']),
        location = Location.fromMap(map['location']),
        picture = map['picture'];
}