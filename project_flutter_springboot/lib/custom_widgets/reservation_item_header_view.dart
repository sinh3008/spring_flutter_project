import 'package:flutter/material.dart';
import 'package:project_flutter_springboot/models/reservation_expansion_item.dart';
import 'package:project_flutter_springboot/utils/helper_functions.dart';

class ReservationItemHeaderView extends StatelessWidget {
  final ReservationExpansionHeader header;

  const ReservationItemHeaderView({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('${header.departureDate} ${header.schedule.departureTime}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${header.schedule.busRoute.routeName}-'
                '${header.schedule.bus.busType}'),
            Text('Booking Time:'
                ' ${getFormattedDate(DateTime.fromMillisecondsSinceEpoch(header.timestamp), pattern: 'EEE MMM dd yyyy HH:mm')}'),
          ],
        ),
      ),
    );
  }
}
