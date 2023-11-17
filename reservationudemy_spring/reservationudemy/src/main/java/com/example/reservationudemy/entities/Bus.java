package com.example.reservationudemy.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor //constructor co tham so
@NoArgsConstructor //constructor khong tham so
@Entity(name = "bus")
public class Bus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long busId;

    private String busName;
    private String busType;
    private Integer totalSeat;
    @Column(unique = true)
    private String busNumber;

}
