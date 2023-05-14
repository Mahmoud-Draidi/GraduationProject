// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InfoTulkarm {
  int? numOfBusesInTulkarm;
  int? avgWaitingTime;
  int? numOfPassengersInTulkarm;
  String? AnabtaStreetState;
  String? ShufaStreetState;
  InfoTulkarm({
    this.numOfBusesInTulkarm,
    this.avgWaitingTime,
    this.numOfPassengersInTulkarm,
    this.AnabtaStreetState,
    this.ShufaStreetState,
  });

  InfoTulkarm copyWith({
    int? numOfBusesInTulkarm,
    int? avgWaitingTime,
    int? numOfPassengersInTulkarm,
    String? AnabtaStreetState,
    String? ShufaStreetState,
  }) {
    return InfoTulkarm(
      numOfBusesInTulkarm: numOfBusesInTulkarm ?? this.numOfBusesInTulkarm,
      avgWaitingTime: avgWaitingTime ?? this.avgWaitingTime,
      numOfPassengersInTulkarm:
          numOfPassengersInTulkarm ?? this.numOfPassengersInTulkarm,
      AnabtaStreetState: AnabtaStreetState ?? this.AnabtaStreetState,
      ShufaStreetState: ShufaStreetState ?? this.ShufaStreetState,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numOfBusesInTulkarm': numOfBusesInTulkarm,
      'avgWaitingTime': avgWaitingTime,
      'numOfPassengersInTulkarm': numOfPassengersInTulkarm,
      'AnabtaStreetState': AnabtaStreetState,
      'ShufaStreetState': ShufaStreetState,
    };
  }

  factory InfoTulkarm.fromMap(Map<String, dynamic> map) {
    return InfoTulkarm(
      numOfBusesInTulkarm: map['numOfBusesInTulkarm'] != null
          ? map['numOfBusesInTulkarm'] as int
          : null,
      avgWaitingTime:
          map['avgWaitingTime'] != null ? map['avgWaitingTime'] as int : null,
      numOfPassengersInTulkarm: map['numOfPassengersInTulkarm'] != null
          ? map['numOfPassengersInTulkarm'] as int
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

  factory InfoTulkarm.fromJson(String source) =>
      InfoTulkarm.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InfoTulkarm(numOfBusesInTulkarm: $numOfBusesInTulkarm, avgWaitingTime: $avgWaitingTime, numOfPassengersInTulkarm: $numOfPassengersInTulkarm, AnabtaStreetState: $AnabtaStreetState, ShufaStreetState: $ShufaStreetState)';
  }

  @override
  bool operator ==(covariant InfoTulkarm other) {
    if (identical(this, other)) return true;

    return other.numOfBusesInTulkarm == numOfBusesInTulkarm &&
        other.avgWaitingTime == avgWaitingTime &&
        other.numOfPassengersInTulkarm == numOfPassengersInTulkarm &&
        other.AnabtaStreetState == AnabtaStreetState &&
        other.ShufaStreetState == ShufaStreetState;
  }

  @override
  int get hashCode {
    return numOfBusesInTulkarm.hashCode ^
        avgWaitingTime.hashCode ^
        numOfPassengersInTulkarm.hashCode ^
        AnabtaStreetState.hashCode ^
        ShufaStreetState.hashCode;
  }
}
