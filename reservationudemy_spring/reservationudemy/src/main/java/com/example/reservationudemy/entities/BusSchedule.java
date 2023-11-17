package com.example.reservationudemy.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "bus_schedule")
public class BusSchedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long scheduleId;

    //thể hiện quan hệ 1-1, (n-1 thì dùng many)
    @OneToOne
    @JoinColumn(name = "bus_id")
    private Bus bus;

    @OneToOne
    @JoinColumn(name = "bus_route_id")
    private BusRoute busRoute;

    private String departureTime;

    private Integer ticketPrice;

    private Integer discount;

    private Integer processingFee;
}
