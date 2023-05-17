// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Seat {
  int seatCase = 0;
  String name = '';
  String location = '';
  
  Seat({
    required this.seatCase,
    required this.name,
    required this.location,
  });
  

  Seat copyWith({
    int? seatCase,
    String? name,
    String? location,
  }) {
    return Seat(
      seatCase: seatCase ?? this.seatCase,
      name: name ?? this.name,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'seatCase': seatCase,
      'name': name,
      'location': location,
    };
  }

  factory Seat.fromMap(Map<String, dynamic> map) {
    return Seat(
      seatCase: map['seatCase'] as int,
      name: map['name'] as String ,
      location: map['location'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Seat.fromJson(String source) => Seat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Seat(seatCase: $seatCase, name: $name, location: $location)';
  }

  @override
  bool operator ==(covariant Seat other) {
    if (identical(this, other)) return true;
  
    return 
      other.seatCase == seatCase &&
      other.name == name &&
      other.location == location;
  }

  @override
  int get hashCode {
    return seatCase.hashCode ^
      name.hashCode ^
      location.hashCode;
  }
}
