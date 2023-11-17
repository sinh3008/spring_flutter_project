import 'package:flutter/material.dart';
import 'package:project_flutter_springboot/pages/add_bus_page.dart';
import 'package:project_flutter_springboot/pages/add_route_page.dart';
import 'package:project_flutter_springboot/pages/add_schedule_page.dart';
import 'package:project_flutter_springboot/pages/booking_confirmation_page.dart';
import 'package:project_flutter_springboot/pages/login_page.dart';
import 'package:project_flutter_springboot/pages/reservation_page.dart';
import 'package:project_flutter_springboot/pages/search_page.dart';
import 'package:project_flutter_springboot/pages/search_result_page.dart';
import 'package:project_flutter_springboot/pages/seat_plan_page.dart';
import 'package:project_flutter_springboot/providers/app_data_provider.dart';
import 'package:project_flutter_springboot/utils/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppDataProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        brightness: Brightness.dark,
      ),
      // home: const SearchPage(),
      initialRoute: routeNameHome,
      routes: {
        routeNameHome: (context) => const SearchPage(),
        routeNameSearchResultPage: (context) => const SearchResultPage(),
        routeNameSeatPlanPage: (context) => const SeatPlanPage(),
        routeNameBookingConfirmationPage: (context) =>
            const BookingConfirmationPage(),
        routeNameAddBusPage: (context) => const AddBusPage(),
        routeNameAddRoutePage: (context) => const AddRoutePage(),
        routeNameAddSchedulePage: (context) => const AddSchedulePage(),
        routeNameReservationPage: (context) => const ReservationPage(),
        routeNameLoginPage: (context) => const LoginPage(),
      },
    );
  }
}
