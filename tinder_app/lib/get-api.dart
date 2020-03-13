import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tinderapp/model/user.dart';
import 'package:tinderapp/model/location.dart';
import 'package:tinderapp/model/name.dart';

class GetApi {
  final String url;
  GetApi({this.url});

  /*Future<Location> fetchLocation() async {
    User user = await fetchUser();
    if(user != null){
      Map mapLocation = user.location;
      Location location = Location.fromMap(mapLocation);
      return location;
    }else{
      throw Exception('Failed to load user');
    }
  }

  Future<Name> fetchName() async {
    User user = await fetchUser();
    if(user != null){
      Map mapName = user.name;
      Name name = Name.fromMap(mapName);
      return name;
    }else{
      throw Exception('Failed to load user');
    }
  }*/

  Future<User> fetchUser() async{
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      Map mapUser = data['results'][0]['user'];
      User user = User.fromMap(mapUser);
      return user;
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<List<User>> getListUser() async{

  }
}
