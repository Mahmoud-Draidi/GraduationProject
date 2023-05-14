// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class InfoBeitleed {
  int? numOfBusesInBeitleed;
  int? avgWaitingTime;
  int? numOfPassengersInBeitleed;
  String? AnabtaStreetState;
  String? ShufaStreetState;
  InfoBeitleed({
    this.numOfBusesInBeitleed,
    this.avgWaitingTime,
    this.numOfPassengersInBeitleed,
    this.AnabtaStreetState,
    this.ShufaStreetState,
  });

  InfoBeitleed copyWith({
    int? numOfBusesInBeitleed,
    int? avgWaitingTime,
    int? numOfPassengersInBeitleed,
    String? AnabtaStreetState,
    String? ShufaStreetState,
  }) {
    return InfoBeitleed(
      numOfBusesInBeitleed: numOfBusesInBeitleed ?? this.numOfBusesInBeitleed,
      avgWaitingTime: avgWaitingTime ?? this.avgWaitingTime,
      numOfPassengersInBeitleed:
          numOfPassengersInBeitleed ?? this.numOfPassengersInBeitleed,
      AnabtaStreetState: AnabtaStreetState ?? this.AnabtaStreetState,
      ShufaStreetState: ShufaStreetState ?? this.ShufaStreetState,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numOfBusesInBeitleed': numOfBusesInBeitleed,
      'avgWaitingTime': avgWaitingTime,
      'numOfPassengersInBeitleed': numOfPassengersInBeitleed,
      'AnabtaStreetState': AnabtaStreetState,
      'ShufaStreetState': ShufaStreetState,
    };
  }

  factory InfoBeitleed.fromMap(Map<String, dynamic> map) {
    return InfoBeitleed(
      numOfBusesInBeitleed: map['numOfBusesInBeitleed'] != null
          ? map['numOfBusesInBeitleed'] as int
          : null,
      avgWaitingTime:
          map['avgWaitingTime'] != null ? map['avgWaitingTime'] as int : null,
      numOfPassengersInBeitleed: map['numOfPassengersInBeitleed'] != null
          ? map['numOfPassengersInBeitleed'] as int
          : null,
      AnabtaStreetState: map['AnabtaStreetState'] != null
          ? map['AnabtaStreetState'] as String
          : null,
      ShufaStreetState: map['ShufaStreetState'] != null
          ? map['ShufaStreetState'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoBeitleed.fromJson(String source) =>
      InfoBeitleed.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InfoBeitleed(numOfBusesInBeitleed: $numOfBusesInBeitleed, avgWaitingTime: $avgWaitingTime, numOfPassengersInBeitleed: $numOfPassengersInBeitleed, AnabtaStreetState: $AnabtaStreetState, ShufaStreetState: $ShufaStreetState)';
  }

  @override
  bool operator ==(covariant InfoBeitleed other) {
    if (identical(this, other)) return true;

    return other.numOfBusesInBeitleed == numOfBusesInBeitleed &&
        other.avgWaitingTime == avgWaitingTime &&
        other.numOfPassengersInBeitleed == numOfPassengersInBeitleed &&
        other.AnabtaStreetState == AnabtaStreetState &&
        other.ShufaStreetState == ShufaStreetState;
  }

  @override
  int get hashCode {
    return numOfBusesInBeitleed.hashCode ^
        avgWaitingTime.hashCode ^
        numOfPassengersInBeitleed.hashCode ^
        AnabtaStreetState.hashCode ^
        ShufaStreetState.hashCode;
  }
}
