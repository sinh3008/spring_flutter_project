package com.example.reservationudemy.services;

import com.example.reservationudemy.entities.BusSchedule;

import java.util.List;

public interface BusScheduleService {
    BusSchedule addSchedule(BusSchedule busSchedule);
    List<BusSchedule> getAllBusSchedules();
    List<BusSchedule> getSchedulesByRoute(String routeName);
}
