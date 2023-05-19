// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String? phone;
  String? password;
  bool? isDriver;

  User({
    this.phone,
    this.password,
    this.isDriver,
  });



  User copyWith({
    String? phone,
    String? password,
    bool? isDriver,
  }) {
    return User(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      isDriver: isDriver ?? this.isDriver,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'password': password,
      'isDriver': isDriver,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      phone: map['phone'] != null ? map['phone'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      isDriver: map['isDriver'] != null ? map['isDriver'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(phone: $phone, password: $password, isDriver: $isDriver)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return
      other.phone == phone &&
          other.password == password &&
          other.isDriver == isDriver;
  }

  @override
  int get hashCode => phone.hashCode ^ password.hashCode ^ isDriver.hashCode;
}
