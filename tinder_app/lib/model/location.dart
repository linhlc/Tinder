class Location {
  final String street;
  final String city;
  final String state;
  final String zip;

  Location({this.street, this.city, this.state, this.zip});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
    );
  }

  Location.fromMap(Map<String, dynamic> map)
      : street = map['street'],
        city = map['city'],
        state = map['state'],
        zip = map['zip'];
}
