// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Book {
  int? id;
  String? bookLocation;
  String? bookTime;
  String? orderTime;
  int? numOfBookedPassengers;

  String? expectedTimeForNextBus;
  String? dirverName;

  Book({
    this.id,
    this.bookLocation,
    this.bookTime,
    this.orderTime,
    this.numOfBookedPassengers,
    this.expectedTimeForNextBus,
    this.dirverName,
  });

  Book copyWith({
    int? id,
    String? bookLocation,
    String? bookTime,
    String? orderTime,
    int? numOfBookedPassengers,
    String? expectedTimeForNextBus,
    String? dirverName,
  }) {
    return Book(
      id: id ?? this.id,
      bookLocation: bookLocation ?? this.bookLocation,
      bookTime: bookTime ?? this.bookTime,
      orderTime: orderTime ?? this.orderTime,
      numOfBookedPassengers:
          numOfBookedPassengers ?? this.numOfBookedPassengers,
      expectedTimeForNextBus:
          expectedTimeForNextBus ?? this.expectedTimeForNextBus,
      dirverName: dirverName ?? this.dirverName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'bookLocation': bookLocation,
      'bookTime': bookTime,
      'orderTime': orderTime,
      'numOfBookedPassengers': numOfBookedPassengers,
      'expectedTimeForNextBus': expectedTimeForNextBus,
      'dirverName': dirverName,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] != null ? map['id'] as int : null,
      bookLocation:
          map['bookLocation'] != null ? map['bookLocation'] as String : null,
      bookTime: map['bookTime'] != null ? map['bookTime'] as String : null,
      orderTime: map['orderTime'] != null ? map['orderTime'] as String : null,
      numOfBookedPassengers: map['numOfBookedPassengers'] != null
          ? map['numOfBookedPassengers'] as int
          : null,
      expectedTimeForNextBus: map['expectedTimeForNextBus'] != null
          ? map['expectedTimeForNextBus'] as String
          : null,
      dirverName:
          map['dirverName'] != null ? map['dirverName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Book(id: $id, bookLocation: $bookLocation, bookTime: $bookTime, orderTime: $orderTime, numOfBookedPassengers: $numOfBookedPassengers, expectedTimeForNextBus: $expectedTimeForNextBus, dirverName: $dirverName)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.bookLocation == bookLocation &&
        other.bookTime == bookTime &&
        other.orderTime == orderTime &&
        other.numOfBookedPassengers == numOfBookedPassengers &&
        other.expectedTimeForNextBus == expectedTimeForNextBus &&
        other.dirverName == dirverName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        bookLocation.hashCode ^
        bookTime.hashCode ^
        orderTime.hashCode ^
        numOfBookedPassengers.hashCode ^
        expectedTimeForNextBus.hashCode ^
        dirverName.hashCode;
  }
}
