// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Seat {
  int? id;
  int seatCase = 0;
  String? name;
  String? location;
  
  Seat({
    this.id,
    required this.seatCase,
    this.name,
    this.location,
  });
  

  Seat copyWith({
    int? id,
    int? seatCase,
    String? name,
    String? location,
  }) {
    return Seat(
      id: id ?? this.id,
      seatCase: seatCase ?? this.seatCase,
      name: name ?? this.name,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'seatCase': seatCase,
      'name': name,
      'location': location,
    };
  }

  factory Seat.fromMap(Map<String, dynamic> map) {
    return Seat(
      id: map['id'] != null ? map['id'] as int : null,
      seatCase: map['seatCase'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Seat.fromJson(String source) => Seat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Seat(id: $id, seatCase: $seatCase, name: $name, location: $location)';
  }

  @override
  bool operator ==(covariant Seat other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.seatCase == seatCase &&
      other.name == name &&
      other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      seatCase.hashCode ^
      name.hashCode ^
      location.hashCode;
  }
}
