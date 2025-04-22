package com.example.hotel.controller;

import java.math.BigDecimal;
import java.io.IOException;
import java.sql.SQLException;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.hotel.model.Room;
import com.example.hotel.response.RoomResponse;
import com.example.hotel.service.IRoomService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/rooms")
@CrossOrigin(origins = "*") // Optional: Allow frontend calls
public class RoomController {

    private final IRoomService roomService;

    @PostMapping("/add/new-room")
    public ResponseEntity<RoomResponse> addNewRoom(
            @RequestParam("photo") MultipartFile photo,
            @RequestParam("roomType") String roomType,
            @RequestParam("roomPrice") BigDecimal roomPrice
    ) {
        try {
            Room savedRoom = roomService.addNewRoom(photo, roomType, roomPrice);
            RoomResponse response = new RoomResponse(
                savedRoom.getId(),
                savedRoom.getRoomType(),
                savedRoom.getRoomPrice()
            );
            return ResponseEntity.ok(response);
        } catch (IOException | SQLException e) {
            return ResponseEntity.internalServerError().build(); // Handle error properly
        }
    }
}