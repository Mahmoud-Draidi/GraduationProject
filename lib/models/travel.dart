// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Travel {
  int? id;
  String? dateAndTime;
  String? direction;
  String? path;
  String? travelTime;
  int? numOfPassengers;
  String? driverName;

  Travel({
    this.id,
    this.dateAndTime,
    this.direction,
    this.path,
    this.travelTime,
    this.numOfPassengers,
    this.driverName,
  });

  Travel copyWith({
    int? id,
    String? dateAndTime,
    String? direction,
    String? path,
    String? travelTime,
    int? numOfPassengers,
    String? driverName,
  }) {
    return Travel(
      id: id ?? this.id,
      dateAndTime: dateAndTime ?? this.dateAndTime,
      direction: direction ?? this.direction,
      path: path ?? this.path,
      travelTime: travelTime ?? this.travelTime,
      numOfPassengers: numOfPassengers ?? this.numOfPassengers,
      driverName: driverName ?? this.driverName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dateAndTime': dateAndTime,
      'direction': direction,
      'path': path,
      'travelTime': travelTime,
      'numOfPassengers': numOfPassengers,
      'driverName': driverName,
    };
  }

  factory Travel.fromMap(Map<String, dynamic> map) {
    return Travel(
      id: map['id'] != null ? map['id'] as int : null,
      dateAndTime:
          map['dateAndTime'] != null ? map['dateAndTime'] as String : null,
      direction: map['direction'] != null ? map['direction'] as String : null,
      path: map['path'] != null ? map['path'] as String : null,
      travelTime:
          map['travelTime'] != null ? map['travelTime'] as String : null,
      numOfPassengers:
          map['numOfPassengers'] != null ? map['numOfPassengers'] as int : null,
      driverName:
          map['driverName'] != null ? map['driverName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Travel.fromJson(String source) =>
      Travel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Travel(id: $id, dateAndTime: $dateAndTime, direction: $direction, path: $path, travelTime: $travelTime, numOfPassengers: $numOfPassengers, driverName: $driverName)';
  }

  @override
  bool operator ==(covariant Travel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.dateAndTime == dateAndTime &&
        other.direction == direction &&
        other.path == path &&
        other.travelTime == travelTime &&
        other.numOfPassengers == numOfPassengers &&
        other.driverName == driverName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        dateAndTime.hashCode ^
        direction.hashCode ^
        path.hashCode ^
        travelTime.hashCode ^
        numOfPassengers.hashCode ^
        driverName.hashCode;
  }
}
