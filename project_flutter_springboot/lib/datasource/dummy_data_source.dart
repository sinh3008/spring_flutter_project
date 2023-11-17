import 'package:project_flutter_springboot/datasource/data_source.dart';
import 'package:project_flutter_springboot/datasource/temp_db.dart';
import 'package:project_flutter_springboot/models/app_user.dart';
import 'package:project_flutter_springboot/models/auth_response_model.dart';
import 'package:project_flutter_springboot/models/bus_model.dart';
import 'package:project_flutter_springboot/models/bus_reservation.dart';
import 'package:project_flutter_springboot/models/bus_schedule.dart';
import 'package:project_flutter_springboot/models/but_route.dart';
import 'package:project_flutter_springboot/models/response_model.dart';
import 'package:project_flutter_springboot/utils/constants.dart';

class DummyDataSource extends DataSource {
  @override
  Future<ResponseModel> addBus(Bus bus) async {
    TempDB.tableBus.add(bus);
    return ResponseModel(
        responseStatus: ResponseStatus.SAVED,
        statusCode: 200,
        message: 'Bus Saved',
        object: {});
  }

  @override
  Future<ResponseModel> addReservation(BusReservation reservation) async {
    TempDB.tableReservation.add(reservation);
    print(TempDB.tableReservation.length);
    return ResponseModel(
      responseStatus: ResponseStatus.SAVED,
      statusCode: 200,
      message: 'Your reservation has been saved',
      object: {},
    );
  }

  @override
  Future<ResponseModel> addRoute(BusRoute busRoute) async {
    TempDB.tableRoute.add(busRoute);
    return ResponseModel(
        responseStatus: ResponseStatus.SAVED,
        statusCode: 200,
        message: 'Route Saved',
        object: {});
  }

  @override
  Future<ResponseModel> addSchedule(BusSchedule busSchedule) async {
    TempDB.tableSchedule.add(busSchedule);
    return ResponseModel(
        responseStatus: ResponseStatus.SAVED,
        statusCode: 200,
        message: 'Schedule Saved',
        object: {});
  }

  @override
  Future<List<Bus>> getAllBus() async {
    return TempDB.tableBus;
  }

  @override
  Future<List<BusReservation>> getAllReservation() async {
    return TempDB.tableReservation;
  }

  @override
  Future<List<BusRoute>> getAllRoutes() async {
    return TempDB.tableRoute;
  }

  @override
  Future<List<BusSchedule>> getAllSchedules() {
    // TODO: implement getAllSchedules
    throw UnimplementedError();
  }

  @override
  Future<List<BusReservation>> getReservationsByMobile(String mobile) async {
    return TempDB.tableReservation
        .where((element) => element.customer.mobile == mobile)
        .toList();
  }

  //
  @override
  Future<List<BusReservation>> getReservationsByScheduleAndDepartureDate(
      int scheduleId, String departureDate) async {
    return TempDB.tableReservation
        .where((element) =>
            element.busSchedule.scheduleId == scheduleId &&
            element.departureDate == departureDate)
        .toList();
  }

  @override
  Future<BusRoute?> getRouteByCityFromAndCityTo(
      String cityFrom, String cityTo) async {
    BusRoute route;
    try {
      route = TempDB.tableRoute.firstWhere((element) =>
          element.cityFrom == cityFrom && element.cityTo == cityTo);
      return route;
    } on StateError catch (error) {
      return null;
    }
  }

  @override
  Future<BusRoute?> getRouteByRouteName(String routeName) {
    // TODO: implement getRouteByRouteName
    throw UnimplementedError();
  }

  //phương thức này trả về list lịch trình xe bus
  @override
  Future<List<BusSchedule>> getSchedulesByRouteName(String routeName) async {
    return TempDB.tableSchedule
        .where((schedule) => schedule.busRoute.routeName == routeName)
        .toList();
  }

  @override
  Future<AuthResponseModel?> login(AppUser user) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
