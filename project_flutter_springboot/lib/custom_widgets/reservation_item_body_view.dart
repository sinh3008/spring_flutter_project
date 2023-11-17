import 'package:flutter/material.dart';
import 'package:project_flutter_springboot/models/reservation_expansion_item.dart';
import 'package:project_flutter_springboot/utils/constants.dart';

class ReservationItemBodyView extends StatelessWidget {
  final ReservationExpansionBody body;

  const ReservationItemBodyView({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Customer Name: ${body.customer.customerName}'),
          Text('Customer Mobile: ${body.customer.mobile}'),
          Text('Customer Email: ${body.customer.email}'),
          Text('Total Seat: ${body.totalSeatBooked}'),
          Text('Seat Number: ${body.seatNumbers}'),
          Text('Total Price: $currency${body.totalPrice}'),
        ],
      ),
    );
  }
}
