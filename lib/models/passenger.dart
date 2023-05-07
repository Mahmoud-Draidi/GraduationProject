// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'Book.dart';

class Passenger {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? password;
  List<Book>? booksList;
  int? rate;
  Passenger({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.booksList,
    this.rate,
  });

  Passenger copyWith({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? password,
    List<Book>? booksList,
    int? rate,
  }) {
    return Passenger(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      booksList: booksList ?? this.booksList,
      rate: rate ?? this.rate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'booksList': booksList!.map((x) => x?.toMap()).toList(),
      'rate': rate,
    };
  }

  factory Passenger.fromMap(Map<String, dynamic> map) {
    return Passenger(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      booksList: map['booksList'] != null
          ? List<Book>.from(
              (map['booksList'] as List<int>).map<Book?>(
                (x) => Book.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      rate: map['rate'] != null ? map['rate'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Passenger.fromJson(String source) =>
      Passenger.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Passenger(id: $id, name: $name, phone: $phone, email: $email, password: $password, booksList: $booksList, rate: $rate)';
  }

  @override
  bool operator ==(covariant Passenger other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.email == email &&
        other.password == password &&
        listEquals(other.booksList, booksList) &&
        other.rate == rate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        password.hashCode ^
        booksList.hashCode ^
        rate.hashCode;
  }
}
