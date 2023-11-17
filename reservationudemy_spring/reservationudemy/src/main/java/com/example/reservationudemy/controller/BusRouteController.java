package com.example.reservationudemy.controller;

import com.example.reservationudemy.entities.BusRoute;
import com.example.reservationudemy.models.ResponseModel;
import com.example.reservationudemy.services.BusRouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/route")
public class BusRouteController {
    @Autowired
    private BusRouteService busRouteService;

    @PostMapping("/add")
    public ResponseModel<BusRoute> addRoute(@RequestBody BusRoute busRoute) {
        final BusRoute busRoute1 = busRouteService.addRoute(busRoute);
        return new ResponseModel<>(HttpStatus.OK.value(), "Route Saved", busRoute1);
    }

    @GetMapping("/all")
    public ResponseEntity<List<BusRoute>> getAllRoutes() {
        return ResponseEntity.ok(busRouteService.getAllBusRoute());
    }

    @GetMapping("{routeName}")
    public ResponseEntity<BusRoute> getRouteByRouteName(@PathVariable(name = "routeName") String routeName) {
        return ResponseEntity.ok(busRouteService.getRouteByRouteName(routeName));
    }

    // câu query sẽ viết trên postman như sau:
    //localhost:8080/api/route/query?cityFrom=Chittagong&cityTo=Dhaka
    @GetMapping("/query")
    public ResponseEntity<BusRoute> getRouteByCityFromAndCityTo(
            @RequestParam String cityFrom,
            @RequestParam String cityTo
    ) {
        return ResponseEntity.ok(busRouteService.getRouteByCityFromAndCityTo(cityFrom, cityTo));
    }
}
