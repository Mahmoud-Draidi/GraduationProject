// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mowasulatuna/models/passenger.dart';

class Driver {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? password;
  bool turn = false;
  String? Location;
  List<Passenger>? passengersList;
  Driver({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.password,
    required this.turn,
    this.Location,
    this.passengersList,
  });
  // bool? isActive;

  Driver copyWith({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? password,
    bool? turn,
    String? Location,
    List<Passenger>? passengersList,
  }) {
    return Driver(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      turn: turn ?? this.turn,
      Location: Location ?? this.Location,
      passengersList: passengersList ?? this.passengersList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'turn': turn,
      'Location': Location,
      'passengersList': passengersList!.map((x) => x?.toMap()).toList(),
    };
  }

  factory Driver.fromMap(Map<String, dynamic> map) {
    return Driver(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      turn: map['turn'] as bool,
      Location: map['Location'] != null ? map['Location'] as String : null,
      passengersList: map['passengersList'] != null
          ? List<Passenger>.from(
              (map['passengersList'] as List<int>).map<Passenger?>(
                (x) => Passenger.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Driver.fromJson(String source) =>
      Driver.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Driver(id: $id, name: $name, phone: $phone, email: $email, password: $password, turn: $turn, Location: $Location, passengersList: $passengersList)';
  }

  @override
  bool operator ==(covariant Driver other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.email == email &&
        other.password == password &&
        other.turn == turn &&
        other.Location == Location &&
        listEquals(other.passengersList, passengersList);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        password.hashCode ^
        turn.hashCode ^
        Location.hashCode ^
        passengersList.hashCode;
  }
}
