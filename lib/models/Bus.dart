import 'package:mowasulatuna/models/Seat.dart';
import 'package:mowasulatuna/models/passenger.dart';

import 'driver.dart';

class Bus {
  Driver? driver;
  List<Seat> seats = [
    Seat(seatCase: 0,name: '' , location: ''),
    Seat(seatCase: 0,name: '' , location: ''),
    Seat(seatCase: 0,name: '' , location: ''),
    Seat(seatCase: 0,name: '' , location: ''),
    Seat(seatCase: 0,name: '' , location: ''),
    Seat(seatCase: 0,name: '' , location: ''),
    Seat(seatCase: 0,name: '' , location: ''),
  ];
  List<Passenger> bookedPassengers = [];
}
